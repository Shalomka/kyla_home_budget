import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyla_home_budget/src/features/profile/data/user_model.dart';

final userProvider = FutureProvider<User>((ref) async {
  return User.fake();
});
