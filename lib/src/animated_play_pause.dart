import 'package:flutter/material.dart';

/// A widget that animates implicitly between a play and a pause icon.
class AnimatedPlayPause extends StatefulWidget {
  const AnimatedPlayPause({
    Key? key,
    required this.playing,
    this.size = 25,
    this.color,
    this.playIcon,
    this.pauseIcon,
  }) : super(key: key);

  final double? size;
  final bool playing;
  final Color? color;
  final IconData? playIcon;
  final IconData? pauseIcon;

  @override
  State<StatefulWidget> createState() => AnimatedPlayPauseState();
}

class AnimatedPlayPauseState extends State<AnimatedPlayPause>
    with SingleTickerProviderStateMixin {
  late final animationController = AnimationController(
    vsync: this,
    value: widget.playing ? 1 : 0,
    duration: const Duration(milliseconds: 400),
  );

  @override
  void didUpdateWidget(AnimatedPlayPause oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.playing != oldWidget.playing) {
      if (widget.playing) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildPlayPauseIcon(),
    );
  }

  Widget _buildPlayPauseIcon() {
    if (widget.playIcon != null && widget.pauseIcon != null) {
      return Center(
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 500),
          crossFadeState: widget.playing
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: Container(
            key: const Key('pause_icon'),
            child: Icon(
              widget.pauseIcon,
              size: widget.size,
              color: widget.color,
            ),
          ),
          secondChild: Container(
            key: const Key('play_icon'),
            child: Icon(
              widget.playIcon,
              size: widget.size,
              color: widget.color,
            ),
          ),
        ),
      );
    }
    return AnimatedIcon(
      color: widget.color,
      size: widget.size,
      icon: AnimatedIcons.play_pause,
      progress: animationController,
    );
  }
}
