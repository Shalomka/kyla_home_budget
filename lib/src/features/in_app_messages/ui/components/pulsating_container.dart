import 'package:flutter/material.dart';

class PulsatingContainer extends StatefulWidget {
  final bool pulsating;
  final double maxWidth;
  final double maxHeight;
  final Color color;
  final Color pulsatingColor;
  final Color backgroundColor;
  final Duration duration;
  final Widget? child;

  const PulsatingContainer({
    Key? key,
    this.pulsating = true,
    this.maxWidth = 300,
    this.maxHeight = 80,
    this.color = const Color.fromARGB(255, 244, 92, 54),
    this.pulsatingColor = const Color.fromARGB(255, 244, 92, 54),
    this.backgroundColor = Colors.white,
    this.duration = const Duration(milliseconds: 600),
    this.child,
  }) : super(key: key);

  @override
  PulsatingContainerState createState() => PulsatingContainerState();
}

class PulsatingContainerState extends State<PulsatingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late final double gapCoefficient = 0.2;
  late final double maxGapWidth = widget.maxWidth * gapCoefficient;
  late final double maxGapHeight = widget.maxHeight * gapCoefficient;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('PulsatingContainerState.build wirh child ${widget.child?.key}');
    return SizedBox(
      height: widget.maxHeight,
      width: widget.maxWidth,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          final double reverseAnimation = 1 - _animation.value;

          return Stack(
            children: [
              // pulsating background
              Center(
                child: AnimatedOpacity(
                  duration: Duration(
                      milliseconds: widget.duration.inMilliseconds ~/ 2),
                  opacity: widget.pulsating
                      ? reverseAnimation > 0.5
                          ? reverseAnimation
                          : 0
                      : 0,
                  child: Container(
                    width: widget.maxWidth - reverseAnimation * maxGapWidth,
                    height: widget.maxHeight - reverseAnimation * maxGapHeight,
                    decoration: BoxDecoration(
                      color: widget.pulsatingColor,
                      borderRadius: BorderRadius.circular(widget.maxHeight / 2),
                    ),
                  ),
                ),
              ),
              // pulsating message container
              Center(
                child: Container(
                  width: widget.pulsating
                      ? widget.maxWidth - _animation.value * maxGapWidth
                      : widget.maxWidth,
                  height: widget.pulsating
                      ? widget.maxHeight - _animation.value * maxGapHeight
                      : widget.maxHeight,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(widget.maxHeight / 2),
                    boxShadow: [
                      BoxShadow(
                        color: widget.backgroundColor,
                        spreadRadius: maxGapHeight / 4,
                        blurRadius: maxGapHeight / 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
              // message card
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: widget.child ?? const SizedBox.shrink(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
