import 'package:flutter/material.dart';
import 'package:kyla_home_budget/src/features/core/extentions/date_extention.dart';

class MenuDateCard extends StatelessWidget {
  final DateTime date;
  const MenuDateCard({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          date.day.toString(),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).textTheme.bodySmall!.color,
              ),
        ),
        Text(
          date.shortMonthName.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
