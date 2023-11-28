import 'package:flutter/material.dart';

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
        child: Icon(
          Icons.info_outline,
          color: color,
          size: 32,
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
