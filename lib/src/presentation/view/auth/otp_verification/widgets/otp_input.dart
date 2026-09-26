import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 6-digit OTP input widget matching the visual design from Phase AUTH-02.
///
/// Visual Specs:
/// - Filled digit boxes: Solid coral background (#FA7355), white text.
/// - Active/focused box: White background, vivid blue border (#2563EB).
/// - Empty box: White background, soft coral border (#FA8B74).
/// - Error box: White background, crimson border (#E53935), red text.
class OtpInput extends StatefulWidget {
  final String code;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;
  final bool hasError;
  final String? errorMessage;
  final bool isEnabled;

  const OtpInput({
    super.key,
    required this.code,
    required this.onChanged,
    this.onCompleted,
    this.hasError = false,
    this.errorMessage,
    this.isEnabled = true,
  });

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.code);
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (mounted) setState(() {});
  }

  @override
  void didUpdateWidget(covariant OtpInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.code != _controller.text) {
      _controller.text = widget.code;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Hidden native TextField that intercepts inputs, paste, and virtual keyboard
            Opacity(
              opacity: 0,
              child: SizedBox(
                width: 320,
                height: 60,
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  autofocus: true,
                  enabled: widget.isEnabled,
                  enableInteractiveSelection: true,
                  onChanged: (val) {
                    widget.onChanged(val);
                    if (val.length == 6) {
                      widget.onCompleted?.call(val);
                    }
                  },
                ),
              ),
            ),

            // Visible 6 Digit Boxes faithfully reproducing design
            GestureDetector(
              onTap: () {
                if (widget.isEnabled) {
                  _focusNode.requestFocus();
                }
              },
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  final isFilled = index < widget.code.length;
                  final isCurrent = index == widget.code.length;
                  final digit = isFilled ? widget.code[index] : '';

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: _buildDigitBox(
                      digit: digit,
                      isFilled: isFilled,
                      isCurrent: isCurrent && _focusNode.hasFocus,
                      hasError: widget.hasError,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),

        // Inline Error Message if present
        if (widget.hasError && widget.errorMessage != null) ...[
          const SizedBox(height: 14),
          Text(
            widget.errorMessage!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFFE53935),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDigitBox({
    required String digit,
    required bool isFilled,
    required bool isCurrent,
    required bool hasError,
  }) {
    Color bgColor;
    Border border;
    Color textColor;

    if (hasError) {
      bgColor = Colors.white;
      border = Border.all(color: const Color(0xFFE53935), width: 1.8);
      textColor = const Color(0xFFE53935);
    } else if (isFilled) {
      bgColor = const Color(0xFFFA7355);
      border = Border.all(color: const Color(0xFFFA7355), width: 1.8);
      textColor = Colors.white;
    } else if (isCurrent) {
      bgColor = Colors.white;
      border = Border.all(color: const Color(0xFF2563EB), width: 2.0);
      textColor = const Color(0xFF1E1713);
    } else {
      bgColor = Colors.white;
      border = Border.all(color: const Color(0xFFFA8B74), width: 1.8);
      textColor = const Color(0xFF1E1713);
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 160),
      width: 48,
      height: 56,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: border,
        boxShadow: [
          if (isFilled && !hasError)
            BoxShadow(
              color: const Color(0xFFFA7355).withValues(alpha: 0.28),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Center(
        child: Text(
          digit,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
