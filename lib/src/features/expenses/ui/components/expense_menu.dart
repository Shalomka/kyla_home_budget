import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpenseMenu extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final bool active;
  const ExpenseMenu({
    this.color = Colors.green,
    this.height = 50,
    this.width = 160,
    this.active = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // iconsize
    final iconSize = height * 0.4;

    return SizedBox.shrink(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: height,
        width: active ? width : 0,
        decoration: BoxDecoration(
            color: active ? color : Colors.transparent,
            borderRadius: BorderRadius.circular(height / 2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              // send
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: active
                    ? IconButton(
                        key: const ValueKey('send'),
                        iconSize: iconSize,
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.paperPlane),
                      )
                    : const SizedBox(),
              ),
              // edit
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 120),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: active
                    ? IconButton(
                        onPressed: () {},
                        iconSize: iconSize,
                        icon: const FaIcon(FontAwesomeIcons.edit),
                      )
                    : const SizedBox(),
              ),
              // delete
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                child: active
                    ? IconButton(
                        onPressed: () {},
                        iconSize: iconSize,
                        icon: const FaIcon(
                          FontAwesomeIcons.trash,
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
