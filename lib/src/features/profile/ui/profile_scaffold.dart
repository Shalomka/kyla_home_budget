import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyla_home_budget/src/features/expenses/ui/day_graph.dart';
import 'package:kyla_home_budget/src/features/expenses/ui/expenses_app_bar.dart';
import 'package:kyla_home_budget/src/features/in_app_messages/ui/in_app_message_view.dart';
import 'package:kyla_home_budget/src/features/profile/provider/user_provider.dart';
import 'package:kyla_home_budget/src/features/profile/ui/profile_banner.dart';

class ProfileScaffold extends ConsumerWidget {
  final Widget body;
  const ProfileScaffold({
    super.key,
    this.body = const SizedBox(),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    const profileHeight = 80.0;
    const infoAreaHeight = 100.0;

    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: profileHeight,
            ),
            SizedBox(
              height: infoAreaHeight,
              child: DayGraph(
                date: DateTime.now(),
              ),
            ),
            Expanded(child: body),
          ],
        ),
        const SizedBox(
          height: profileHeight + infoAreaHeight,
          child: Center(
            child: InAppMessageView(
              message: 'Test',
              height: profileHeight + infoAreaHeight,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ExpensesAppBar(
            child: ProfileBanner(user.value,
                key: ValueKey(user.value?.cardNo ?? 'empty'),
                height: profileHeight),
          ),
        ),
      ],
    )));
  }
}
