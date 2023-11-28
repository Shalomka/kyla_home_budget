import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kyla_home_budget/src/features/expenses/ui/components/menu_date_card.dart';

class ExpensesAppBar extends ConsumerWidget {
  final Widget child;
  const ExpensesAppBar({super.key, this.child = const SizedBox()});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: MenuDateCard(date: date)),
        Expanded(child: child),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.ellipsisV),
          onPressed: () {},
        ),
      ],
    );
  }
}
