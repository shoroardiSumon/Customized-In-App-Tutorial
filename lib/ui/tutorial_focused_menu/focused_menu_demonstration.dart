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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TutorialProvider>().checkAndStartTutorial();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focused Menu Demo')),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonFocusedMenuHolder(
                tutorialIndex: 0,
                title: 'Info for Widget 1',
                child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text('Widget 1')
                ),
              ),
          
              const SizedBox(height: 20),
              CommonFocusedMenuHolder(
                tutorialIndex: 1,
                title: 'Info for Widget 2',
                child: Container(
                  height: 150,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text('Widget 2')
                ),
              ),
          
              const SizedBox(height: 20),
              CommonFocusedMenuHolder(
                tutorialIndex: 2,
                title: 'Info for Widget 3',
                child: Container(
                  height: 200,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text('Widget 3')
                ),
              ),

              const SizedBox(height: 20),
              CommonFocusedMenuHolder(
                tutorialIndex: 3,
                title: 'Info for Widget 4',
                child: Container(
                  height: 120,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text('Widget 4')
                ),
              ),

              const SizedBox(height: 20),
              CommonFocusedMenuHolder(
                tutorialIndex: 4,
                title: 'Info for Widget 5',
                child: Container(
                  height: 200,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text('Widget 5')
                ),
              ),

              const SizedBox(height: 20),
              CommonFocusedMenuHolder(
                tutorialIndex: 5,
                title: 'Info for Widget 6',
                child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text('Widget 6')
                ),
              ),


              const SizedBox(height: 20),
              CommonFocusedMenuHolder(
                tutorialIndex: 6,
                title: 'Info for Widget 7',
                child: Container(
                  height: 200,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text('Widget 7')
                ),
              ),

              const SizedBox(height: 20),
              CommonFocusedMenuHolder(
                tutorialIndex: 7,
                title: 'Info for Widget 9',
                child: Container(
                  height: 150,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text('Widget 9')
                ),
              ),

              const SizedBox(height: 20),
              CommonFocusedMenuHolder(
                tutorialIndex: 8,
                title: 'Info for Widget 9',
                child: Container(
                  height: 200,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text('Widget 9')
                ),
              ),

              const SizedBox(height: 20),
              CommonFocusedMenuHolder(
                tutorialIndex: 9,
                title: 'Info for Widget 10',
                child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text('Widget 10')
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
