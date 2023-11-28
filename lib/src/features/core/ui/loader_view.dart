import 'package:flutter/material.dart';

class LoaderView extends StatefulWidget {
  final Duration delay;
  const LoaderView({
    super.key,
    this.delay = const Duration(milliseconds: 500),
  });

  @override
  State<LoaderView> createState() => _LoaderViewState();
}

class _LoaderViewState extends State<LoaderView> {
  final loadingIndicator = const CircularProgressIndicator();
  bool isDelayed = true;

  @override
  void initState() {
    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() {
          isDelayed = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: isDelayed ? const SizedBox() : loadingIndicator,
    );
  }
}
