// import 'package:apptour/core/provider/tutorial_provider.dart';
// import 'package:apptour/ui/tutorial_focused_menu/common_focused_menu_holder.dart';
// import 'package:apptour/ui/tutorial_focused_menu/tutorial_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// // Example class contributing two containers
// class ContainerSet1 extends StatelessWidget {
//   const ContainerSet1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CommonFocusedMenuHolder(
//           screenName: 'home_page',
//           tutorialIndex: 0,
//           title: 'Info for Container 1',
//           popupChild: const Text('This is the information for Container 1 from Set 1.'),
//           child: Container(
//             height: 100,
//             alignment: Alignment.center,
//             decoration: const BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//             ),
//             child: const Text('Container 1'),
//           ),
//         ),
//         const SizedBox(height: 20),
//         CommonFocusedMenuHolder(
//           screenName: 'home_page',
//           tutorialIndex: 1,
//           title: 'Info for Container 2',
//           popupChild: const Text('This is the information for Container 2 from Set 1.'),
//           child: Container(
//             height: 100,
//             alignment: Alignment.center,
//             decoration: const BoxDecoration(
//               color: Colors.redAccent,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//             ),
//             child: const Text('Container 2'),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // Example class contributing two containers
// class ContainerSet2 extends StatelessWidget {
//   const ContainerSet2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CommonFocusedMenuHolder(
//           screenName: 'home_page',
//           tutorialIndex: 2,
//           title: 'Info for Container 3',
//           popupChild: const Text('This is the information for Container 3 from Set 2.'),
//           child: Container(
//             height: 100,
//             alignment: Alignment.center,
//             decoration: const BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//             ),
//             child: const Text('Container 3'),
//           ),
//         ),
//         const SizedBox(height: 20),
//         CommonFocusedMenuHolder(
//           screenName: 'home_page',
//           tutorialIndex: 3,
//           title: 'Info for Container 4',
//           popupChild: const Text('This is the information for Container 4 from Set 2.'),
//           child: Container(
//             height: 100,
//             alignment: Alignment.center,
//             decoration: const BoxDecoration(
//               color: Colors.greenAccent,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//             ),
//             child: const Text('Container 4'),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // Example class contributing two containers
// class ContainerSet3 extends StatelessWidget {
//   const ContainerSet3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CommonFocusedMenuHolder(
//           screenName: 'home_page',
//           tutorialIndex: 4,
//           title: 'Info for Container 5',
//           popupChild: const Text('This is the information for Container 5 from Set 3.'),
//           child: Container(
//             height: 100,
//             alignment: Alignment.center,
//             decoration: const BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//             ),
//             child: const Text('Container 5'),
//           ),
//         ),
//         const SizedBox(height: 20),
//         CommonFocusedMenuHolder(
//           screenName: 'home_page',
//           tutorialIndex: 5,
//           title: 'Info for Container 6',
//           popupChild: const Text('This is the information for Container 6 from Set 3.'),
//           child: Container(
//             height: 100,
//             alignment: Alignment.center,
//             decoration: const BoxDecoration(
//               color: Colors.blueAccent,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//             ),
//             child: const Text('Container 6'),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class MultiscreenSequence extends StatefulWidget {
//   const MultiscreenSequence({super.key});

//   @override
//   State<MultiscreenSequence> createState() => _MultiscreenSequenceState();
// }

// class _MultiscreenSequenceState extends State<MultiscreenSequence> {
//   static const String screenName = 'home_page';

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => TutorialProvider(),
//       child: TutorialScreen(
//         screenName: screenName,
//         tutorialKeyCount: 3, // Total of 6 containers from 3 classes
//         child: Scaffold(
//           appBar: AppBar(title: const Text('Home Page')),
//           body: const SingleChildScrollView(
//             physics: ClampingScrollPhysics(),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ContainerSet1(),
//                   SizedBox(height: 20),
//                   // ContainerSet2(),
//                   // SizedBox(height: 20),
//                   // ContainerSet3(),
//                   // SizedBox(height: 40),
//                 ],
//               ),
//             ),
//           ),
//           // FAB wrapped with CommonFocusedMenuHolder for the tutorial
//           floatingActionButton: CommonFocusedMenuHolder(
//             screenName: 'home_page',
//             tutorialIndex: 2, // Last step after containers
//             title: 'Info for Floating Action Button',
//             popupChild: const Text('This is the information for the Floating Action Button.'),
//             child: FloatingActionButton(
//               onPressed: () {
//                 // FAB action
//               },
//               child: const Icon(Icons.add),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:apptour/core/provider/tutorial_provider.dart';
import 'package:apptour/ui/tutorial_focused_menu/common_focused_menu_holder.dart';
import 'package:apptour/ui/tutorial_focused_menu/tutorial_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Example class with ListView.builder, first item and its icon in tutorial
class ContainerSet1 extends StatelessWidget {
  const ContainerSet1({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for ListView
    final List<String> items = List.generate(5, (index) => 'Item ${index + 1}');

    return SizedBox(
      height: 120, // Fixed height for ListView to fit one item visibly
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          // Only the first item (index == 0) is part of the tutorial
          if (index == 0) {
            return CommonFocusedMenuHolder(
              screenName: 'home_page',
              tutorialIndex: 0, // First tutorial step
              title: 'Info for List Item 1',
              popupChild: const Text('This is the information for the first list item.'),
              child: Container(
                width: 150,
                margin: const EdgeInsets.only(right: 10),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Item 1'),
                    SizedBox(width: 10),
                    // Icon wrapped with CommonFocusedMenuHolder for tutorial
                    CommonFocusedMenuHolder(
                      screenName: 'home_page',
                      tutorialIndex: 1, // Second tutorial step
                      title: 'Info for Item 1 Icon',
                      popupChild: Text('This is the information for the icon in the first list item.'),
                      child: Icon(Icons.star, color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Other items not in tutorial
            return Container(
              width: 150,
              margin: const EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Item ${index + 1}'),
                  const SizedBox(width: 10),
                  const Icon(Icons.star, color: Colors.white),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

// Example class contributing two containers (commented out as per original)
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

// Example class contributing two containers (commented out as per original)
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
        tutorialKeyCount: 3, // First item, its icon, and FAB
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
                  // Uncomment to include ContainerSet2 and ContainerSet3
                  // const ContainerSet2(),
                  // const SizedBox(height: 20),
                  // const ContainerSet3(),
                  // const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          // FAB with correct screenName and tutorialIndex
          floatingActionButton: CommonFocusedMenuHolder(
            screenName: 'home_page', // Matches ContainerSet1
            tutorialIndex: 2, // Third step after item and icon
            title: 'Info for Floating Action Button',
            popupChild: const Text('This is the information for the Floating Action Button.'),
            child: FloatingActionButton(
              onPressed: () {
                // FAB action
              },
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}