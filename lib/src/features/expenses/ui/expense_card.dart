import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kyla_home_budget/src/features/core/ui/menu_slider.dart';
import 'package:kyla_home_budget/src/features/expenses/data/expense_model.dart';
import 'package:kyla_home_budget/src/features/expenses/ui/components/expense_details.dart';
import 'package:kyla_home_budget/src/features/expenses/ui/components/expense_menu.dart';

class ExpenseCard extends StatefulWidget {
  final Expense expense;
  const ExpenseCard(this.expense, {super.key});

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: MenuSlider(
        menu: ExpenseMenu(active: isOpen),
        onSlideChange: (MenuSliderValue value) {
          setState(() {
            isOpen = value == MenuSliderValue.open;
          });
        },
        child: ExpenseDetails(widget.expense),
      ),
    );
  }
}
