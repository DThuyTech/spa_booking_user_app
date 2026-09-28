import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../models/booking_models.dart';

class BookingServiceSelectionCard extends StatelessWidget {
  final BookingServiceItem service;
  final VoidCallback onTap;

  const BookingServiceSelectionCard({
    super.key,
    required this.service,
    required this.onTap,
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _coralBorder = Color(0xFFFF7E6B);
  static const Color _coralLightBg = Color(0xFFFFF5F3);
  static const Color _cardBorderDefault = Color(0xFFF1F5F9);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF71717A);

  @override
  Widget build(BuildContext context) {
    final isSelected = service.isSelected;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: isSelected ? _coralLightBg : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? _coralBorder : _cardBorderDefault,
                width: isSelected ? 1.5 : 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? _coralColor.withValues(alpha: 0.10)
                      : Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                // Left Details: Title & Duration
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        service.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: isSelected ? _coralColor : _textDark,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        service.duration,
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                          color: _textMuted,
                        ),
                      ),
                    ],
                  ),
                ),

                // Right: Price & Radio/Check Pill
                Text(
                  service.priceDisplay,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? _coralColor : _textDark,
                  ),
                ),
                const SizedBox(width: 12),

                // Selection Indicator Badge
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? _coralColor : Colors.transparent,
                    border: Border.all(
                      color: isSelected ? _coralColor : const Color(0xFFCBD5E1),
                      width: 1.5,
                    ),
                  ),
                  child: isSelected
                      ? const Center(
                          child: Icon(
                            LucideIcons.check,
                            size: 14,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
