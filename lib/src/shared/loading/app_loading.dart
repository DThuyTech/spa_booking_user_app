import 'package:flutter/material.dart';
import 'app_loading_indicator.dart';

class AppLoading extends StatelessWidget {
  final String? message;

  const AppLoading({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return AppLoadingIndicator(message: message);
  }
}
