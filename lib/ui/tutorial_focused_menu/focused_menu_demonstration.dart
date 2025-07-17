import 'package:apptour/core/provider/tutorial_provider.dart';
import 'package:apptour/ui/tutorial_focused_menu/tutorial_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common_focused_menu_holder.dart';

class FocusedMenuDemonstration extends StatefulWidget {
  const FocusedMenuDemonstration({super.key});

  @override
  State<FocusedMenuDemonstration> createState() => _FocusedMenuDemonstrationState();
}

class _FocusedMenuDemonstrationState extends State<FocusedMenuDemonstration> {
  static const String screenName = 'focused_menu_demo';
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TutorialProvider(),
      child: TutorialScreen(
        screenName: screenName,
        tutorialKeyCount: 3, // Only 3 tutorials for this screen
        child: Scaffold(
          appBar: AppBar(title: const Text('Focused Menu Demo')),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonFocusedMenuHolder(
                    screenName: screenName,
                    tutorialIndex: 0,
                    title: 'Info for Widget 1',
                    popupChild: const Text('This is the information for Widget 1.'),
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Text('Widget 1'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CommonFocusedMenuHolder(
                    screenName: screenName,
                    tutorialIndex: 1,
                    title: 'Info for Widget 2',
                    popupChild: const Text('This is the information for Widget 2.'),
                    child: Container(
                      height: 150,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Text('Widget 2'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CommonFocusedMenuHolder(
                    screenName: screenName,
                    tutorialIndex: 2,
                    title: 'Info for Widget 3',
                    popupChild: const Text('This is the information for Widget 3.'),
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Text('Widget 3'),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}