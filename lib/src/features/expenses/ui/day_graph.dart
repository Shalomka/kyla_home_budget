import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyla_home_budget/src/features/expenses/providers/expenses_provider.dart';

class DayGraph extends ConsumerStatefulWidget {
  final DateTime date;
  final double height;
  final TextStyle? lableStyle;
  final EdgeInsetsGeometry contentPadding;
  const DayGraph(
      {super.key,
      this.height = 100,
      required this.date,
      this.lableStyle,
      this.contentPadding = const EdgeInsets.symmetric(vertical: 8)});

  @override
  ConsumerState<DayGraph> createState() => _DayGraphState();
}

class _DayGraphState extends ConsumerState<DayGraph> {
  final controller = ScrollController();
  final dayWidth = 24.0;

  @override
  void initState() {
    // if the day is today, animateto the current hour
    if (widget.date.day == DateTime.now().day) {
      Future.delayed(const Duration(milliseconds: 300), () {
        controller.animateTo(
          DateTime.now().hour * dayWidth,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final expensesLoader = ref.watch(expensesProvider);
    final labelStyle = widget.lableStyle ??
        Theme.of(context).textTheme.caption?.copyWith(fontSize: 12);
    final labelHeight = labelStyle?.fontSize ?? 12;
    final graphMaxHeight =
        widget.height - labelHeight - widget.contentPadding.vertical - 4;

    return SizedBox(
      height: widget.height,
      child: Padding(
        padding: widget.contentPadding,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 240),
          child: expensesLoader.when(
            data: (allExpenses) {
              // filter expenses for a givven day
              final expenses = allExpenses.where((expense) {
                return expense.date.day == widget.date.day &&
                    expense.date.month == widget.date.month &&
                    expense.date.year == widget.date.year;
              }).toList();

              // expenses by hour
              final expensesByHour = <int, double>{};
              for (final expense in expenses) {
                final hour = expense.date.hour;
                final amount = expensesByHour[hour] ?? 0;
                expensesByHour[hour] = amount + expense.amount;
              }

              // max amount
              final maxAmount = expensesByHour.values.reduce((value, element) {
                return value > element ? value : element;
              });

              // graph
              return ListView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                key: ValueKey(
                    '${widget.date.year}-${widget.date.month}-${widget.date.day}'),
                children: [
                  for (var i = 0; i < 24; i++)
                    Expanded(
                      child: SizedBox(
                        width: dayWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: expensesByHour[i] != null
                                  ? Container(
                                      color: Colors.blue,
                                      width: 4,
                                      height: graphMaxHeight *
                                          expensesByHour[i]! /
                                          maxAmount,
                                    )
                                  : null,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              height: labelHeight,
                              child: Text(
                                i.toString(),
                                style: Theme.of(context).textTheme.caption,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                ],
              );
            },
            loading: () => const SizedBox(),
            error: (error, stack) => const SizedBox(),
          ),
        ),
      ),
    );
  }
}
