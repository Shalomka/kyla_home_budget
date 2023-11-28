// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:kyla_home_budget/src/features/expenses/data/expense_type_enum.dart';

// Model that holds user expense data
class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String address;
  final ExpenseType expenseType;

  Expense({
    String? id,
    required this.title,
    required this.amount,
    required this.date,
    this.address = '',
    this.expenseType = ExpenseType.unassigned,
  }) : id = id ?? const Uuid().v4();

  Expense copyWith({
    String? id,
    String? title,
    double? amount,
    DateTime? date,
    String? address,
    ExpenseType? expenseType,
  }) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      address: address ?? this.address,
      expenseType: expenseType ?? this.expenseType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.millisecondsSinceEpoch,
      'address': address,
      'expenseType': expenseType.name,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as String,
      title: map['title'] as String,
      amount: map['amount'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      address: map['address'] as String,
      expenseType: ExpenseType.values.byName(map['expenseType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Expense.fromJson(String source) =>
      Expense.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Expense(id: $id, title: $title, amount: $amount, date: $date, address: $address, expenseType: $expenseType)';
  }

  @override
  bool operator ==(covariant Expense other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.amount == amount &&
        other.date == date &&
        other.address == address &&
        other.expenseType == expenseType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        amount.hashCode ^
        date.hashCode ^
        address.hashCode ^
        expenseType.hashCode;
  }
}
