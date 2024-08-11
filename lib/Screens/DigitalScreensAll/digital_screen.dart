import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/vitals_detail_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/drug_prescription_followup_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/lab_investigations/lab_investigations_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/save_medication_history_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/symptoms%20_diagnosis/create_digital_prescription.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/symptoms%20_diagnosis/create_digital_prescription_symptoms_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/symptoms%20_diagnosis/create_digital_presscription_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/symptoms_tests_screen.dart';
import 'package:healtether_clinic_app/constant/constant.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/vitals_screen.dart';
import 'symptoms _diagnosis/create_digital_prescription_screens.dart';

class DigitalScreen extends StatefulWidget {
  const DigitalScreen({super.key});

  @override
  State<DigitalScreen> createState() => _DigitalScreenState();
}

class _DigitalScreenState extends State<DigitalScreen> {
  Widget _buildMenuItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 59,
        decoration: const BoxDecoration(
          color: AppColors.white1Color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                title,
                style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 24,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isDrawerOpen = false;

  void _toggleDrawer() {
    if (_scaffoldKey.currentState!.isEndDrawerOpen) {
      Navigator.of(context).pop();
    } else {
      _scaffoldKey.currentState!.openEndDrawer();
    }
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leadingWidth: 30,
          title: Text(
            AppText.digitalPrescription,
            style: GoogleFonts.urbanist(
              textStyle: const TextStyle(
                fontSize: 18,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                height: 1.25,
                color: AppColors.lightBlueColor,
              ),
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded)),
          backgroundColor: const Color(0xFFE1F9F2),
          actions: [
            IconButton(
              onPressed: _toggleDrawer,
              icon: Icon(_isDrawerOpen ? Icons.close : Icons.menu),
            ),
          ],
        ),
        endDrawer: SizedBox(
          height: 600,
          child: Drawer(
            width: 320,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.64,
                    child: Material(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      elevation: 6,
                      // shadowColor: const Color(0xffF5F5F5),
                      // color: const Color(0xffF5F5F5),
                      // surfaceTintColor: const Color(0xffF5F5F5),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Vitals',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff0C091F)),
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'Edit',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff5351C7)),
                                    ),
                                    Container(
                                      height: 1,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                        color: Color(0xff5351C7),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 4),
                                    height: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFFF7F7F7),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'SpO2',
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff413D56),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Center(
                                          child: Image.asset(
                                              "assets/homeimages/Vector (4).png"),
                                        ),
                                        const SizedBox(height: 4),
                                        Center(
                                          child: Text(
                                            '97',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff0C091F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Container(
                                    height: 75,
                                    padding: const EdgeInsets.only(left: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffF5F5F5),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BP',
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff413D56),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Center(
                                          child: Image.asset(
                                              "assets/homeimages/Vector (5).png"),
                                        ),
                                        const SizedBox(height: 4),
                                        Center(
                                          child: Text(
                                            '80/120',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff0C091F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Container(
                                    height: 75,
                                    padding: const EdgeInsets.only(left: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffF5F5F5),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Heart rate',
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff413D56),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Center(
                                          child: Image.asset(
                                              "assets/homeimages/Vector (6).png"),
                                        ),
                                        const SizedBox(height: 4),
                                        Center(
                                          child: Text(
                                            '80',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff0C091F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Container(
                                    height: 75,
                                    padding: const EdgeInsets.only(left: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffF5F5F5),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BG',
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff413D56),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Center(
                                          child: Image.asset(
                                              "assets/homeimages/droplet-outline.png"),
                                        ),
                                        const SizedBox(height: 4),
                                        Center(
                                          child: Text(
                                            '150',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff0C091F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(right: 152),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 75,
                                      padding: const EdgeInsets.only(left: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xffF5F5F5),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ht',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff413D56),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Center(
                                            child: Image.asset(
                                                "assets/homeimages/Vector (7).png"),
                                          ),
                                          const SizedBox(height: 4),
                                          Center(
                                            child: Text(
                                              '160',
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff0C091F),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Container(
                                      height: 75,
                                      padding: const EdgeInsets.only(left: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xffF5F5F5),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Wt',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff413D56),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Center(
                                            child: Image.asset(
                                                "assets/homeimages/Vector (8).png"),
                                          ),
                                          const SizedBox(height: 4),
                                          Center(
                                            child: Text(
                                              '60',
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff0C091F),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.06),
                  Material(
                    elevation: 8,
                    shadowColor: const Color(0xFFFFFFFF),
                    surfaceTintColor: const Color(0xFFFFFFFF),
                    color: const Color(0xFFFFFFFF),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Past History',
                                style: GoogleFonts.urbanist(
                                  textStyle: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff0C091F),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Edit',
                                    style: TextStyle(
                                      fontFamily: 'Urbanist',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff5351C7),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff5351C7),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Text(
                            'Family History',
                            style: GoogleFonts.urbanist(
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff868686),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: width,
                            height: 40,
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xffF7F7F7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: const Text(
                              'Asthma, Hypertension',
                              style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff0C091F),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Medical Procedures',
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff868686),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: width,
                            height: 40,
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xffF7F7F7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: const Text(
                              'Heart Surgery',
                              style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff0C091F),
                              ),
                            ),
                            // onTap: () {},
                            // contentPadding: const EdgeInsets.symmetric(
                            //     horizontal: 10.0, vertical: 2.0),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Medication',
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff868686),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: width,
                            height: 40,
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xffF7F7F7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: const Text(
                              'Dolo - 650, Paracetomol',
                              style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff0C091F),
                              ),
                            ),
                            // onTap: () {},
                            // contentPadding: const EdgeInsets.symmetric(
                            //     horizontal: 8.0, vertical: 2.0),
                          ),
                          SizedBox(height: height * 0.04),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Allergies - ',
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff868686),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Pollen, Sunlight',
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff0C091F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Phobias/Fears - ',
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff868686),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Pollen, Sunlight',
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff0C091F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildMenuItem(
                title: AppText.symptomsTests,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CreateDigitalPrescriptionScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              _buildMenuItem(
                title: "Lab tests ",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LabInvestigationsScreen(
                                selectedDiseases: [],
                              )));
                },
              ),
              const SizedBox(height: 8),
              _buildMenuItem(
                title: AppText.drugPrescription,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DrugPrescriptionFollowupScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              _buildMenuItem(
                title: AppText.pastMedicalHistory,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SaveMedicationHistoryScreen()));
                },
              ),
              const SizedBox(height: 8),
              _buildMenuItem(
                title: 'Vitals & General Examination',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VitalDetailScreen(),
                    ),
                  );
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Row(children: [
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xffF7F7F7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Text(
                        'xxxxx',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF32856E),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child:  Center(
                        child: Text(
                          'Preview Rx',
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',),
                        ),),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
