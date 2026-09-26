import 'package:flutter/material.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../buttons/app_button.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String? cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const AppDialog({
    super.key,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.onConfirm,
    this.cancelText,
    this.onCancel,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String content,
    required String confirmText,
    String? cancelText,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AppDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: () => Navigator.of(ctx).pop(true),
        onCancel: () => Navigator.of(ctx).pop(false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderLg),
      title: Text(title),
      content: Text(content),
      actionsPadding: AppSpacing.edgeInsetsAllMd,
      actions: [
        if (cancelText != null)
          AppButton(
            text: cancelText!,
            variant: AppButtonVariant.ghost,
            onPressed: onCancel ?? () => Navigator.of(context).pop(),
          ),
        AppButton(text: confirmText, onPressed: onConfirm),
      ],
    );
  }
}
