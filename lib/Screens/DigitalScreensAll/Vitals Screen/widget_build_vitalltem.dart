// import 'package:flutter/material.dart';
//
// Widget buildVitalItem(String title, String unit, String value) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Expanded(
//         flex: 2,
//         child: Text(
//           title,
//           style: const TextStyle(
//             fontSize: 18,
//           ),
//         ),
//       ),
//       const SizedBox(width: 8),
//       Container(
//         width: 100,
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//         decoration: BoxDecoration(
//           color: Color(0xFFF8F7FC),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Center(
//           child: Text(
//             value,
//             style: const TextStyle(
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(width: 8),
//       Expanded(
//         flex: 1,
//         child: Text(
//           unit,
//           style: const TextStyle(
//             fontSize: 18,
//           ),
//         ),
//       ),
//     ],
//   );
// }