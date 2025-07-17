import 'package:apptour/core/provider/tutorial_provider2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TutorialScreen extends StatefulWidget {
  final String screenName;
  final int tutorialKeyCount;
  final Widget child;

  const TutorialScreen({
    super.key,
    required this.screenName,
    required this.tutorialKeyCount,
    required this.child,
  });

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  void initState() {
    super.initState();
    // Start the tutorial for the screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TutorialProvider2>().checkAndStartTutorial(
            context,
            widget.screenName,
            keyCount: widget.tutorialKeyCount,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}