import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

class BookingDetailNotesCard extends StatefulWidget {
  final String note;
  final ValueChanged<String>? onAddNote;

  const BookingDetailNotesCard({super.key, required this.note, this.onAddNote});

  @override
  State<BookingDetailNotesCard> createState() => _BookingDetailNotesCardState();
}

class _BookingDetailNotesCardState extends State<BookingDetailNotesCard> {
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _submitNote() {
    final text = _noteController.text.trim();
    if (text.isNotEmpty) {
      widget.onAddNote?.call(text);
      _noteController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  bool get _hasExistingNote {
    final n = widget.note.trim();
    return n.isNotEmpty && n != '-';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Coral Header Banner with Add Note Action
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: const Color(0xFFFA7762),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(LucideIcons.menu, size: 15, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      l10n.userNotes,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: _submitNote,
                  child: Text(
                    l10n.addNote,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Notes Content & Input
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_hasExistingNote) ...[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      widget.note,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1E293B),
                        height: 1.35,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],

                // Note input box
                AppTextField(
                  controller: _noteController,
                  maxLines: 3,
                  hint: l10n.writeDescription,
                  hintStyle: const TextStyle(
                    fontSize: 12.5,
                    color: Color(0xFF94A3B8),
                  ),
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF1E293B),
                  ),
                  fillColor: const Color(0xFFF1F5F9),
                  border: OutlineInputBorder(
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
