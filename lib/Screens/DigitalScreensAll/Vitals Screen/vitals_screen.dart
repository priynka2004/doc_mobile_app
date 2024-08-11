import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/personal_historyScreen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/widget/build_vital_item_widget.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/widget/green_line_widget.dart';
import 'other_vitals_screen.dart';

class VitalsScreen extends StatefulWidget {
  const VitalsScreen({Key? key}) : super(key: key);

  @override
  VitalsScreenState createState() => VitalsScreenState();
}

class VitalsScreenState extends State<VitalsScreen> {
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 30,
        title: Text(
          'Digital Prescription',
          style: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1.25,
              color: Color(0xFF202741),
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(0xFFE1F9F2),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "VITALS & GENERAL EXAMINATION",
                style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                height: 2,
                color: Colors.black,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vitals',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        // fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  // PastHistory(),
                                  const OtherVitalsScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Add',
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                              fontSize: 17,
                              // fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF32856E),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 32,
                        decoration: const BoxDecoration(
                          color: Color(0xFF32856E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  Text(
                    'Blood Pressure',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 120,
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F7FC),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '120'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '/',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      width: 120,
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F7FC),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '80'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'mm Hg',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              buildVitalItem('SpO2 levels', '%', "95"),
              const SizedBox(height: 16),
              buildVitalItem('Pulse Rate', 'beats/min', '60'),
              const SizedBox(height: 16),
              buildVitalItem('RBS', 'mg/dL', '60'),
              const SizedBox(height: 16),
              buildVitalItem('Height', 'cm', '160'),
              const SizedBox(height: 16),
              buildVitalItem('Weight', 'Kg', '60'),
              const SizedBox(height: 16),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Personal History',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        // fontFamily: "Urbanist",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0C091F),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PersonalHistoryScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Add',
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                              fontSize: 17,
                              // fontFamily: "Urbanist",
                              fontWeight: FontWeight.w600,

                              color: Color(0xFF32856E),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 32,
                        decoration: const BoxDecoration(
                          color: Color(0xFF32856E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              buildPersonalHistorySection(
                context,
                [
                  'None',
                  'Aerobics',
                  'Yoga',
                  'Smoking',
                  'Tobacco',
                  'Gym',
                  'Alcohol Consumption',
                  'Sedentary job',
                  'Other',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPersonalHistorySection(
      BuildContext context, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 4.0,
          runSpacing: 8.0,
          children: options.map((option) {
            bool isSelected = selectedOptions.contains(option);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (option == 'Other') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PersonalHistoryScreen(),
                      ),
                    );
                  } else {
                    if (isSelected) {
                      selectedOptions.remove(option);
                    } else {
                      selectedOptions.add(option);
                    }
                  }
                });
              },
              child: Chip(
                label: Text(
                  option,
                  style: GoogleFonts.urbanist(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color:
                          isSelected ? Colors.white : const Color(0xFF0C091F),
                    ),
                  ),
                ),
                backgroundColor: isSelected
                    ? const Color(0xFF32856E)
                    : const Color(0xFFF5F5F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                    color: isSelected
                        ? Colors.grey.shade50
                        : const Color(0xFFF5F5F5),
                  ),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
