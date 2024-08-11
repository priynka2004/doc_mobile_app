// import 'package:flutter/material.dart';
// import 'package:healtether_clinic_app/constant/constant.dart';
//
// class DrugSelectionCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final bool isSelected;
//   final ValueChanged<String?> onChanged;
//
//   const DrugSelectionCard({
//     Key? key,
//     required this.title,
//     required this.subtitle,
//     required this.isSelected,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return drugSelectionCard();
//   }
//
//   Container drugSelectionCard() {
//     return Container(
//     width: double.infinity,
//     height: 70,
//     decoration: BoxDecoration(
//       color: AppColors.white1Color,
//       borderRadius: BorderRadius.circular(2),
//     ),
//     child: ListTile(
//       leading: Radio<String>(
//         value: title,
//         groupValue: isSelected ? title : null,
//         onChanged: onChanged,
//       ),
//       title: Text(
//         title,
//         style: const TextStyle(
//           fontFamily: 'Poppins',
//           fontWeight: FontWeight.normal,
//           fontSize: 16,
//           height: 1.0,
//           color:AppColors.black1Color,
//         ),
//       ),
//       subtitle: Text(
//         subtitle,
//         style: const TextStyle(
//           fontFamily: 'Poppins',
//           fontWeight: FontWeight.normal,
//           fontSize: 14,
//           height: 1.2,
//           color: AppColors.blueColor,
//         ),
//       ),
//     ),
//   );
//   }
// }
