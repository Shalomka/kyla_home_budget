import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kyla_home_budget/src/features/expenses/data/expense_model.dart';
import 'package:kyla_home_budget/src/features/expenses/ui/components/address_view.dart';

// Showa detailed expense information
class ExpenseDetails extends StatelessWidget {
  final Expense expense;
  final double height;

  const ExpenseDetails(this.expense, {this.height = 90, super.key});

  @override
  Widget build(BuildContext context) {
    final date = expense.date;
    final iconSize = height * 0.7;

    return Container(
      height: height,
      decoration: BoxDecoration(
        // rounded border on a right side
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(height / 2),
          bottomRight: Radius.circular(height / 2),
        ),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 12, right: height / 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // expese icon
            Container(
                height: iconSize,
                width: iconSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(iconSize / 2),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.tertiary.withAlpha(50),
                    width: 2,
                  ),
                ),
                child: Center(child: FaIcon(expense.expenseType.icon))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // expense amount
                    Text('- \$ ${expense.amount.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge),
                    // expense title
                    Text(
                      expense.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.fade,
                    ),
                    // expense amount
                    AddressView(expense.address)
                  ],
                ),
              ),
            ),
            // expense date
            Text('${date.hour}:${date.minute}',
                style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
