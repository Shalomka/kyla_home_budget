import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpenseMenu extends StatefulWidget {
  final Color color;
  final double height;
  final double width;
  final Duration delay;
  const ExpenseMenu({
    this.color = Colors.green,
    this.height = 50,
    this.width = 160,
    this.delay = const Duration(milliseconds: 240),
    super.key,
  });

  @override
  State<ExpenseMenu> createState() => _ExpenseMenuState();
}

class _ExpenseMenuState extends State<ExpenseMenu> {
  bool isActive = false;
  bool isExpanded = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        isActive = true;
      });
    });
    // waiting the delay to expand the menu
    Future.delayed(widget.delay, () {
      setState(() {
        isExpanded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // iconsize
    final iconSize = widget.height * 0.4;

    return Center(
      child: AnimatedContainer(
        duration: widget.delay,
        curve: Curves.easeInOut,
        height: widget.height,
        width: isActive ? widget.width : 0,
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.height / 2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: isExpanded
              ? FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    children: [
                      // send
                      AnimatedSwitcher(
                        duration: Duration(
                            milliseconds: widget.delay.inMilliseconds + 240),
                        switchInCurve: Curves.easeOut,
                        switchOutCurve: Curves.easeIn,
                        child: isExpanded
                            ? IconButton(
                                iconSize: iconSize,
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.paperPlane),
                              )
                            : const SizedBox(width: 0),
                      ),
                      // edit
                      AnimatedSwitcher(
                        duration: Duration(
                            milliseconds: widget.delay.inMilliseconds + 120),
                        switchInCurve: Curves.easeOut,
                        switchOutCurve: Curves.easeIn,
                        child: isExpanded
                            ? IconButton(
                                onPressed: () {},
                                iconSize: iconSize,
                                icon: const FaIcon(FontAwesomeIcons.edit),
                              )
                            : const SizedBox(width: 0),
                      ),
                      // delete
                      AnimatedSwitcher(
                        duration: Duration(
                            milliseconds: widget.delay.inMilliseconds + 240),
                        child: isExpanded
                            ? IconButton(
                                onPressed: () {},
                                iconSize: iconSize,
                                icon: const FaIcon(
                                  FontAwesomeIcons.trash,
                                ),
                              )
                            : const SizedBox(width: 0),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
