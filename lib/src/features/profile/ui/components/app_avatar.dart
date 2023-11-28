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
    return CircleAvatar(
      radius: radius ?? 30,
      backgroundImage: url != null ? NetworkImage(url!) : null,
      child: url == null
          ? const FaIcon(
              FontAwesomeIcons.user,
              size: 30,
              color: Colors.white,
            )
          : null,
    );
  }
}
