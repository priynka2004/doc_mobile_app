import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildVitalItem(String title, String unit, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        flex: 2,
        child: Text(
          title,
          style: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              // fontFamily: "Urbanist",
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: Color(0xFF0C091F),
            ),
          ),
        ),
      ),
      // const SizedBox(width: 8),
      Container(
        width: 118,
        height: 40,
        margin: const EdgeInsets.only(left: 26),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F7FC),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          decoration:
              InputDecoration(border: InputBorder.none, hintText: value),
        ),
      ),
      const SizedBox(width: 6),
      Expanded(
        flex: 1,
        child: Text(
          unit,
          style: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0C091F),
              // fontFamily: 'Urbanist'
            ),
          ),
        ),
      ),
    ],
  );
}
