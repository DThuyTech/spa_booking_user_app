import 'package:flutter/widgets.dart';
import '../../core/error/failure.dart';
import '../../core/logging/app_logger.dart';
import '../widgets/toast/app_toast.dart';

abstract final class AppToastHelper {
  static final Logger _logger = AppLogger();

  static void showError(
    BuildContext context, {
    required dynamic error,
    StackTrace? stackTrace,
    String? defaultMessage,
  }) {
    if (error is Failure) {
      if (error is NetworkFailure ||
          error is ValidationFailure ||
          error is ConflictFailure ||
          error is NotFoundFailure ||
          error is UnauthorizedFailure ||
          error is ForbiddenFailure ||
          error is RateLimitFailure ||
          error is ServerFailure) {
        AppToast.error(context, message: error.message);
        return;
      }
    }

    // Unexpected error or non-API error:
    _logger.error('Unexpected or Non-API error: $error', error, stackTrace);
    AppToast.error(context, message: defaultMessage ?? 'error have orrcues');
  }

  static void showSuccess(
    BuildContext context, {
    required String message,
    String? title,
  }) {
    AppToast.success(context, message: message, title: title);
  }

  static void showInfo(
    BuildContext context, {
    required String message,
    String? title,
  }) {
    AppToast.info(context, message: message, title: title);
  }

  static void showWarning(
    BuildContext context, {
    required String message,
    String? title,
  }) {
    AppToast.warning(context, message: message, title: title);
  }
}
