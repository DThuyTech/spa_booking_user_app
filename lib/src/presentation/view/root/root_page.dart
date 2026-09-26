import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../home/view/home_view.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
