import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../shared/design_system/components/inputs/app_text_field.dart';

class BookingDetailNotesCard extends StatelessWidget {
  final List<String>? notes;
  final TextEditingController noteController;
  final VoidCallback? onAddNote;

  const BookingDetailNotesCard({
    super.key,
    this.notes,
    required this.noteController,
    this.onAddNote,
  });

  static const Color _coralColor = Color(0xFFFF6F59);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Coral Header Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: _coralColor,
            child: Row(
              children: [
                const Icon(LucideIcons.menu, size: 16, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  l10n.userNotes,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),

          // Note Input Box only (no mockup note list)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: AppTextField(
              controller: noteController,
              hint: l10n.writeDescription,
              maxLines: 3,
              fillColor: const Color(0xFFF1F5F9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
