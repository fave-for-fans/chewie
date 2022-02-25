import 'package:chewie/chewie.dart';
import 'package:chewie/src/animated_play_pause.dart';
import 'package:flutter/material.dart';

class CenterPlayButton extends StatelessWidget {
  const CenterPlayButton({
    Key? key,
    required this.backgroundColor,
    this.iconColor,
    required this.show,
    required this.isPlaying,
    required this.isFinished,
    this.onPressed,
    this.playIcon,
    this.pauseIcon,
    required this.controller,
  }) : super(key: key);

  final Color backgroundColor;
  final Color? iconColor;
  final bool show;
  final bool isPlaying;
  final bool isFinished;
  final VoidCallback? onPressed;
  final IconData? playIcon;
  final IconData? pauseIcon;
  final ChewieController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: GestureDetector(
          onTap: onPressed,
          child: AnimatedOpacity(
            opacity: show ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                // Always set the iconSize on the IconButton, not on the Icon itself:
                // https://github.com/flutter/flutter/issues/52980
                child: SizedBox(
                  width: 68,
                  height: 68,
                  child: isFinished
                      ? Icon(
                          Icons.replay,
                          color: iconColor,
                        )
                      : AnimatedPlayPause(
                          color: iconColor,
                          playing: isPlaying,
                          playIcon: playIcon,
                          pauseIcon: pauseIcon,
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
