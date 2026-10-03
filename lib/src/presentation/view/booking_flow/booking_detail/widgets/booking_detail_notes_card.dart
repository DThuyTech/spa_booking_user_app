import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../../../../shared/design_system/components/inputs/app_text_field.dart';

class BookingDetailNotesCard extends StatelessWidget {
  final List<String> notes;
  final TextEditingController noteController;
  final VoidCallback onAddNote;

  const BookingDetailNotesCard({
    super.key,
    required this.notes,
    required this.noteController,
    required this.onAddNote,
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);

  @override
  Widget build(BuildContext context) {
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
          // Coral Header Banner (Matching Image 5)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: _coralColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(LucideIcons.menu, size: 16, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'USER NOTES',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onAddNote,
                  child: const Text(
                    'Add Note',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Notes List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...notes.map(
                  (note) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      note,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: _textDark,
                        height: 1.35,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 4),

                // Note Input using project AppTextField component
                AppTextField(
                  controller: noteController,
                  hint: 'Write a description...',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
