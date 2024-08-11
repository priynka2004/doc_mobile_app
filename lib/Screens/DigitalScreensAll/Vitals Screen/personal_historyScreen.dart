// import 'package:flutter/material.dart';
// import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/aerobic_screen.dart';
// import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/alcohol_screen.dart';
// import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/smoking_screen.dart';
// import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/vitals_detail_screen.dart';
//
// class PersonalHistoryScreen extends StatefulWidget {
//   const PersonalHistoryScreen({Key? key}) : super(key: key);
//
//   @override
//   State<PersonalHistoryScreen> createState() => _PersonalHistoryScreenState();
// }
//
// class _PersonalHistoryScreenState extends State<PersonalHistoryScreen> {
//   List<String> _selectedDiseases = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Expanded(
//               child: Text(
//                 'Personal History',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const VitalDetailScreen()),
//                 );
//               },
//               child: Container(
//                 width: 70,
//                 height: 35,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF32856E),
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Save',
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 16.0, right: 16),
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: 48,
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF5F5F5),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: const Center(
//                 child: Row(
//                   children: [
//                     Icon(Icons.search),
//                     SizedBox(width: 4),
//                     Flexible(
//                       child: TextField(
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 16,
//                           height: 1.2,
//                           color: Color(0xFF110C2C),
//                         ),
//                         decoration: InputDecoration.collapsed(
//                           hintText: 'Search & select disease',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Padding(
//             padding: const EdgeInsets.only(left: 16.0, right: 16),
//             child: Text(
//               "${_selectedDiseases.length} selected",
//               style: const TextStyle(
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w500,
//                 fontSize: 16,
//                 height: 1.2,
//                 color: Color(0xFFA5A5A5),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: ListView(
//               children: [
//                 buildOption("Aerobics"),
//                 CustomDivider(),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 buildOption("Yoga"),
//                 CustomDivider(),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 buildOption("Smoking"),
//                 CustomDivider(),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 buildOption("Tobacco"),
//                 CustomDivider(),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 buildOption("Gym"),
//                 CustomDivider(),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 buildOption("Alcohol consumption"),
//                 CustomDivider(),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 buildOption("Sedentary job"),
//                 CustomDivider(),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 buildOption("NSAID Drugs"),
//                 CustomDivider(),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 buildOption("Option 1"),
//                 CustomDivider(),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 buildOption("Option 2"),
//                 CustomDivider(),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 buildOption("Option 3"),
//                 CustomDivider(),
//                 const SizedBox(
//                   height: 8,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildOption(String title) {
//     bool isSelected = _selectedDiseases.contains(title);
//
//     return InkWell(
//
//
//
//       child: Container(
//         width: double.infinity,
//         height: 50,
//         decoration: BoxDecoration(
//           color: const Color(0xFFF5F5F5),
//           borderRadius: BorderRadius.circular(2),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Row(
//             children: [
//               InkWell(
//                 onTap: () {
//                   setState(() {
//                     if (isSelected) {
//                       _selectedDiseases.remove(title);
//                     } else {
//                       _selectedDiseases.add(title);
//                     }
//                   });
//                 },
//                 borderRadius: BorderRadius.circular(50),
//                 child: Container(
//                   width: 20,
//                   height: 20,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(4),
//                     border: Border.all(
//                       color: const Color(0xFFA1A1A1),
//                     ),
//                     color:
//                     isSelected ? const Color(0xFFFEFEFE) : Colors.transparent,
//                   ),
//                   child: isSelected
//                       ? Icon(
//                     Icons.check,
//                     size: 18,
//                     color: Colors.black,
//                   )
//                       : null,
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Center(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w400,
//                     fontSize: 17,
//                     height: 1.2,
//                     color: Color(0xFF000000),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showAerobicScreen() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return AerobicScreen();
//       },
//     );
//   }
//
//   void _showSmokingScreen() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return SmokingScreen();
//       },
//     );
//   }
//
//   void _showAlcoholScreen() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return AlcoholScreen();
//       },
//     );
//   }
// }
//
// class CustomDivider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 16.0),
//       child: Container(
//         height: 1.0,
//         margin: EdgeInsets.symmetric(vertical: 16.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(2.0),
//           gradient: LinearGradient(
//             colors: [Color(0xFFFFFFFF), Color(0xFFE0E0E0)],
//             stops: [0.0, 5.0],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/smoking_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/vitals_detail_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/alcohol_screen.dart';
import 'package:healtether_clinic_app/constant/app_colors.dart';
import 'aerobic_screen.dart';

class PersonalHistoryScreen extends StatefulWidget {
  const PersonalHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PersonalHistoryScreen> createState() => _PersonalHistoryScreenState();
}

class _PersonalHistoryScreenState extends State<PersonalHistoryScreen> {
  final List<String> _selectedDiseases = [];
  bool isSelected = false;

  void _toggleSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Expanded(
              child: Text(
                'Personal History',
          style: GoogleFonts.urbanist(
            textStyle: const TextStyle(fontSize: 16,
            fontWeight: FontWeight.w700,
            color:  Color(0xFF0C091F),
            ),
          ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VitalDetailScreen()),
                );
              },
              child: Container(
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFF32856E),
                  borderRadius: BorderRadius.circular(4),
                ),
                child:  Center(
                  child: Text(
                    'Save',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(color: Colors.white, fontSize: 13,
                      fontWeight: FontWeight.w500
                      ),
                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 4),
                    Flexible(
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.2,
                          color: AppColors.blue1Color,
                        ),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search & select ',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Text(
              "${_selectedDiseases.length} selected",
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 1.2,
                color: Color(0xFFA5A5A5),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                buildOption("Alcohol consumption"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Yoga"),
                // CustomDivider(),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Sedentary job"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Tabacco"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Aerobics "),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Smoking"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Gym"),
                const SizedBox(
                  height: 8,
                ),
                buildOption("NSAID drugs"),
                const SizedBox(
                  height: 8,
                ),
                buildOption("OTC Vitamins & Supplements"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Opt 1"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Opt 2"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Opt 3"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ), buildOption("Opt 4"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ), buildOption("Opt 5"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOption(String title) {
    bool isSelected = _selectedDiseases.contains(title);
    return GestureDetector(
      onTap: () {
        if (title == "Yoga") {
          _showAerobicScreen(context);
        } else if (title == "Aerobics") {
          _showAerobicScreen(context);
        } else if (title == "Smoking") {
          _showSmokingScreen(context);
        } else if (title == "Alcohol consumption") {
          _showAlcoholScreen(context);
        } else {
          setState(() {
            if (isSelected) {
              _selectedDiseases.remove(title);
            } else {
              _selectedDiseases.add(title);
            }
          });
        }
      },
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xFFF8F7FC),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color(0xFFA1A1A1),
                ),
                color: isSelected ? const Color(0xFFFEFEFE) : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(
                Icons.check,
                size: 18,
                color: Colors.black,
              )
                  : null,
            ),
            const SizedBox(width: 16),
            Center(
              child: Text(
                title,
                style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 1.2,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }}

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        height: 1.0,
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          gradient: const LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFE0E0E0)],
            stops: [0.0, 5.0],
          ),
        ),
      ),
    );
  }
}

void _showAerobicScreen(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return AerobicScreen();
    },
  );
}

void _showSmokingScreen(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return  SmokingScreen();
    },
  );
}

void _showAlcoholScreen(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return AlcoholScreen();
    },
  );
}
