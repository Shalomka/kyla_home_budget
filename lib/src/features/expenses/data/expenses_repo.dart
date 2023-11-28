import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyla_home_budget/src/features/expenses/data/expense_model.dart';
import 'package:kyla_home_budget/src/features/expenses/data/expense_type_enum.dart';

final expensesRepoProvider = FutureProvider((ref) => ExpensesRepo());

class ExpensesRepo {
  // Get expenses from the database
  List<Expense> getExpenses() {
    return fakeExpenses;
  }

  // List of fake expenses
  final List<Expense> fakeExpenses = [
    Expense(
      title: 'Groceries',
      amount: 100.00,
      date: DateTime.now(),
      address: '123 Main St',
      expenseType: ExpenseType.shopping,
    ),
    Expense(
      title: 'Gas',
      amount: 50.00,
      date: DateTime.now(),
      address: '123 Main St',
      expenseType: ExpenseType.car,
    ),
    Expense(
      title: 'Rent',
      amount: 1000.00,
      date: DateTime.now(),
      address: '123 Main St',
      expenseType: ExpenseType.bills,
    ),
    Expense(
      title: 'Electricity',
      amount: 100.00,
      date: DateTime.now(),
      address: '123 Main St',
      expenseType: ExpenseType.bills,
    ),
    Expense(
      title: 'Water',
      amount: 50.00,
      date: DateTime.now(),
      address: '123 Main St',
      expenseType: ExpenseType.bills,
    ),
    Expense(
      title: 'Internet',
      amount: 100.00,
      date: DateTime.now(),
      address: '123 Main St',
      expenseType: ExpenseType.bills,
    ),
    Expense(
      title: 'Car Insurance',
      amount: 50.00,
      date: DateTime.now(),
      address: '123 Main St',
      expenseType: ExpenseType.car,
    ),
    Expense(
      title: 'Car Maintenance',
      amount: 100.00,
      date: DateTime.now(),
      address: '123 Main St',
      expenseType: ExpenseType.car,
    ),
  ];
}
