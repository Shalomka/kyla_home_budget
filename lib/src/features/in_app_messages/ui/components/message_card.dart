import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessageCard extends StatelessWidget {
  final Widget? icon;
  final String message;
  final Color color;
  const MessageCard({
    super.key,
    this.icon,
    this.message = '',
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // icon
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: FaIcon(
          FontAwesomeIcons.fire,
          color: color,
        ),
      ),
      // message
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color,
                ),
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    ]);
  }
}
