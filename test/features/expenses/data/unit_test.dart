import 'package:flutter_test/flutter_test.dart';
import 'package:kyla_home_budget/src/features/expenses/data/expense_model.dart';
import 'package:kyla_home_budget/src/features/expenses/data/expense_type_enum.dart';

void main() {
  group('Expense', () {
    test('should create an instance of Expense', () {
      // Arrange
      const id = '1';
      const title = 'Groceries';
      const amount = 50.0;
      final date = DateTime.now();
      const address = '123 Main St';
      const expenseType = ExpenseType.food;

      // Act
      final expense = Expense(
        id: id,
        title: title,
        amount: amount,
        date: date,
        address: address,
        expenseType: expenseType,
      );

      // Assert
      expect(expense.id, id);
      expect(expense.title, title);
      expect(expense.amount, amount);
      expect(expense.date, date);
      expect(expense.address, address);
      expect(expense.expenseType, expenseType);
    });

    test('should create a copy of Expense with updated values', () {
      // Arrange
      final expense = Expense(
        id: '1',
        title: 'Groceries',
        amount: 50.0,
        date: DateTime.now(),
        address: '123 Main St',
        expenseType: ExpenseType.food,
      );

      const updatedTitle = 'Shopping';
      const updatedAmount = 100.0;
      final updatedDate = DateTime.now().add(const Duration(days: 1));
      const updatedAddress = '456 Elm St';
      const updatedExpenseType = ExpenseType.shopping;

      // Act
      final updatedExpense = expense.copyWith(
        title: updatedTitle,
        amount: updatedAmount,
        date: updatedDate,
        address: updatedAddress,
        expenseType: updatedExpenseType,
      );

      // Assert
      expect(updatedExpense.id, expense.id);
      expect(updatedExpense.title, updatedTitle);
      expect(updatedExpense.amount, updatedAmount);
      expect(updatedExpense.date, updatedDate);
      expect(updatedExpense.address, updatedAddress);
      expect(updatedExpense.expenseType, updatedExpenseType);
    });

    test('should convert Expense to a map', () {
      // Arrange
      final expense = Expense(
        id: '1',
        title: 'Groceries',
        amount: 50.0,
        date: DateTime.now(),
        address: '123 Main St',
        expenseType: ExpenseType.food,
      );

      // Act
      final expenseMap = expense.toMap();

      // Assert
      expect(expenseMap['id'], expense.id);
      expect(expenseMap['title'], expense.title);
      expect(expenseMap['amount'], expense.amount);
      expect(expenseMap['date'], expense.date.millisecondsSinceEpoch);
      expect(expenseMap['address'], expense.address);
      expect(expenseMap['expenseType'], expense.expenseType.name);
    });

    test('should create Expense from a map', () {
      // Arrange
      final expenseMap = {
        'id': '1',
        'title': 'Groceries',
        'amount': 50.0,
        'date': DateTime.now().millisecondsSinceEpoch,
        'address': '123 Main St',
        'expenseType': ExpenseType.food.name,
      };

      // Act
      final expense = Expense.fromMap(expenseMap);

      // Assert
      expect(expense.id, expenseMap['id']);
      expect(expense.title, expenseMap['title']);
      expect(expense.amount, expenseMap['amount']);
      expect(expense.date.millisecondsSinceEpoch, expenseMap['date']);
      expect(expense.address, expenseMap['address']);
      expect(expense.expenseType,
          ExpenseType.values.byName(expenseMap['expenseType'] as String));
    });

    test('should convert Expense to JSON', () {
      // Arrange
      final expense = Expense(
        id: '1',
        title: 'Groceries',
        amount: 50.0,
        date: DateTime.now(),
        address: '123 Main St',
        expenseType: ExpenseType.food,
      );

      // Act
      final expenseJson = expense.toJson();

      // Assert
      final expectedJson =
          '{"id":"1","title":"Groceries","amount":50.0,"date":${expense.date.millisecondsSinceEpoch},"address":"123 Main St","expenseType":"food"}';
      expect(expenseJson, expectedJson);
    });

    test('should create Expense from JSON', () {
      // Arrange
      const expenseJson =
          '{"id":"1","title":"Groceries","amount":50.0,"date":1634567890000,"address":"123 Main St","expenseType":"food"}';

      // Act
      final expense = Expense.fromJson(expenseJson);

      // Assert
      expect(expense.id, '1');
      expect(expense.title, 'Groceries');
      expect(expense.amount, 50.0);
      expect(expense.date, DateTime.fromMillisecondsSinceEpoch(1634567890000));
      expect(expense.address, '123 Main St');
      expect(expense.expenseType, ExpenseType.food);
    });

    test('should check equality of Expense instances', () {
      final dateTime = DateTime.now();
      // Arrange
      final expense1 = Expense(
        id: '1',
        title: 'Groceries',
        amount: 50.0,
        date: dateTime,
        address: '123 Main St',
        expenseType: ExpenseType.food,
      );

      final expense2 = Expense(
        id: '1',
        title: 'Groceries',
        amount: 50.0,
        date: dateTime,
        address: '123 Main St',
        expenseType: ExpenseType.food,
      );

      final expense3 = Expense(
        id: '2',
        title: 'Shopping',
        amount: 100.0,
        date: dateTime.add(const Duration(days: 1)),
        address: '456 Elm St',
        expenseType: ExpenseType.shopping,
      );

      // Act & Assert
      expect(expense1, expense2);
      expect(expense1, isNot(expense3));
    });

    test('should calculate hash code of Expense instance', () {
      // Arrange
      final expense = Expense(
        id: '1',
        title: 'Groceries',
        amount: 50.0,
        date: DateTime.now(),
        address: '123 Main St',
        expenseType: ExpenseType.food,
      );

      final expectedHashCode = expense.id.hashCode ^
          expense.title.hashCode ^
          expense.amount.hashCode ^
          expense.date.hashCode ^
          expense.address.hashCode ^
          expense.expenseType.hashCode;

      // Act
      final hashCode = expense.hashCode;

      // Assert
      expect(hashCode, expectedHashCode);
    });
  });
}
