// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:healtether_clinic_app/Screens/DigitalScreensAll/family_history_screen.dart';
// import 'package:healtether_clinic_app/Screens/DigitalScreensAll/past_history_screen.dart';
// import 'package:healtether_clinic_app/Screens/DigitalScreensAll/past_medical_procedures.dart';
// import 'package:healtether_clinic_app/constant/constant.dart';
//
// import 'Vitals Screen/past_historyScreen.dart';
//
// class SavePastHistoryScreen extends StatefulWidget {
//   const SavePastHistoryScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SavePastHistoryScreen> createState() => _SavePastHistoryScreenState();
// }
//
// class _SavePastHistoryScreenState extends State<SavePastHistoryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade50,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Row(
//             children: [
//               InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Icon(
//                   Icons.arrow_back_ios,
//                   size: 18,
//                   color: Colors.grey,
//                 ),
//               ),
//               Text(
//                 'Create Digital Prescription',
//                 style: GoogleFonts.urbanist(
//                   textStyle: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                     height: 1.25,
//                     color: Color(0xFF202741),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           backgroundColor: const Color(0xFFE6FFFE),
//         ),
//         body: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'MEDICAL CONDITION INVESTIGATION',
//                       style: GoogleFonts.urbanist(
//                         textStyle: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.blackColor,
//                         ),
//                       ),
//                     ),
//                     const Divider(
//                       thickness: 1,
//                       height: 2,
//                       color: AppColors.blackColor,
//                     ),
//                     const SizedBox(height: 12),
//                     buildSectionContainer(
//                       'Past history',
//                       [
//                         'Diabetics',
//                         'Cardiovascular',
//                         'Gastrointestinal',
//
//                       ],
//                       context,
//                       // const PastHistoryScreen(),
//                       const PastHistory(),
//                     ),
//                     const SizedBox(height: 12),
//                     buildSectionContainer(
//                       'Family History',
//                       [
//                         'None',
//                         'Sickle Cell',
//                         'Hemophilia-A',
//                         'Epilepsy',
//                         'Asthma',
//                         'Other'
//                       ],
//                       context,
//                       const FamilyHistoryScreen(),
//                     ),
//                     const SizedBox(height: 12),
//                     buildSectionContainer(
//                       'Past medical procedures',
//                       ['None', 'Opt 1', 'Opt 2', 'Other'],
//                       context,
//                       const PastMedicalProcedures(),
//                     ),
//                     const SizedBox(height: 12),
//                     buildSectionContainer(
//                       'Allergies',
//                       [
//                         'None',
//                         'Dust',
//                         'Pollen',
//                         'Sunlight',
//                         'Nuts',
//                         'Anesthesia',
//                         'Berries',
//                         'Other'
//                       ],
//                       context,
//                       null, // No specific screen to navigate to
//                     ),
//                     const SizedBox(height: 12),
//                     buildSectionContainer(
//                       'Phobias/Fears',
//                       [
//                         'None',
//                         'Claustrophobia - closed space',
//                         'Aichmophobia - sharp objects',
//                         'Other'
//                       ],
//                       context,
//                       null,
//                     ),
//                     const SizedBox(height: 12),
//                     buildSectionContainer(
//                       'Medication History',
//                       ['None', 'Paracetamol', 'Insulin', 'Diclofenac', 'Other'],
//                       context,
//                       null, // No specific screen to navigate to
//                     ),
//                     const SizedBox(height: 150),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 color: Colors.white,
//                 padding: const EdgeInsets.all(12.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     buildButton('Next', AppColors.greenColor),
//                     const SizedBox(width: 8),
//                     buildButton('Clear', const Color(0xFFF5F5F5)),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildSectionContainer(
//       String title,
//       List<String> options,
//       BuildContext context,
//       Widget? navigateScreen,
//       ) {
//     Color containerColor;
//     if (title == 'Past history' ) {
//       containerColor = const Color(0xFFE6FFFE); // Set the color for specific sections
//     } else {
//       containerColor = AppColors.whiteColor; // Default color for other sections
//     }
//
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: containerColor,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(40),
//           bottomRight: Radius.circular(40),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           GestureDetector(
//             onTap: () {
//               if (navigateScreen != null) {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => navigateScreen));
//               }
//             },
//             child: Row(
//               children: [
//                 Text(
//                   title,
//                   style: GoogleFonts.urbanist(
//                     textStyle: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.blackColor,
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         if (navigateScreen != null) {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => navigateScreen));
//                         }
//                       },
//                       child: Text(
//                         AppText.add,
//                         style: GoogleFonts.montserrat(
//                           textStyle: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                             color: AppColors.greenColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 2,
//                       width: 40,
//                       color: AppColors.greenColor,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 1),
//           Wrap(
//             spacing: 4,
//             children: options
//                 .map((option) => buildOptionChip(context, option, title))
//                 .toList(),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget buildOptionChip(BuildContext context, String option, String section) {
//     Color chipColor = (section == 'Past history' )
//         ? const Color(0xFFAFE9D9)
//         : AppColors.white1Color;
//
//     void navigateToScreen() {
//       if (section == 'Past medical procedures') {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const PastMedicalProcedures(),
//           ),
//         );
//       } else if (section == 'Family History') {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const FamilyHistoryScreen(),
//           ),
//         );
//       } else if (section == 'Past history') {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const PastHistoryScreen(),
//           ),
//         );
//       }
//     }
//
//     void onDelete() {
//       // Implement deletion logic here
//       print('Deleted: $option');
//       // You can put your deletion logic here
//     }
//
//     return GestureDetector(
//       onTap: () {
//         if (option == 'Other') {
//           navigateToScreen();
//         } else {
//           print('Tapped on: $option');
//         }
//       },
//       child: Chip(
//         label: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               option,
//               style: const TextStyle(fontSize: 12),
//             ),
//             if (section == 'Past history' ) ...[
//               const SizedBox(width: 4),
//               GestureDetector(
//                 onTap: onDelete,
//                 child: Container(
//                   width: 18,
//                   height: 18,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFE7E7E7),
//                     borderRadius: BorderRadius.circular(40),
//                   ),
//                   child: const Icon(
//                     Icons.close,
//                     size: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ],
//         ),
//         backgroundColor: chipColor,
//         side: BorderSide.none,
//       ),
//     );
//   }
//
//   Widget buildButton(String label, Color color) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.4,
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(7),
//       ),
//       child: Center(
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: color == const Color(0xFFF5F5F5) ? Colors.black : Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/VitalsGeneralScreen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/vitals_save_data_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/vitals_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/medication_history_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/past_medical_procedures.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/patient_%20suffering_from_%20allergies_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/patient_having_phobias_screen.dart';
import 'package:healtether_clinic_app/constant/constant.dart';
import 'Vitals Screen/past_historyScreen.dart';
import 'family_history_screen.dart';

class SavePastHistoryScreen extends StatefulWidget {
  const SavePastHistoryScreen({Key? key}) : super(key: key);

  @override
  State<SavePastHistoryScreen> createState() => _SavePastHistoryScreenState();
}

class _SavePastHistoryScreenState extends State<SavePastHistoryScreen> {
  List<String> selectedFamilyHistory = [];
  List<String> selectedPastMedicalProcedures = [];
  List<String> selectedAllergies = [];
  List<String> selectedFears = [];
  List<String> selectedMedicationHistory = [];
  Map<String, bool> showOtherContainer = {
    'Family History': false,
    'Past medical procedures': false,
    'Allergies': false,
    'Phobias/Fears': false,
    'Medication History': false,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MEDICAL CONDITION INVESTIGATION',
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 2,
                      color: AppColors.blackColor,
                    ),
                    const SizedBox(height: 12),
                    buildSectionContainer(
                      'Past history',
                      [
                        'Diabetics',
                        'Cardiovascular',
                        'Gastrointestinal',
                      ],
                      context,
                      const PastHistory(),
                      selectedFamilyHistory,
                      false,
                    ),
                    const SizedBox(height: 12),
                    buildSectionContainer(
                      'Family History',
                      [
                        'None',
                        'Sickle Cell',
                        'Hemophilia-A',
                        'Epilepsy',
                        'Asthma',
                        'Other'
                      ],
                      context,
                      const FamilyHistoryScreen(),
                      selectedFamilyHistory,
                      showOtherContainer['Family History']!,
                    ),
                    const SizedBox(height: 12),
                    buildSectionContainer(
                      'Past medical procedures',
                      ['None', 'Appendectomy', 'Opt 1', 'Opt 2', 'Other'],
                      context,
                      const PastMedicalProcedures(),
                      selectedPastMedicalProcedures,
                      showOtherContainer['Past medical procedures']!,
                    ),
                    const SizedBox(height: 12),
                    buildSectionContainer(
                      'Allergies',
                      [
                        'None',
                        'Dust',
                        'Pollen',
                        'Sunlight',
                        // 'Nuts',
                        'Anesthesia',
                        // 'Berries',
                        'Other'
                      ],
                      context,
                      const PatientSufferingFromAllergiesScreen(),
                      selectedAllergies,
                      showOtherContainer['Allergies']!,
                    ),
                    const SizedBox(height: 12),
                    buildSectionContainer(
                      'Phobias/Fears',
                      [
                        'None',
                        'Claustrophobia - closed space',
                        'Aichmophobia - sharp objects',
                        'Other'
                      ],
                      context,
                      const PatientHavingPhobiasScreen(),
                      selectedFears,
                      showOtherContainer['Phobias/Fears']!,
                    ),
                    const SizedBox(height: 12),
                    buildSectionContainer(
                      'Medication History',
                      ['None', 'Paracetamol', 'Insulin', 'Diclofenac', 'Other'],
                      context,
                      const MedicationHistoryScreen(),
                      selectedMedicationHistory,
                      showOtherContainer['Medication History']!,
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildButton('Clear', const Color(0xFFF5F5F5)),
                    const SizedBox(width: 8),
                    GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Past Medical History have been saved successfully.'),
                            ),
                          );
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const VitalsScreen();
                          }));
                        },
                        child: buildButton('Add Vitals', AppColors.greenColor)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionContainer(
    String title,
    List<String> options,
    BuildContext context,
    Widget? navigateScreen,
    List<String> selectedOptions,
    bool showOther,
  ) {
    Color containerColor;
    if (title == 'Past history') {
      containerColor = const Color(0xFFE1F9F2);
    } else {
      containerColor = AppColors.whiteColor;
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (title == 'Past history' && navigateScreen != null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => navigateScreen));
              }
            },
            child: Row(
              children: [
                Text(
                  title,
                  style: GoogleFonts.urbanist(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (navigateScreen != null && title == 'Past history') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => navigateScreen));
                        }
                      },
                      child: Text(
                        AppText.add,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.greenColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      width: 40,
                      color: AppColors.greenColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 1),
          Wrap(
            spacing: 4,
            children: options
                .map((option) =>
                    buildOptionChip(context, option, title, selectedOptions))
                .toList(),
          ),
          if (showOther)
            Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: buildOtherOptions(title),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildOptionChip(BuildContext context, String option, String section,
      List<String> selectedOptions) {
    bool isSelected = selectedOptions.contains(option);

    Color chipColor = section == 'Past history'
        ? const Color(0xFFAFE9D9)
        : isSelected
            ? AppColors.greenColor
            : AppColors.white1Color;

    Color textColor = isSelected ? Colors.white : AppColors.blackColor;
    void onDelete() {
      print('Deleted: $option');
    }

    return GestureDetector(
      onTap: () {
        if (section != 'Past history') {
          setState(() {
            if (isSelected) {
              selectedOptions.remove(option);
            } else {
              selectedOptions.add(option);
            }
            if (option == 'Other') {
              showOtherContainer[section] = !showOtherContainer[section]!;
            }
          });
        }
        print('Tapped on: $option');
      },
      child: Chip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              option,
              style: TextStyle(fontSize: 12, color: textColor),
            ),
            if (section == 'Past history') ...[
              const SizedBox(width: 4),
              GestureDetector(
                onTap: onDelete,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7E7E7),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ],
        ),
        backgroundColor: chipColor,
        side: BorderSide.none,
      ),
    );
  }

  List<Widget> buildOtherOptions(String section) {
    switch (section) {
      case 'Family History':
        return [
          const Row(
            children: [Text('Procedure 1, time period')],
          ),
          // buildOptionChip(context, 'Sickle Cell', section, selectedFamilyHistory),
          // buildOptionChip(context, 'Hemophilia-A', section, selectedFamilyHistory),
        ];
      case 'Past medical procedures':
        return [
          const Row(
            children: [Text('Procedure 1, time period')],
          ),
        ];
      case 'Allergies':
        return [
          const Row(
            children: [Text('Allergy 1, Allergy 2')],
          ),
        ];
      case 'Phobias/Fears':
        return [
          const Row(
            children: [Text('Phobia 1 ,Phobia 2')],
          ),
        ];
      case 'Medication History':
        return [
          buildOptionChip(
              context, 'Med 1,', section, selectedMedicationHistory),
          buildOptionChip(context, 'Med 2', section, selectedMedicationHistory),
        ];
      default:
        return [];
    }
  }

  Widget buildButton(String label, Color color) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color:
                color == const Color(0xFFF5F5F5) ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
