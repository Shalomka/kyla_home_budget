import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddressView extends StatelessWidget {
  final String address;
  const AddressView(this.address, {super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleSmall;
    return Row(
      children: [
        FaIcon(FontAwesomeIcons.mapMarkerAlt,
            size: (style?.fontSize ?? 12) * 0.8, color: style?.color),
        const SizedBox(width: 8),
        Text(
          address,
          style: style,
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}
