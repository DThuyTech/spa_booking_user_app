import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

class StoreAboutCard extends StatefulWidget {
  final String description;

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF52525B);

  const StoreAboutCard({super.key, required this.description});

  @override
  State<StoreAboutCard> createState() => _StoreAboutCardState();
}

class _StoreAboutCardState extends State<StoreAboutCard> {
  bool _isExpanded = false;

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
            context.l10n.about,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: StoreAboutCard._textDark,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.description,
            maxLines: _isExpanded ? null : 3,
            overflow: _isExpanded
                ? TextOverflow.visible
                : TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.5,
              color: StoreAboutCard._textMuted,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            behavior: HitTestBehavior.opaque,
            child: Text(
              _isExpanded ? 'Show less' : 'Read more',
              style: const TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
                color: StoreAboutCard._coralColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
