import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyla_home_budget/src/features/expenses/data/expense_model.dart';
import 'package:kyla_home_budget/src/features/expenses/data/expenses_repo.dart';

class ExpensesNotifier extends AsyncNotifier<List<Expense>> {
  @override
  FutureOr<List<Expense>> build() async {
    final repo = await ref.read(expensesRepoProvider.future);
    return repo.getExpenses();
  }

  removeExpense(Expense expense) {
    final list = state.value;
    if (list == null) {
      return;
    }
    list.remove(expense);
  }
}

final expensesProvider = AsyncNotifierProvider<ExpensesNotifier, List<Expense>>(
    ExpensesNotifier.new);
