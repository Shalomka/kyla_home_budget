import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyla_home_budget/src/features/core/ui/error_page.dart';
import 'package:kyla_home_budget/src/features/core/ui/loader_view.dart';
import 'package:kyla_home_budget/src/features/expenses/providers/expenses_provider.dart';
import 'package:kyla_home_budget/src/features/expenses/ui/expense_card.dart';
import 'package:kyla_home_budget/src/features/in_app_messages/ui/in_app_message_view.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseLoader = ref.watch(expenseProvider);
    return Scaffold(
      body: expenseLoader.when(
        data: (expenses) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InAppMessageView(
                message: 'Hello World',
                onDismiss: () {},
                onAction: () {},
              ),
            ),
          );
          //TODO: add an empty state
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ExpenseCard(expenses[index]);
            },
            itemCount: expenses.length,
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
