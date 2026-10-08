import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';
import 'package:spa_booking/src/core/extensions/double_extensions.dart';
import 'package:spa_booking/src/domain/entities/store/service_entity.dart';

class StoreOverviewServicesCard extends StatelessWidget {
  final List<ServiceEntity> services;
  final VoidCallback? onViewAllServices;

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF71717A);

  const StoreOverviewServicesCard({
    super.key,
    required this.services,
    this.onViewAllServices,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.services,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: _textDark,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 16),
          if (services.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                context.l10n.noServicesAvailable,
                style: const TextStyle(
                  fontSize: 14,
                  color: _textMuted,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          else ...[
            ...services.map((item) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: _textDark,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${item.durationMinutes.toString()} Phút ',
                          style: const TextStyle(
                            fontSize: 12.5,
                            color: _textMuted,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      item.basePrice.toVnd(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: _textDark,
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: onViewAllServices,
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.l10n.viewAllServices,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _coralColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    LucideIcons.chevron_right,
                    size: 16,
                    color: _coralColor,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
