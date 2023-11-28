import 'package:flutter_riverpod/flutter_riverpod.dart';

final messagesProvider = FutureProvider<String>((ref) async {
  await Future.delayed(const Duration(seconds: 5));
  return 'You are too close to your budget limit';
});
