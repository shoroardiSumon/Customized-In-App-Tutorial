import 'package:apptour/ui/focused_menu/focused_menu_holder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorialProvider extends ChangeNotifier {
  List<GlobalKey<FocusedMenuHolderState>> tutorialKeys = [];

  int _currentStep = 0;

  /// Check if the tutorial has been seen and start it if not.
  Future<void> checkAndStartTutorial() async {
    final prefs = await SharedPreferences.getInstance();
    bool hasSeenTutorial = prefs.getBool('hasSeenTutorial') ?? false;

    if (!hasSeenTutorial) {
      await prefs.setBool('hasSeenTutorial', false); // Set to true once tutorial starts
      await _initializeTutorialKeys();
      _startTutorial();
    }
  }

  /// Initialize the tutorial keys dynamically (if the number of steps is variable)
  Future<void> _initializeTutorialKeys() async {
    tutorialKeys = List.generate(10, (index) => GlobalKey<FocusedMenuHolderState>());
    notifyListeners();
  }

  /// Start the tutorial at the current step.
  void _startTutorial() {
    if (_currentStep < tutorialKeys.length &&
        tutorialKeys[_currentStep].currentState != null &&
        tutorialKeys[_currentStep].currentContext != null) {
      tutorialKeys[_currentStep].currentState!.openMenu(
        tutorialKeys[_currentStep].currentContext!,
      );
    }
  }

  /// Move to the next step, closing the current info widget first.
  void onNext(BuildContext context) {
    if (_currentStep < tutorialKeys.length - 1) {
      _closeCurrentMenu(context, () {
        _currentStep++;
        _startTutorial();
        notifyListeners();
      });
    }
  }

  /// Move to the previous step, closing the current info widget first.
  void onPrevious(BuildContext context) {
    if (_currentStep > 0) {
      _closeCurrentMenu(context, () {
        _currentStep--;
        _startTutorial();
        notifyListeners();
      });
    }
  }

  /// Skip the tutorial, closing the current info widget.
  void onSkip(BuildContext context) {
    _closeCurrentMenu(context, () {
      _currentStep = tutorialKeys.length;
      notifyListeners();
    });
  }

  /// Helper method to close the current menu and execute a callback after closing.
  void _closeCurrentMenu(BuildContext context, VoidCallback onClosed) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context); // Close the currently open menu
      Future.delayed(const Duration(milliseconds: 0), onClosed);
    } else {
      onClosed();
    }
  }
}
