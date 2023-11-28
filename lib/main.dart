import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyla_home_budget/src/home.dart';
import 'package:kyla_home_budget/theme.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: theme,
        home: const Home(),
      ),
    ),
  );
}
