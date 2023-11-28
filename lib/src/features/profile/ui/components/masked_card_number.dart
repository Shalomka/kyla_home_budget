import 'package:flutter/material.dart';

class MaskedCardNumber extends StatelessWidget {
  final String cardNo;
  const MaskedCardNumber(this.cardNo, {super.key});

  @override
  Widget build(BuildContext context) {
    final maskedNumber =
        '${cardNo.substring(0, 4)} **** **** ${cardNo.substring(12)}';
    return Row(
      children: [
        Text(
          maskedNumber,
          style: Theme.of(context).textTheme.bodySmall,
        ),

        // TODO: add mastercard logo
      ],
    );
  }
}
