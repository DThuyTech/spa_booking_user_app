import 'dart:ui';
import 'package:flutter/material.dart';

/// A premium frosted glassmorphism pill button matching the design system
/// specifications (Image 4).
class AppGlassButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? label;
  final Widget? child;
  final double height;
  final double? width;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final bool isLoading;

  const AppGlassButton({
    super.key,
    this.onPressed,
    this.label,
    this.child,
    this.height = 54,
    this.width,
    this.borderRadius = 30,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.textStyle,
    this.isLoading = false,
  }) : assert(
         label != null || child != null,
         'Either label or child must be provided',
       );

  @override
  State<AppGlassButton> createState() => _AppGlassButtonState();
}

class _AppGlassButtonState extends State<AppGlassButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null && !widget.isLoading;

    return AnimatedScale(
      scale: _isPressed ? 0.97 : 1.0,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeInOut,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.22),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
            BoxShadow(
              color: const Color(0xFFC8754D).withValues(alpha: 0.08),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: isEnabled ? widget.onPressed : null,
                onHighlightChanged: (highlighted) {
                  if (isEnabled && mounted) {
                    setState(() => _isPressed = highlighted);
                  }
                },
                borderRadius: BorderRadius.circular(widget.borderRadius),
                splashColor: Colors.white.withValues(alpha: 0.2),
                highlightColor: Colors.white.withValues(alpha: 0.1),
                child: Container(
                  padding: widget.padding,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withValues(
                          alpha: _isPressed ? 0.45 : 0.35,
                        ),
                        Colors.white.withValues(
                          alpha: _isPressed ? 0.28 : 0.20,
                        ),
                      ],
                    ),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.72),
                      width: 1.2,
                    ),
                  ),
                  child: Center(
                    child: widget.isLoading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : (widget.child ??
                              Text(
                                widget.label!,
                                style:
                                    widget.textStyle ??
                                    const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.2,
                                    ),
                              )),
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
