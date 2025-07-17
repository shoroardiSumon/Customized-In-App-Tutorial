import 'package:apptour/core/provider/tutorial_provider.dart';
import 'package:apptour/ui/tutorial_focused_menu/common_focused_menu_holder.dart';
import 'package:apptour/ui/tutorial_focused_menu/tutorial_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Example class contributing two containers
class ContainerSet1 extends StatelessWidget {
  const ContainerSet1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonFocusedMenuHolder(
          screenName: 'home_page',
          tutorialIndex: 0,
          title: 'Info for Container 1',
          popupChild: const Text('This is the information for Container 1 from Set 1.'),
          child: Container(
            height: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: const Text('Container 1'),
          ),
        ),
        const SizedBox(height: 20),
        CommonFocusedMenuHolder(
          screenName: 'home_page',
          tutorialIndex: 1,
          title: 'Info for Container 2',
          popupChild: const Text('This is the information for Container 2 from Set 1.'),
          child: Container(
            height: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: const Text('Container 2'),
          ),
        ),
      ],
    );
  }
}

// Example class contributing two containers
class ContainerSet2 extends StatelessWidget {
  const ContainerSet2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonFocusedMenuHolder(
          screenName: 'home_page',
          tutorialIndex: 2,
          title: 'Info for Container 3',
          popupChild: const Text('This is the information for Container 3 from Set 2.'),
          child: Container(
            height: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: const Text('Container 3'),
          ),
        ),
        const SizedBox(height: 20),
        CommonFocusedMenuHolder(
          screenName: 'home_page',
          tutorialIndex: 3,
          title: 'Info for Container 4',
          popupChild: const Text('This is the information for Container 4 from Set 2.'),
          child: Container(
            height: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: const Text('Container 4'),
          ),
        ),
      ],
    );
  }
}

// Example class contributing two containers
class ContainerSet3 extends StatelessWidget {
  const ContainerSet3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonFocusedMenuHolder(
          screenName: 'home_page',
          tutorialIndex: 4,
          title: 'Info for Container 5',
          popupChild: const Text('This is the information for Container 5 from Set 3.'),
          child: Container(
            height: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: const Text('Container 5'),
          ),
        ),
        const SizedBox(height: 20),
        CommonFocusedMenuHolder(
          screenName: 'home_page',
          tutorialIndex: 5,
          title: 'Info for Container 6',
          popupChild: const Text('This is the information for Container 6 from Set 3.'),
          child: Container(
            height: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: const Text('Container 6'),
          ),
        ),
      ],
    );
  }
}

class MultiscreenSequence extends StatefulWidget {
  const MultiscreenSequence({super.key});

  @override
  State<MultiscreenSequence> createState() => _MultiscreenSequenceState();
}

class _MultiscreenSequenceState extends State<MultiscreenSequence> {
  static const String screenName = 'home_page';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TutorialProvider(),
      child: TutorialScreen(
        screenName: screenName,
        tutorialKeyCount: 6, // Total of 6 containers from 3 classes
        child: Scaffold(
          appBar: AppBar(title: const Text('Home Page')),
          body: const SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContainerSet1(),
                  SizedBox(height: 20),
                  ContainerSet2(),
                  SizedBox(height: 20),
                  ContainerSet3(),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}