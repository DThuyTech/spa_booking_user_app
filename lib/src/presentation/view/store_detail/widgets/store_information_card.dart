// import 'package:flutter/material.dart';
// import 'package:flutter_lucide/flutter_lucide.dart';
// import 'package:spa_booking/src/domain/entities/store/store.dart';
// import '../mockup_data/store_detail_mock_data.dart';

// class StoreInformationCard extends StatelessWidget {
//   final StoreDetailEntity information;

//   static const Color _textDark = Color(0xFF1E2022);
//   static const Color _textMuted = Color(0xFF52525B);
//   static const Color _iconColor = Color(0xFF64748B);

//   const StoreInformationCard({super.key, required this.information});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.03),
//             blurRadius: 14,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Information',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: _textDark,
//               letterSpacing: -0.2,
//             ),
//           ),
//           const SizedBox(height: 14),

//           // Payment Methods
//           Row(
//             children: [
//               const Icon(LucideIcons.banknote, size: 18, color: _iconColor),
//               const SizedBox(width: 10),
//               Text(
//                 information.paymentMethods,
//                 style: const TextStyle(
//                   fontSize: 13.5,
//                   fontWeight: FontWeight.w500,
//                   color: _textMuted,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),

//           // Amenities
//           Row(
//             children: [
//               const Icon(LucideIcons.wifi, size: 18, color: _iconColor),
//               const SizedBox(width: 10),
//               Text(
//                 information.amenities,
//                 style: const TextStyle(
//                   fontSize: 13.5,
//                   fontWeight: FontWeight.w500,
//                   color: _textMuted,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
