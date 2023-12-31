import 'package:flutter/material.dart';
import 'package:kyla_home_budget/src/features/in_app_messages/ui/components/message_card.dart';
import 'package:kyla_home_budget/src/features/in_app_messages/ui/components/pulsating_container.dart';

class InAppMessageView extends StatefulWidget {
  final String message;
  final Function()? onDismiss;
  final Function()? onAction;
  final double height;

  const InAppMessageView(
      {super.key,
      required this.message,
      this.onDismiss,
      this.onAction,
      this.height = 200});

  @override
  State<InAppMessageView> createState() => _InAppMessageViewState();
}

class _InAppMessageViewState extends State<InAppMessageView> {
  final appearDuration = const Duration(milliseconds: 300);
  final allertFieldMaxHeight = 60.0;
  final allertFieldMaxWidth = 250.0;
  double allertFieldWidth = 60.0;

  bool isLoaded = false;
  bool isExpanded = false;
  bool isPulsating = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        isLoaded = true;
      });
      Future.delayed(appearDuration, () {
        setState(() {
          isExpanded = true;
          isPulsating = true;
          allertFieldWidth = allertFieldMaxWidth;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if message is empty, don't show anything
    if (widget.message.isEmpty) {
      return const SizedBox.shrink();
    }

    // if message is not empty, show the message
    return Dismissible(
      key: ValueKey(widget.message),
      direction: DismissDirection.endToStart,
      onUpdate: (details) {
        // stop pulsating animation if user is dragging the card
        if (details.progress > 0) {
          setState(() {
            isPulsating = false;
          });
        } else {
          setState(() {
            isPulsating = true;
          });
        }
      },
      onDismissed: (direction) {
        widget.onDismiss?.call();
      },
      child: SizedBox(
        height: widget.height,
        width: allertFieldMaxWidth,
        child: Center(
          child: AnimatedContainer(
            padding:
                const EdgeInsets.only(top: 0, bottom: 24, left: 0, right: 0),
            width: isExpanded ? allertFieldMaxWidth : allertFieldWidth,
            height: widget.height,
            duration: appearDuration,
            curve: Curves.easeOut,
            alignment: isLoaded ? Alignment.bottomCenter : Alignment.topCenter,
            child: PulsatingContainer(
              maxWidth: allertFieldWidth,
              maxHeight: allertFieldMaxHeight,
              pulsating: isPulsating,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: AnimatedSwitcher(
                duration: appearDuration,
                child: isExpanded
                    ? MessageCard(
                        key: ValueKey(widget.message),
                        message: widget.message,
                        color: Theme.of(context).colorScheme.onBackground,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
