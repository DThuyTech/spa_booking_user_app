import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

class UserReviewMoreMenu extends StatelessWidget {
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const UserReviewMoreMenu({super.key, this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    if (onEdit == null && onDelete == null) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: 28,
      height: 28,
      child: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        icon: const Icon(
          LucideIcons.ellipsis_vertical,
          size: 18,
          color: Color(0xFF64748B),
        ),
        color: Colors.white,
        elevation: 6,
        shadowColor: Colors.black.withValues(alpha: 0.12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        onSelected: (value) {
          if (value == 'edit') {
            onEdit?.call();
          } else if (value == 'delete') {
            onDelete?.call();
          }
        },
        itemBuilder: (context) => [
          if (onEdit != null)
            const PopupMenuItem<String>(
              value: 'edit',
              height: 42,
              child: Row(
                children: [
                  Icon(
                    LucideIcons.pen_tool,
                    size: 16,
                    color: Color(0xFFFA7762),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Sửa',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
            ),
          if (onDelete != null)
            const PopupMenuItem<String>(
              value: 'delete',
              height: 42,
              child: Row(
                children: [
                  Icon(LucideIcons.trash, size: 16, color: Color(0xFFEF4444)),
                  SizedBox(width: 10),
                  Text(
                    'Xóa',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFEF4444),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
