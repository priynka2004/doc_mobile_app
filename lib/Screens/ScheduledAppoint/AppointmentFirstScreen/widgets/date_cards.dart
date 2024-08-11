import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateCards extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final double? width;

  const DateCards({
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 25,
          width: width,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xff6CEBC6) : const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: Colors.black,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
