import 'package:apptour/core/provider/tutorial_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TutorialScreen extends StatefulWidget {
  final String screenName;
  final Widget child;
  final int tutorialKeyCount;

  const TutorialScreen({
    super.key,
    required this.screenName,
    required this.child,
    this.tutorialKeyCount = 10,
  });

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TutorialProvider>(
      builder: (context, tutorialProvider, child) {
        // Ensure the tutorial starts only after the widget is built
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (tutorialProvider.getTutorialKeys(widget.screenName).isEmpty) {
            tutorialProvider.checkAndStartTutorial(
              context, 
              widget.screenName, 
              keyCount: widget.tutorialKeyCount,
            );
          }
        });
        
        return widget.child;
      },
    );
  }
}