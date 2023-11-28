import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppAvatar extends StatelessWidget {
  final String? url;
  final double? radius;

  const AppAvatar({
    Key? key,
    this.url,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: url != null
            ? DecorationImage(
                image: NetworkImage(url!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: url == null
          ? const Center(
              child: FaIcon(
                FontAwesomeIcons.user,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
