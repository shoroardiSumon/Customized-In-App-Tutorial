import 'package:apptour/ui/focused_menu/focused_menu_holder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorialProvider extends ChangeNotifier {
  List<GlobalKey<FocusedMenuHolderState>> tutorialKeys = [];
  int _currentStep = 0;
  bool _isTutorialActive = false;
  bool _pendingTutorialStart = false;

  int get currentStep => _currentStep;
  bool get isTutorialActive => _isTutorialActive;

  /// Check if the tutorial has been seen and start it if not.
  Future<void> checkAndStartTutorial(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    bool hasSeenTutorial = prefs.getBool('hasSeenTutorial') ?? false;

    if (!hasSeenTutorial) {
      await prefs.setBool('hasSeenTutorial', false); // Set to false to start the tutorial
      await _initializeTutorialKeys();
      _isTutorialActive = true;
      _pendingTutorialStart = true;
      
      // Use a post-frame callback to ensure widgets are built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _startTutorialWithDelay(context);
      });
    }
  }

  /// Initialize the tutorial keys dynamically.
  Future<void> _initializeTutorialKeys() async {
    tutorialKeys = List.generate(10, (index) => GlobalKey<FocusedMenuHolderState>());
    notifyListeners();
  }

  /// Start the tutorial with a small delay to ensure everything is ready.
  void _startTutorialWithDelay(BuildContext context) {
    if (_pendingTutorialStart) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _startTutorial(context);
        _pendingTutorialStart = false;
      });
    }
  }

  /// Start the tutorial at the current step.
  void _startTutorial(BuildContext context) {
    if (_isTutorialActive &&
        _currentStep < tutorialKeys.length &&
        tutorialKeys[_currentStep].currentState != null &&
        tutorialKeys[_currentStep].currentContext != null) {
      tutorialKeys[_currentStep].currentState!.openMenu(
        tutorialKeys[_currentStep].currentContext!,
      );
    }
  }

  /// Move to the next step, closing the current menu first.
  void onNext(BuildContext context) {
    if (_currentStep < tutorialKeys.length - 1) {
      _closeCurrentMenu(context, () {
        _currentStep++;
        _startTutorial(context);
        notifyListeners();
      });
    } else {
      onSkip(context); // End tutorial if last step
    }
  }

  /// Move to the previous step, closing the current menu first.
  void onPrevious(BuildContext context) {
    if (_currentStep > 0) {
      _closeCurrentMenu(context, () {
        _currentStep--;
        _startTutorial(context);
        notifyListeners();
      });
    }
  }

  /// Skip the tutorial, closing the current menu.
  void onSkip(BuildContext context) {
    _closeCurrentMenu(context, () async {
      _isTutorialActive = false;
      _currentStep = 0;
      _pendingTutorialStart = false;
      
      // Mark tutorial as seen when skipped
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('hasSeenTutorial', true);
      
      notifyListeners();
    });
  }

  /// Helper method to close the current menu and execute a callback after closing.
  void _closeCurrentMenu(BuildContext context, VoidCallback onClosed) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      Future.delayed(const Duration(milliseconds: 100), onClosed);
    } else {
      onClosed();
    }
  }
}