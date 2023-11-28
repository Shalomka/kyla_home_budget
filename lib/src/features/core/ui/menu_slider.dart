import 'package:flutter/material.dart';

enum MenuSliderValue {
  open,
  closed;
}

class MenuSlider extends StatefulWidget {
  final Widget child;
  final Widget menu;
  final double menuWidth;
  final VoidCallback? onSlideStart;
  final VoidCallback? onSlideEnd;
  final Function(MenuSliderValue isOpen)? onSlideChange;

  const MenuSlider({
    required this.child,
    required this.menu,
    this.menuWidth = 200.0,
    this.onSlideStart,
    this.onSlideEnd,
    this.onSlideChange,
    super.key,
  });

  @override
  MenuSliderState createState() => MenuSliderState();
}

class MenuSliderState extends State<MenuSlider> {
  bool isOpen = false;
  double slideOffset = 0.0;

  void _handleSlideStart(DragStartDetails details) {
    if (isOpen) {
      _closeMenu();
    }
    widget.onSlideStart?.call();
  }

  void _handleSlideEnd(DragEndDetails details) {
    if (slideOffset > widget.menuWidth / 2) {
      _openMenu();
    } else {
      _closeMenu();
    }
    widget.onSlideEnd?.call();
  }

  void _handleSlideUpdate(DragUpdateDetails details) {
    setState(() {
      slideOffset -= details.delta.dx;
    });
    if (slideOffset < 0) {
      _closeMenu();
    }
    if (slideOffset > widget.menuWidth) {
      _openMenu();
    }
  }

  void _closeMenu() {
    Future.delayed(const Duration(milliseconds: 240), () {
      setState(() {
        isOpen = false;
        slideOffset = 0.0;
        widget.onSlideChange?.call(MenuSliderValue.closed);
      });
    });
  }

  void _openMenu() {
    setState(() {
      isOpen = true;
      slideOffset = widget.menuWidth;
      widget.onSlideChange?.call(MenuSliderValue.open);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _handleSlideStart,
      onHorizontalDragEnd: _handleSlideEnd,
      onHorizontalDragUpdate: _handleSlideUpdate,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            width: widget.menuWidth,
            child: widget.menu,
          ),
          AnimatedPositioned(
              curve: Curves.easeInOut,
              top: 0,
              bottom: 0,
              right: slideOffset,
              width: MediaQuery.of(context).size.width,
              duration: const Duration(milliseconds: 120),
              child: widget.child),
        ],
      ),
    );
  }
}
