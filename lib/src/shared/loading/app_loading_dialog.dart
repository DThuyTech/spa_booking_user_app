import 'package:flutter/material.dart';
import '../design_system/components/loaders/app_loader.dart';
import '../design_system/tokens/app_radius.dart';
import '../design_system/tokens/app_spacing.dart';

abstract final class AppLoadingDialog {
  static void show(BuildContext context, {String message = 'Please wait...'}) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => PopScope(
        canPop: false,
        child: Dialog(
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderLg),
          child: Padding(
            padding: AppSpacing.edgeInsetsAllLg,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppLoader(size: 28),
                const SizedBox(width: AppSpacing.md),
                Flexible(
                  child: Text(
                    message,
                    style: Theme.of(ctx).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
