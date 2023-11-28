import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kyla_home_budget/src/features/expenses/data/expense_model.dart';
import 'package:kyla_home_budget/src/features/expenses/data/expense_type_enum.dart';
import 'package:kyla_home_budget/src/features/expenses/providers/expenses_provider.dart';

void main() {
  group('ExpensesNotifier', () {
    test('removeExpense should remove the expense from the list', () {
      final notifier = ExpensesNotifier();
      final expense = Expense(
        id: '1',
        title: 'Groceries',
        amount: 50.0,
        date: DateTime.now(),
        address: '123 Main St',
        expenseType: ExpenseType.food,
      );
      notifier.state = AsyncValue.data([expense]);

      notifier.removeExpense(expense);

      expect(notifier.state.value, isEmpty);
    });
  });
}
