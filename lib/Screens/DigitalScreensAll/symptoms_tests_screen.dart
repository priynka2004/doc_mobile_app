import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/VitalsGeneralScreen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/vitals_detail_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/vitals_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/family_history_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/medication_history_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/past_history_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/past_medical_procedures.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/patient_%20suffering_from_%20allergies_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/patient_having_phobias_screen.dart';
import 'package:healtether_clinic_app/constant/constant.dart';

class SymptomsTestsScreen extends StatefulWidget {
  const SymptomsTestsScreen({Key? key}) : super(key: key);

  @override
  State<SymptomsTestsScreen> createState() => _SymptomsTestsScreenState();
}

class _SymptomsTestsScreenState extends State<SymptomsTestsScreen> {
  final Map<String, Set<String>> selectedOptions = {};
  final Map<String, TextEditingController> textControllers = {};
  final Map<String, bool> isOtherVisible = {};

  final Map<String, List<String>> sectionLists = {
    'Past history': ['Disease 1, disease 2'],
    'Family History': ['Disease - time period'],
    'Past medical procedures': ['Procudure 1, time period'],
    'Allergies': ['Allergy1, Allergy2'],
    'Phobias/Fears': ['Phobia1, Phobia2'],
    'Medication History': ['Med1, Med2'],
  };

  @override
  void initState() {
    super.initState();
    final sections = sectionLists.keys.toList();
    for (var section in sections) {
      textControllers[section] = TextEditingController();
      isOtherVisible[section] = false;
      selectedOptions[section] = {'None'};
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,leadingWidth: 30,
          title: Text(
            AppText.digitalPrescription,
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.25,
                color: AppColors.lightBlueColor,
              ),
            ),
          ),leading:  IconButton(
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
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MEDICAL CONDITION INVESTIGATION',
                      style: GoogleFonts.montserrat(
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
                        'None',
                        'Diabetics',
                        'TB',
                        'Hepatitis',
                        'Cardiovascular',
                        'Gastrointestinal',
                        'HIV',
                        'Other'
                      ],
                      context,
                      const PastHistoryScreen(),
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
                    ),
                    const SizedBox(height: 12),
                    buildSectionContainer(
                      'Past medical procedures',
                      ['None', 'Appendectomy', 'Opt 1', 'Opt 2', 'Other'],
                      context,
                      const PastMedicalProcedures(),
                    ),
                    const SizedBox(height: 12),
                    buildSectionContainer(
                      'Allergies',
                      [
                        'None',
                        'Dust',
                        'Pollen',
                        'Sunlight',
                        'Anesthesia',
                        'Other'
                      ],
                      context,
                      const PatientSufferingFromAllergiesScreen(),
                    ),
                    const SizedBox(height: 12),
                    buildSectionContainer(
                      'Phobias/Fears',
                      [
                        'None',
                        'Claustrophobia - closed spaces',
                        'Aichmophobia - sharp objects',
                        'Other'
                      ],
                      context,
                      const PatientHavingPhobiasScreen(),
                    ),
                    const SizedBox(height: 12),
                    buildSectionContainer(
                      'Medication History',
                      [
                        'None',
                        'Paracetamol 500mg',
                        'Insulin',
                        'Diclofenas',
                        'Other',
                      ],
                      context,
                      const MedicationHistoryScreen(),
                    ),
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
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildButton('Clear', const Color(0xFFF5F5F5)),
                    const SizedBox(width: 8),
                    GestureDetector(onTap:(){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Past Medical History have been saved successfully.'),
                        ),
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const VitalsScreen();
                      }));
                    },child: buildButton('Add Vitals', AppColors.greenColor)),
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
      String title, List<String> options, BuildContext context, Widget targetScreen) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => targetScreen),
              );
            },
            child: Row(
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppText.add,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.greenColor,
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
                .map((option) => buildOptionChip(option, title))
                .toList(),
          ),
          if (isOtherVisible[title]!)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: sectionLists[title]!.length,
                      itemBuilder: (context, index) {
                        var item = sectionLists[title]![index];
                        return Row(
                          children: [
                            Text(item),
                          ],
                        );
                      }
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildOptionChip(String option, String section) {
    final isSelected = selectedOptions[section]?.contains(option) ?? false;
    final isNoneSelected = selectedOptions[section]?.contains('None') ?? false;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (option == 'None') {
            selectedOptions[section] = {'None'};
            isOtherVisible[section] = false;
            textControllers[section]?.clear();
          } else {
            selectedOptions[section]?.remove('None');
            if (isSelected) {
              selectedOptions[section]?.remove(option);
              if (option == 'Other') {
                isOtherVisible[section] = false;
                textControllers[section]?.clear();
              }
            } else {
              selectedOptions[section]?.add(option);
              if (option == 'Other') {
                isOtherVisible[section] = true;
              }
            }
          }
        });
      },
      child: Chip(
        label: Text(
          option,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isSelected
            ? const Color(0xFF198E79)
            : AppColors.white1Color,
        side: BorderSide.none,
      ),
    );
  }

  Widget buildButton(String label, Color color) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF2A2A2A14),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: label == 'Clear' ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
