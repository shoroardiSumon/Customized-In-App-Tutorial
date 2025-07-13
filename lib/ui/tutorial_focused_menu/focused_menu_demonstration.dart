import 'package:apptour/core/provider/tutorial_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common_focused_menu_holder.dart';

class FocusedMenuDemonstration extends StatefulWidget {
  const FocusedMenuDemonstration({super.key});

  @override
  State<FocusedMenuDemonstration> createState() => _FocusedMenuDemonstrationState();
}

class _FocusedMenuDemonstrationState extends State<FocusedMenuDemonstration> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TutorialProvider(),
      child: Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<TutorialProvider>().checkAndStartTutorial(context);
          });
          return Scaffold(
            appBar: AppBar(title: const Text('Focused Menu Demo')),
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonFocusedMenuHolder(
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
                    // Add more widgets as needed, up to tutorialIndex 9
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}