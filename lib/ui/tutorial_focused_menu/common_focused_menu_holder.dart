import 'package:apptour/core/provider/tutorial_provider.dart';
import 'package:apptour/ui/focused_menu/focused_menu_holder.dart';
import 'package:apptour/ui/focused_menu/focused_menu_item.dart';
import 'package:apptour/ui/tutorial_focused_menu/common_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommonFocusedMenuHolder extends StatefulWidget {
  final int tutorialIndex;
  final String title;
  final Widget child;

  const CommonFocusedMenuHolder({
    super.key,
    required this.tutorialIndex,
    required this.title,
    required this.child,
  });

  @override
  State<CommonFocusedMenuHolder> createState() => _CommonFocusedMenuHolderState();
}

class _CommonFocusedMenuHolderState extends State<CommonFocusedMenuHolder> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TutorialProvider>().checkAndStartTutorial();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tutorialProvider = context.watch<TutorialProvider>();

    return tutorialProvider.tutorialKeys.isEmpty? Container(
      child: widget.child
    ) : FocusedMenuHolder(
      key: tutorialProvider.tutorialKeys[widget.tutorialIndex],
      menuWidth: MediaQuery.of(context).size.width,
      menuItemExtent: 120,
      openWithTap: true,
      animateMenuItems: true,
      menuBoxDecoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(0),
      ),
      menuOffset: 10,
      blurBackgroundColor: Colors.black12,
      duration: const Duration(milliseconds: 100),
      
      menuItems: [
        FocusedMenuItem(
          title: CommonInfoWidget(
            title: widget.title,
            onPrevious: () => tutorialProvider.onPrevious(context),
            onNext: () => tutorialProvider.onNext(context),
            onSkip: () => tutorialProvider.onSkip(context),
          ),
          onPressed: () {},
        ),
      ],
      onPressed: () {},
      child: widget.child
    );
  }
}
