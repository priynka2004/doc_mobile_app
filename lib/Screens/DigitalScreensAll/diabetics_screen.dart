import 'package:flutter/material.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/family_history_screen.dart';

class DiabeticsScreen extends StatefulWidget {
  const DiabeticsScreen({super.key});

  @override
  State<DiabeticsScreen> createState() => _DiabeticsScreenState();
}

class _DiabeticsScreenState extends State<DiabeticsScreen> {
  List<String> options = [
    'less than 6 months ago',
    '6 months ago',
    'a year ago',
    '2 years ago',
    '5 years ago',
    '10 years ago',
  ];

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: MediaQuery.of(context).size.width * 90,
        child: AlertDialog(
          backgroundColor: const Color(0xFFEBEBEB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Diabetics ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'diagnosed in the year ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                            initialDatePickerMode: DatePickerMode.year,
                          );
                          if (pickedDate != null) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xFFF5F5F5),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Text(
                          selectedDate == null
                              ? 'Select Year'
                              : selectedDate!.year.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Add your save functionality here
                        },
                        child: Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF32856E),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Center(
                            child: Text(
                              "Save",
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: options.map((option) {
                    return GestureDetector(
                      onTap: () {
                        if (option == '10 years ago') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FamilyHistoryScreen()),
                          );
                        }
                      },
                      child: Chip(
                        label: Text(
                          option,
                          style: const TextStyle(fontSize: 12),
                        ),
                        backgroundColor: const Color(0xFFF5F5F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        side: BorderSide.none,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
