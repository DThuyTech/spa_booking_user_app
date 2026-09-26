import 'package:flutter/material.dart';
import '../../../widgets/toast/app_toast.dart';

abstract final class AppSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    String? title,
    IconData? icon,
    Color? backgroundColor,
    Color? foregroundColor,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = const Duration(seconds: 4),
  }) {
    AppToast.show(
      context,
      message: message,
      title: title,
      duration: duration,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  static void success(
    BuildContext context, {
    required String message,
    String? title,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    AppToast.success(
      context,
      message: message,
      title: title,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  static void error(
    BuildContext context, {
    required String message,
    String? title,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    AppToast.error(
      context,
      message: message,
      title: title,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  static void warning(
    BuildContext context, {
    required String message,
    String? title,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    AppToast.warning(
      context,
      message: message,
      title: title,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  static void info(
    BuildContext context, {
    required String message,
    String? title,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    AppToast.info(
      context,
      message: message,
      title: title,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }
}
