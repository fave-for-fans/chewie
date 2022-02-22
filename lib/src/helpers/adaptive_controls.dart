import 'package:chewie/chewie.dart';
import 'package:chewie/src/material/material_desktop_controls.dart';
import 'package:flutter/material.dart';

class AdaptiveControls extends StatelessWidget {
  const AdaptiveControls({
    Key? key,
    this.playButtonIcon,
    this.pauseButtonIcon,
  }) : super(key: key);

  final Icon? playButtonIcon;
  final Icon? pauseButtonIcon;

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return const MaterialControls();

      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return const MaterialDesktopControls();

      case TargetPlatform.iOS:
        return CupertinoControls(
          playButtonIcon: playButtonIcon,
          pauseButtonIcon: pauseButtonIcon,
        );
      default:
        return MaterialControls(
          playButtonIcon: playButtonIcon,
          pauseButtonIcon: pauseButtonIcon,
        );
    }
  }
}
