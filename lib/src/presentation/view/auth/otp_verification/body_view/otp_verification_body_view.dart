import 'package:flutter/material.dart';
import '../sections/otp_action_section.dart';
import '../sections/otp_header_section.dart';
import '../sections/otp_input_section.dart';

class OtpVerificationBodyView extends StatelessWidget {
  const OtpVerificationBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 460),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      OtpHeaderSection(),
                      SizedBox(height: 32),
                      OtpInputSection(),
                      SizedBox(height: 36),
                      OtpActionSection(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
