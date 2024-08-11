import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/vitals_detail_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/digital_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/lab_investigations/lab_vitals_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/save_medication_history_screen.dart';
import 'package:healtether_clinic_app/constant/app_colors.dart';
import 'package:healtether_clinic_app/constant/app_text.dart';

class LabInvestigationsScreen extends StatefulWidget {
  final List<String> selectedDiseases;

  const LabInvestigationsScreen({Key? key, required this.selectedDiseases})
      : super(key: key);

  @override
  State<LabInvestigationsScreen> createState() =>
      _LabInvestigationsScreenState();
}

class _LabInvestigationsScreenState extends State<LabInvestigationsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSelected = false;
  late List<String> _selectedDiseases;

  @override
  void initState() {
    super.initState();
    _selectedDiseases = List<String>.from(widget.selectedDiseases);
    isSelected = widget.selectedDiseases.isNotEmpty;
  }

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
                fontSize: 20,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                height: 1.25,
                color: AppColors.lightBlueColor,
              ),
            ),
          ),
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
                      shadowColor: const Color(0xffFFFFFF),
                      color: const Color(0xffFFFFFF),
                      surfaceTintColor: const Color(0xffFFFFFF),
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
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const VitalDetailScreen(),
                                      ),
                                    );
                                  },
                                  child: Column(
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
                                      color: const Color(0xffF5F5F5),
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
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SaveMedicationHistoryScreen()));
                                },
                                child: Column(
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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          'LAB INVESTIGATION',
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: AppColors.blackColor,
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8F7FC),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search by tests or domain",
                              hintStyle: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto',
                                  color: Color(0xff413D56),
                                ),
                              ),
                              border: InputBorder.none,
                              icon: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LabVitalsScreen(),
                                    ),
                                  );
                                },
                                child: const Icon(Icons.search,
                                    color: AppColors.blackColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      isSelected
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Lab tests',
                                    style: GoogleFonts.urbanist(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                        color: Color(0xff0C091F),
                                      ),
                                    ),
                                  ),
                                ),
                                Wrap(
                                  spacing: 8.0,
                                  children: _selectedDiseases
                                      .map((disease) => Chip(
                                            label: Text(disease,
                                                style: const TextStyle(
                                                    color: Colors.black)),
                                            backgroundColor:
                                                const Color(0xFFC9F0E5),
                                            deleteIcon: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Icon(Icons.close,
                                                  color: Colors.black,
                                                  size: 20),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: const BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            onDeleted: () {
                                              setState(() {
                                                _selectedDiseases
                                                    .remove(disease);
                                                if (_selectedDiseases.isEmpty) {
                                                  isSelected = false;
                                                }
                                              });
                                            },
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(height: 12),
                              ],
                            )
                          : Container(),
                      const SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Text(
                          isSelected ? "Associated Tests" : "Recommended Tests",
                          style: GoogleFonts.urbanist(
                            textStyle: TextStyle(
                              fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? const Color(0xff1B9C85)
                                : const Color(0xff1B9C85),
                            fontFamily: 'Urbanist',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white1Color,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "CBC",
                                  style: GoogleFonts.urbanist(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff0C091F),
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white1Color,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: InkWell(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Hemoglobin",
                                    style: GoogleFonts.urbanist(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff0C091F),
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white1Color,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: InkWell(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "TSH",
                                    style: GoogleFonts.urbanist(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff0C091F),
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white1Color,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "TSH, T1, T2, T3",
                                  style: GoogleFonts.urbanist(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff0C091F),
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white1Color,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "CMC",
                                  style: GoogleFonts.urbanist(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff0C091F),
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white1Color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "Lipid Profile",
                                  style: GoogleFonts.urbanist(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff0C091F),
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      // Row(
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 20, right: 20),
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             color: AppColors.white1Color,
                      //             borderRadius: BorderRadius.circular(8)),
                      //         child: Center(
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(8),
                      //             child: Row(
                      //               children: [
                      //                 const Text(
                      //                   "CBC",
                      //                   style: TextStyle(fontSize: 14),
                      //                 ),
                      //                 const SizedBox(width: 8),
                      //                 SvgPicture.asset(
                      //                   'assets/homeimages/Vector (13).svg',
                      //                   width: 16,
                      //                   height: 16,
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 6,
                      //     ),
                      //     Container(
                      //       decoration: BoxDecoration(
                      //           color: AppColors.white1Color,
                      //           borderRadius: BorderRadius.circular(8)),
                      //       child: Center(
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8),
                      //           child: Row(
                      //             children: [
                      //               const Text(
                      //                 "Hemoglobin",
                      //                 style: TextStyle(fontSize: 14),
                      //               ),
                      //               const SizedBox(width: 8),
                      //               SvgPicture.asset(
                      //                 'assets/homeimages/Vector (13).svg',
                      //                 width: 16,
                      //                 height: 16,
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      // Row(
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 20, right: 20),
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             color: AppColors.white1Color,
                      //             borderRadius: BorderRadius.circular(8)),
                      //         child: Center(
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(8),
                      //             child: Row(
                      //               children: [
                      //                 const Text(
                      //                   "TSH",
                      //                   style: TextStyle(fontSize: 14),
                      //                 ),
                      //                 const SizedBox(width: 8),
                      //                 SvgPicture.asset(
                      //                   'assets/homeimages/Vector (13).svg',
                      //                   width: 16,
                      //                   height: 16,
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 6,
                      //     ),
                      //     Container(
                      //       decoration: BoxDecoration(
                      //           color: AppColors.white1Color,
                      //           borderRadius: BorderRadius.circular(8)),
                      //       child: Center(
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8),
                      //           child: Row(
                      //             children: [
                      //               const Text(
                      //                 "TSH, T1, T2, T3",
                      //                 style: TextStyle(fontSize: 14),
                      //               ),
                      //               const SizedBox(width: 8),
                      //               SvgPicture.asset(
                      //                 'assets/homeimages/Vector (13).svg',
                      //                 width: 16,
                      //                 height: 16,
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      // Row(
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 20, right: 20),
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             color: AppColors.white1Color,
                      //             borderRadius: BorderRadius.circular(8)),
                      //         child: Center(
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(8),
                      //             child: Row(
                      //               children: [
                      //                 const Text(
                      //                   "CMC",
                      //                   style: TextStyle(fontSize: 14),
                      //                 ),
                      //                 const SizedBox(width: 8),
                      //                 SvgPicture.asset(
                      //                   'assets/homeimages/Vector (13).svg',
                      //                   width: 16,
                      //                   height: 16,
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 6,
                      //     ),
                      //     Container(
                      //       decoration: BoxDecoration(
                      //           color: AppColors.white1Color,
                      //           borderRadius: BorderRadius.circular(8)),
                      //       child: Center(
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8),
                      //           child: Row(
                      //             children: [
                      //               const Text(
                      //                 "Lipid Profile",
                      //                 style: TextStyle(fontSize: 14),
                      //               ),
                      //               const SizedBox(width: 8),
                      //               SvgPicture.asset(
                      //                 'assets/homeimages/Vector (13).svg',
                      //                 width: 16,
                      //                 height: 16,
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      const Divider(),
                      const SizedBox(
                        height: 6,
                      ),
                      InkWell(
                        child: Text(
                          "Frequently searched tests",
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                              fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: Color(0xff868686),
                          ),
                        ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white1Color,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "CBC",
                                  style: GoogleFonts.urbanist(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff0C091F),
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white1Color,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: InkWell(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Hemoglobin",
                                    style: GoogleFonts.urbanist(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff0B1F19),
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white1Color,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: InkWell(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "TSH",
                                    style: GoogleFonts.urbanist(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff0B1F19),
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white1Color,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "TSH, T1, T2, T3",
                                  style: GoogleFonts.urbanist(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff0B1F19),
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white1Color,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "CMC",
                                  style: GoogleFonts.urbanist(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff0B1F19),
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white1Color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "Lipid Profile",
                                  style: GoogleFonts.urbanist(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff0B1F19),
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.selectedDiseases.clear();
                            isSelected = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          'Clear',
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                              fontSize: 17,
                              color: Color(0xff0B1F19),
                              fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Lab tests have been saved successfully.'),
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DigitalScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                              fontSize: 17,
                            color: Color(0xffFFFFFF),
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
