import 'package:apptour/ui/focused_menu/focused_menu_holder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorialProvider extends ChangeNotifier {
  final Map<String, List<GlobalKey<FocusedMenuHolderState>>> _tutorialKeysMap = {};
  final Map<String, int> _currentStepMap = {};
  final Map<String, bool> _isTutorialActiveMap = {};
  final Map<String, bool> _pendingTutorialStartMap = {};

  /// Get tutorial keys for a specific screen
  List<GlobalKey<FocusedMenuHolderState>> getTutorialKeys(String screenName) {
    return _tutorialKeysMap[screenName] ?? [];
  }

  /// Get current step for a specific screen
  int getCurrentStep(String screenName) {
    return _currentStepMap[screenName] ?? 0;
  }

  /// Check if tutorial is active for a specific screen
  bool isTutorialActive(String screenName) {
    return _isTutorialActiveMap[screenName] ?? false;
  }

  /// Check if the tutorial has been seen for a screen and start it if not.
  Future<void> checkAndStartTutorial(BuildContext context, String screenName, {int keyCount = 10}) async {
    final prefs = await SharedPreferences.getInstance();
    String tutorialKey = 'hasSeenTutorial_$screenName';
    bool hasSeenTutorial = prefs.getBool(tutorialKey) ?? false;

    if (!hasSeenTutorial) {
      await _initializeTutorialKeys(screenName, keyCount);
      _isTutorialActiveMap[screenName] = true;
      _pendingTutorialStartMap[screenName] = true;
      
      // Use a post-frame callback to ensure widgets are built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _startTutorialWithDelay(context, screenName);
      });
    }
  }

  /// Initialize the tutorial keys dynamically for a specific screen.
  Future<void> _initializeTutorialKeys(String screenName, int keyCount) async {
    _tutorialKeysMap[screenName] = List.generate(keyCount, (index) => GlobalKey<FocusedMenuHolderState>());
    _currentStepMap[screenName] = 0;
    notifyListeners();
  }

  /// Start the tutorial with a small delay to ensure everything is ready.
  void _startTutorialWithDelay(BuildContext context, String screenName) {
    if (_pendingTutorialStartMap[screenName] == true) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _startTutorial(context, screenName);
        _pendingTutorialStartMap[screenName] = false;
      });
    }
  }

  /// Start the tutorial at the current step for a specific screen.
  void _startTutorial(BuildContext context, String screenName) {
    final keys = _tutorialKeysMap[screenName] ?? [];
    final currentStep = _currentStepMap[screenName] ?? 0;
    final isActive = _isTutorialActiveMap[screenName] ?? false;

    if (isActive &&
        currentStep < keys.length &&
        keys[currentStep].currentState != null &&
        keys[currentStep].currentContext != null) {
      keys[currentStep].currentState!.openMenu(
        keys[currentStep].currentContext!,
      );
    }
  }

  /// Move to the next step, closing the current menu first.
  void onNext(BuildContext context, String screenName) {
    final keys = _tutorialKeysMap[screenName] ?? [];
    final currentStep = _currentStepMap[screenName] ?? 0;

    if (currentStep < keys.length - 1) {
      _closeCurrentMenu(context, () {
        _currentStepMap[screenName] = currentStep + 1;
        _startTutorial(context, screenName);
        notifyListeners();
      });
    } else {
      onSkip(context, screenName); // End tutorial if last step
    }
  }

  /// Move to the previous step, closing the current menu first.
  void onPrevious(BuildContext context, String screenName) {
    final currentStep = _currentStepMap[screenName] ?? 0;

    if (currentStep > 0) {
      _closeCurrentMenu(context, () {
        _currentStepMap[screenName] = currentStep - 1;
        _startTutorial(context, screenName);
        notifyListeners();
      });
    }
  }

  /// Skip the tutorial, closing the current menu.
  void onSkip(BuildContext context, String screenName) {
    _closeCurrentMenu(context, () async {
      _isTutorialActiveMap[screenName] = false;
      _currentStepMap[screenName] = 0;
      _pendingTutorialStartMap[screenName] = false;
      
      // Mark tutorial as seen when skipped
      final prefs = await SharedPreferences.getInstance();
      String tutorialKey = 'hasSeenTutorial_$screenName';
      await prefs.setBool(tutorialKey, true);
      
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

  /// Reset tutorial for a specific screen (useful for testing)
  Future<void> resetTutorial(String screenName) async {
    final prefs = await SharedPreferences.getInstance();
    String tutorialKey = 'hasSeenTutorial_$screenName';
    await prefs.setBool(tutorialKey, false);
    
    _isTutorialActiveMap[screenName] = false;
    _currentStepMap[screenName] = 0;
    _pendingTutorialStartMap[screenName] = false;
    
    notifyListeners();
  }
}