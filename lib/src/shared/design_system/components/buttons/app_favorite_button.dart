import 'package:flutter/material.dart';

class AppFavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback? onToggle;
  final double size;
  final double iconSize;
  final Color activeColor;
  final Color inactiveColor;
  final bool isFloating;
  final Color floatingBg;

  const AppFavoriteButton({
    super.key,
    required this.isFavorite,
    this.onToggle,
    this.size = 38,
    this.iconSize = 20,
    this.activeColor = const Color(0xFFFC6E58),
    this.inactiveColor = const Color(0xFFFC6E58),
    this.isFloating = false,
    this.floatingBg = Colors.white,
  });

  @override
  State<AppFavoriteButton> createState() => _AppFavoriteButtonState();
}

class _AppFavoriteButtonState extends State<AppFavoriteButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 0.7,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.7,
          end: 1.35,
        ).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 45,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.35,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 25,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward(from: 0.0);
    widget.onToggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    final heartIcon = ScaleTransition(
      scale: _scaleAnimation,
      child: Icon(
        widget.isFavorite
            ? Icons.favorite_rounded
            : Icons.favorite_border_rounded,
        color: widget.isFavorite ? widget.activeColor : widget.inactiveColor,
        size: widget.iconSize,
      ),
    );

    if (widget.isFloating) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _handleTap,
          borderRadius: BorderRadius.circular(widget.size / 2),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.floatingBg.withValues(alpha: 0.95),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(child: heartIcon),
          ),
        ),
      );
    }

    return IconButton(
      icon: heartIcon,
      onPressed: _handleTap,
      splashRadius: widget.size / 2 + 2,
    );
  }
}
