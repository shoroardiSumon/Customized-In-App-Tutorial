import 'package:apptour/core/provider/tutorial_provider.dart';
import 'package:apptour/ui/focused_menu/focused_menu_holder.dart';
import 'package:apptour/ui/focused_menu/focused_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common_info_widget.dart';

class CommonFocusedMenuHolder extends StatelessWidget {
  final String screenName;
  final int tutorialIndex;
  final String title;
  final Widget popupChild;
  final Widget child;

  const CommonFocusedMenuHolder({
    super.key,
    required this.screenName,
    required this.tutorialIndex,
    required this.title,
    required this.popupChild,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final tutorialProvider = context.watch<TutorialProvider>();
    final tutorialKeys = tutorialProvider.getTutorialKeys(screenName);

    if (tutorialKeys.isEmpty || tutorialIndex >= tutorialKeys.length) {
      return child;
    }

    return FocusedMenuHolder(
      key: tutorialKeys[tutorialIndex],
      menuWidth: MediaQuery.of(context).size.width,
      menuItemExtent: 120,
      openWithTap: true,
      animateMenuItems: true,
      menuBoxDecoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.zero,
      ),
      menuOffset: 10,
      blurBackgroundColor: Colors.black54,
      duration: const Duration(milliseconds: 100),
      menuItems: [
        FocusedMenuItem(
          title: CommonInfoWidget(
            title: title,
            popupChild: popupChild,
            onPrevious: () => tutorialProvider.onPrevious(context, screenName),
            onNext: () => tutorialProvider.onNext(context, screenName),
            onSkip: () => tutorialProvider.onSkip(context, screenName),
          ),
          onPressed: () {},
        ),
      ],
      onPressed: () {},
      child: child,
    );
  }
}