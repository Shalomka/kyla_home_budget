import 'package:flutter/material.dart';
import 'package:kyla_home_budget/src/features/profile/data/user_model.dart';
import 'package:kyla_home_budget/src/features/profile/ui/components/app_avatar.dart';
import 'package:kyla_home_budget/src/features/profile/ui/components/masked_card_number.dart';

class ProfileBanner extends StatelessWidget {
  final double height;
  final User? user;
  const ProfileBanner(
    this.user, {
    super.key,
    this.height = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: user == null
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  AppAvatar(
                    url: user!.photoUrl,
                    radius: height * 2 / 3,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user!.fullName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        MaskedCardNumber(user!.cardNo)
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
