import 'package:flutter/material.dart';
import '../../models/booking_models.dart';

class BookingStaffAvatarItem extends StatelessWidget {
  final BookingStaffItem staff;
  final bool isSelected;
  final VoidCallback onTap;

  const BookingStaffAvatarItem({
    super.key,
    required this.staff,
    required this.isSelected,
    required this.onTap,
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: staff.isOff ? null : onTap,
      child: Opacity(
        opacity: staff.isOff ? 0.45 : 1.0,
        child: Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? _coralColor : Colors.transparent,
                    width: 2.5,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: _coralColor.withValues(alpha: 0.25),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ]
                      : null,
                ),
                padding: const EdgeInsets.all(2.5),
                child: ClipOval(
                  child: staff.photoUrl != null
                      ? Image.network(
                          staff.photoUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              _buildInitials(),
                        )
                      : _buildInitials(),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                staff.name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? _coralColor : _textDark,
                ),
              ),
              if (staff.isOff)
                const Text(
                  'Off',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF94A3B8),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInitials() {
    return Container(
      color: staff.avatarBgColor,
      alignment: Alignment.center,
      child: Text(
        staff.initials,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Color(0xFF334155),
        ),
      ),
    );
  }
}
