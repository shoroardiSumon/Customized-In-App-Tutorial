import 'package:apptour/ui/tutorial_focused_menu/focused_menu_demonstration.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Tour')),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FocusedMenuDemonstration()));
                },
                child: const Text('Focused Menu Demonstration'),
              ),
          
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FocusedMenuDemonstration()));
                },
                child: const Text('Focused Only One Time'),
              ),
          
              const SizedBox(height: 20),
            ],
          ),
        ),
      )
    );
  }
}