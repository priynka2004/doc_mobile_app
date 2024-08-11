import 'package:flutter/material.dart';

class AlcoholScreen extends StatelessWidget {
  final List<String> options = [
    'Former drinker',
    'Social drinker',
    'Occasional drinker',
    'Light (1-2/week)',
    'Moderate (3-7/week)',
    'Binge drinker',
    'Problem drinker'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18.0),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Frequency of Alcohol Consumption ",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8.0,
            children: options.take(8).map((option) {
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context, option);
                },
                child: Chip(
                  label: Text(
                    option,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  backgroundColor: const Color(0xFFF5F5F5),
                  side: BorderSide.none,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
