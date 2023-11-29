import 'package:flutter_test/flutter_test.dart';
import 'package:kyla_home_budget/src/features/expenses/data/expense_model.dart';
import 'package:kyla_home_budget/src/features/expenses/data/expense_type_enum.dart';
import 'package:kyla_home_budget/src/features/expenses/providers/expenses_provider.dart';

import '../../../create_container.dart';

void main() {
  group('ExpensesNotifier', () {
    test('removeExpense should remove the expense from the list', () async {
      final container = createContainer();
      final expensesNotifier = container.read(expensesProvider.notifier);
      final expenses = container.read(expensesProvider.future);
      final expense = Expense(
        id: '1',
        title: 'Test',
        amount: 10,
        expenseType: ExpenseType.food,
        date: DateTime.now(),
      );
      // wait for the expenses to load
      await expectLater(expenses, completion(isA<List<Expense>>()));
      // add the expense
      expensesNotifier.addExpense(expense);
      await expectLater(expenses, completion(contains(expense)));
      // remove the expense
      expensesNotifier.removeExpense(expense);
      await expectLater(expenses, completion(isNot(contains(expense))));
    });
  });
}
