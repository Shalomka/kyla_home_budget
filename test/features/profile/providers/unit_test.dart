import 'package:flutter_test/flutter_test.dart';
import 'package:kyla_home_budget/src/features/profile/data/user_model.dart';
import 'package:kyla_home_budget/src/features/profile/provider/user_provider.dart';

import '../../../create_container.dart';

void main() {
  test('userProvider returns a User object', () async {
    final container = createContainer();
    final user = await container.read(userProvider.future);

    expect(user, isA<User>());
  });
}
