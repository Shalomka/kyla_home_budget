import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyla_home_budget/src/features/core/ui/error_page.dart';
import 'package:kyla_home_budget/src/features/core/ui/loader_view.dart';
import 'package:kyla_home_budget/src/features/profile/ui/profile_scaffold.dart';
import 'package:kyla_home_budget/src/features/expenses/providers/expenses_provider.dart';
import 'package:kyla_home_budget/src/features/expenses/ui/expense_card.dart';

class OverviewPage extends ConsumerWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseLoader = ref.watch(expensesProvider);

    return ProfileScaffold(
      body: expenseLoader.when(
        data: (expenses) {
          //TODO: add an empty state
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 14),
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return DelayedDisplay(
                    delay:
                        Duration(milliseconds: index < 3 ? 100 * index : 300),
                    child: ExpenseCard(expenses[index]));
              },
              itemCount: expenses.length,
            ),
          );
        },
        loading: () => const LoaderView(),
        error: (error, stack) => ErrorPage(
          message: error.toString(),
        ),
      ),
    );
  }
}
