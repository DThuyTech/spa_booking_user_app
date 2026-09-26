import 'package:flutter/material.dart';
import '../sections/login_card_section.dart';
import '../sections/login_footer_section.dart';
import '../sections/login_header_section.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Stack(
      children: [
        // Full screen fluid background image covering edge-to-edge
        Positioned.fill(
          child: Image.asset(
            'assets/images/auth_background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            errorBuilder: (context, error, stackTrace) => Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFE8DC),
                    Color(0xFFFFF0E8),
                    Color(0xFFFFD8C7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),

        // Scrollable content with keyboard offset preservation
        SafeArea(
          top: true,
          bottom: true,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  24,
                  12,
                  24,
                  bottomInset > 0 ? bottomInset + 16 : 24,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 460),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        SizedBox(height: 16),
                        LoginHeaderSection(),
                        SizedBox(height: 26),
                        LoginCardSection(),
                        LoginFooterSection(),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
