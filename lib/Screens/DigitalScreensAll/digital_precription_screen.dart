import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/custom_textfield.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/digital_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/show_bottom_sheet.dart';
import 'package:healtether_clinic_app/constant/constant.dart';

import 'drugs_card_screen.dart';
import 'drugs_prescription_screen.dart';

class DigitalPrecriptionScreen extends StatefulWidget {
  final String? dosageFrequency;
  final String? dosageTime;
  final List<String>? selectedDrugs;
  const DigitalPrecriptionScreen({super.key, this.dosageFrequency, this.dosageTime, this.selectedDrugs, });

  @override
  State<DigitalPrecriptionScreen> createState() =>
      _DigitalPrecriptionScreenState();
}

class _DigitalPrecriptionScreenState extends State<DigitalPrecriptionScreen> {
  TextEditingController balancedDietController = TextEditingController();
  TextEditingController adequateWaterController = TextEditingController();
  bool isAdditionalInfoVisible = false;
  bool additionalInfoVisible = false;
  String selectedFollowUpDate = '';
  // String selectedTime = '';
  bool showDateWidget = false;
  bool  showTimeWidget = false;
  bool isCustomDateSelected = false;
  bool isCustomTimeSelected = false;
  // bool isSelected = false;
  DateTime? selectedDate;
  String selectedDateText = 'None';
  String selectedTime = 'None';
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (BuildContext context) {
        DateTime tempPickedDate = selectedDate ?? DateTime.now();
        return Container(
          height: MediaQuery
              .of(context)
              .copyWith()
              .size
              .height / 2,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child:  Text(
                  'Select the start and end date for medication',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff32856E),
                  ),
                ),
              ),
              Expanded(
                child: CalendarDatePicker(
                  initialDate: tempPickedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2040, 12, 31),
                  onDateChanged: (DateTime date) {
                    tempPickedDate = date;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedDate = tempPickedDate;
                        selectedTime = 'Custom';
                      });
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        selectedTime = 'Custom';
      });
    }
  }



  void toggleAdditionalInfo() {
    setState(() {
      isAdditionalInfoVisible = !isAdditionalInfoVisible;
    });
  }



  TextEditingController quantityController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  DateTime? selectedDate1;
  DateTime? selectedDate2;
  bool showBalancedDietHint = true;
  bool showAdequateWaterHint = true;

  @override
  void dispose() {
    balancedDietController.dispose();
    adequateWaterController.dispose();
    super.dispose();
  }

  void updateBalancedDietField() {
    setState(() {
      if (showBalancedDietHint) {
        balancedDietController.text = 'Eat a balanced diet with lots of fibre.\nDrink lots of water.Drink Electrolyte Solution to stay hydrated.';
        // 'Drink lots of water.Drink Electrolyte Solution to stay \n'
        // 'hydrated.';
        balancedDietController.selection = TextSelection.fromPosition(
          TextPosition(offset: balancedDietController.text.length,),
        );
      }
      showBalancedDietHint = false;
    });
  }
  void updateAdequateWaterField() {
    setState(() {
      if (showAdequateWaterHint) {
        adequateWaterController.text = 'Avoid Strenuous exercises.';
      }
      showAdequateWaterHint = false;
    });
  }
  @override
  void initState() {
    super.initState();
    print('Selected Drugs: ${widget.selectedDrugs}');
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leadingWidth: 30,
          title: Text(
            AppText.digitalPrescription,
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 18,
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
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
        endDrawer: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: const BoxDecoration(
              boxShadow: [],
            ),
            child: Drawer(
              width: 320,
              child: Container(
                height: 800,
                child: Card(
                  color: const Color(0xffFFFFFF),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        decoration: const BoxDecoration(
                          color: Color(0xffFFFFFF),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 4),
                                    height: 60,
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
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff413D56),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Center(
                                          child: Image.asset(
                                              "assets/homeimages/Vector (4).png"),
                                        ),
                                        const SizedBox(height: 3),
                                        Center(
                                          child: Text(
                                            '97',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                fontSize: 8,
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
                                    height: 60,
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
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff413D56),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Center(
                                          child: Image.asset(
                                              "assets/homeimages/Vector (5).png"),
                                        ),
                                        const SizedBox(height: 3),
                                        Center(
                                          child: Text(
                                            '80/120',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                fontSize: 8,
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
                                    height: 60,
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
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff413D56),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Center(
                                          child: Image.asset(
                                              "assets/homeimages/Vector (6).png"),
                                        ),
                                        const SizedBox(height: 3),
                                        Center(
                                          child: Text(
                                            '80',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                fontSize: 8,
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
                                    height: 60,
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
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff413D56),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Center(
                                          child: Image.asset(
                                              "assets/homeimages/droplet-outline.png"),
                                        ),
                                        const SizedBox(height: 3),
                                        Center(
                                          child: Text(
                                            '150',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                fontSize: 8,
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
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.only(right: 152),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 60,
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
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff413D56),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Center(
                                            child: Image.asset(
                                                "assets/homeimages/Vector (7).png"),
                                          ),
                                          const SizedBox(height: 3),
                                          Center(
                                            child: Text(
                                              '160',
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                  fontSize: 8,
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
                                      height: 60,
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
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff413D56),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Center(
                                            child: Image.asset(
                                                "assets/homeimages/Vector (8).png"),
                                          ),
                                          const SizedBox(height: 3),
                                          Center(
                                            child: Text(
                                              '60',
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                  fontSize: 8,
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
                      ListTile(
                        title: const Text(
                          'Past History',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: const Text(
                          'Edit',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5351C7),
                          ),
                        ),
                        onTap: () {},
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2.0),
                      ),
                      const Text(
                        'Family History',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff868686),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffF7F7F7),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Padding(
                            padding: EdgeInsets.only(top: 14.0, bottom: 14),
                            child: Text(
                              'Asthma, Hypertension',
                              style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff0C091F),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Medical Procedures',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff868686),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffF7F7F7),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 14.0, bottom: 14),
                          child: Text(
                            'Heart Surgery',
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff0C091F),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Medication',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff868686),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffF7F7F7),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 14.0, bottom: 14),
                          child: Text(
                            'Dolo - 650, Paracetomol',
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff0C091F),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                      const SizedBox(
                        height: 10,
                      ),
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
            ),
          )
        ]),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppText.drugFollowUp,
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black1Color,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 2,
                      color: AppColors.blackColor,
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const ShowBottomSheet(
                              drugName: 'Dolo 600mg',
                              drugSubtitle: 'Paracetamol (600mg)',

                            );
                          },
                        );

                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:const Color(0xFFE8F5F3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 20,
                                decoration: BoxDecoration(
                                    color:const Color(0xFFE8F5F3),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: const Color(0xFF1227E3))),
                                child:  Center(
                                  child: Text(
                                    'Tab',
                                    style: GoogleFonts.urbanist(
                                      textStyle: const TextStyle(
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                'Dolo 600mg',
                                style: GoogleFonts.urbanist(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                              ),
                              const SizedBox(
                                width: 129,
                              ),
                              Container(
                                  height: 20,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      color: Color(0xffF8F7FC),
                                      shape: BoxShape.circle),
                                  child: const Center(
                                    child: Icon(
                                      Icons.close,
                                      size: 12,
                                      color: Color(0xff0B0B0B),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Visibility(
                    //   visible: _isAdditionalInfoVisible,
                    //   child: drugDetail(context),
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap:(){
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const ShowBottomSheet(
                              drugName: 'Moxikind CV 625mg',
                              drugSubtitle: 'Amoxycillin/Amoxicillin(500.0Mg)+\nClavulanicAcid(125.0Mg)',
                            );
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5F3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFE8F5F3),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: const Color(0xFF1227E3))),
                                child:  Center(
                                  child: Text(
                                    'Tab',
                                    style: GoogleFonts.urbanist(
                                      textStyle: const TextStyle(
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                'Moxikind CV 625mg',
                                style: GoogleFonts.urbanist(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                              ),
                              const SizedBox(
                                width: 65,
                              ),
                              Container(
                                  height: 20,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      color: Color(0xffF8F7FC),
                                      shape: BoxShape.circle),
                                  child: const Center(
                                    child: Icon(
                                      Icons.close,
                                      size: 12,
                                      color: Color(0xff0B0B0B),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // // Visibility(
                    // //   visible: isAdditionalInfoVisible,
                    // //   child: drugDetail(context),
                    // // ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap:(){
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const ShowBottomSheet(
                              drugName: 'Ambrodel 100ml',
                              drugSubtitle: 'Ambrowell & Guaipheniesin Combination',
                            );
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5F3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFE8F5F3),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: const Color(0xFF1227E3))),
                                child:  Center(
                                  child: Text(
                                    'Syp',
                                    style: GoogleFonts.urbanist(
                                      textStyle: const TextStyle(
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                'Ambrodel 100mg',
                                style: GoogleFonts.urbanist(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                              ),
                              const SizedBox(
                                width: 95,
                              ),
                              Container(
                                  height: 20,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      color: Color(0xffF8F7FC),
                                      shape: BoxShape.circle),
                                  child: const Center(
                                    child: Icon(
                                      Icons.close,
                                      size: 12,
                                      color: Color(0xff0B0B0B),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // // Visibility(
                    // //   visible: additionalInfoVisible,
                    // //   child: drugDetail(context),
                    // // ),
                    const SizedBox(
                      height: 7,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const DrugsPrescriptionScreen()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF32856E),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Center(
                          child: Text(
                            'Add more Drugs',
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppText.advice,
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black1Color,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 2,
                      color: AppColors.blackColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppText.diet,
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black1Color,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: balancedDietController,
                      onTap: updateBalancedDietField,
                      maxLines: 3,
                      textAlignVertical: TextAlignVertical.top,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF5F5F5),
                        border: InputBorder.none,
                        // label: Row(
                        //     children: [
                        //       // SizedBox(width: 8),
                        //       Padding(
                        //         padding: EdgeInsets.only(bottom: 60),
                        //         child: Text(
                        //           showBalancedDietHint ? 'e.g. Balanced diet.' : '',
                        //           style: GoogleFonts.roboto(
                        //             textStyle: TextStyle(
                        //                 fontSize: 14, fontWeight: FontWeight.w400),
                        //           ),
                        //           overflow: TextOverflow.ellipsis,
                        //
                        //         ),
                        //       ),
                        //     ]
                        // ),
                        // prefixIcon: SizedBox(width: 5),
                        labelText: showBalancedDietHint ? 'e.g. Balanced diet.' : '',
                        labelStyle: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 16.0),
                      ),
                    ),
                    // CustomTextField(
                    //   controller: balancedDietController,
                    //   hintText: AppText.balancedDiet,
                    //   height: 100,
                    // ),

                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppText.otherInstructions,
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black1Color,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: adequateWaterController,
                      onTap: updateAdequateWaterField,
                      textAlignVertical: TextAlignVertical.top,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF5F5F5),

                        border: InputBorder.none,
                        //   label: Row(
                        //     children: [
                        //       SizedBox(width: 8),
                        //       Padding(
                        //         padding: EdgeInsets.only(bottom: 60),
                        //         child: Text(
                        //           showAdequateWaterHint ? 'e.g. Balanced diet.' : '',
                        //   style: GoogleFonts.roboto(
                        //     textStyle: TextStyle(
                        //         fontSize: 16, fontWeight: FontWeight.w400),
                        //   ),
                        //           overflow: TextOverflow.ellipsis,
                        //
                        //         ),
                        //       ),
                        //   ]
                        // ),
                        // prefixIcon: SizedBox(width: 10),
                        labelText: showAdequateWaterHint ? 'e.g. Adequate water intake.' : '',
                        labelStyle: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 53.0, horizontal: 16.0),
                      ),
                    ),
                    // CustomTextField(
                    //   controller: adequateWaterController,
                    //   hintText: AppText.drinkWater,
                    //   height: 100,
                    // ),

                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'FOLLOW-UP',
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black1Color,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 2,
                      color: AppColors.blackColor,
                    ),
                    const SizedBox(height: 7,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              AppText.followUpDate,
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black1Color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),

                        ///****

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildTextSection(
                                'None', const Color(0xffF8F7FC), Colors.black),
                            _buildTextSection('After 3 days',
                                const Color(0xffF8F7FC), Colors.black),
                            _buildTextSection('After a week',
                                const Color(0xffF8F7FC), Colors.black),
                          ],
                        ),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildTextSection('After 2 days',
                                const Color(0xffF8F7FC), Colors.black),
                            const SizedBox(width: 9),
                            _buildTextSection('After a month',
                                const Color(0xffF8F7FC), Colors.black),
                            const SizedBox(width: 9),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // isCustomSelected = true;
                                  selectedDateText = 'Custom';
                                  showDateWidget = !showDateWidget;
                                });
                              },
                              child: _buildTextSection('Custom',
                                  const Color(0xffF8F7FC), Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        if (showDateWidget)
                          DateWidget(
                            selectedDate: selectedDate ?? DateTime.now(),
                            onSelectDate: () => _selectDate(context),


                          ),


                        // Column(
                        //   children: [
                        //     Row(
                        //       children: <Widget>[
                        //         GestureDetector(
                        //           onTap: () {
                        //             setState(() {
                        //               showDateWidget = !showDateWidget;
                        //             });
                        //           },
                        //           child: _buildTextSection('Custom',
                        //               const Color(0xffF8F7FC), Colors.black),
                        //         ),
                        //         const SizedBox(height: 20),
                        //       ],
                        //     ),
                        //     const SizedBox(height: 16),
                        //     if (showDateWidget)
                        //       DateWidget(
                        //         selectedDate: selectedDate ?? DateTime.now(),
                        //         onSelectDate: () => _selectDate(context),
                        //       ),
                        //   ],
                        // ),

//////////////////////////////////////////////

                        const SizedBox(height: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffF8F7FC),
                              ),
                              width: 70,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      'Time',
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: selectedDateText == 'Custom'
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 7),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF8F7FC),
                                    ),
                                    width: 100,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            'Morning',
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: selectedDateText == 'Custom'
                                                    ? Colors.black
                                                    : Colors.grey,
                                              ),
                                            ),
                                          ),

                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 9),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF8F7FC),
                                    ),
                                    width: 100,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            'Afternoon',
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: selectedDateText == 'Custom'
                                                    ? Colors.black
                                                    : Colors.grey,
                                              ),
                                            ),
                                          ),

                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 9),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF8F7FC),
                                    ),
                                    width: 100,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            'Evening',
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: selectedDateText == 'Custom'
                                                    ? Colors.black
                                                    : Colors.grey,
                                              ),
                                            ),
                                          ),

                                        ),
                                      ],
                                    ),
                                  ),]),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     _buildTextSection('Morning',  Colors.black, Colors.grey),
                            //     _buildTextSection('Afternoon',  Colors.black, Colors.grey),
                            //     _buildTextSection('Evening',  Colors.black, Colors.grey),
                            //   ],
                            // ),
                            const SizedBox(height: 7),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     _buildTextSection('After 3 days',
                            //         const Color(0xffF8F7FC), Colors.grey),
                            //     const SizedBox(width: 9),
                            //     _buildTextSection('After 2 weeks',
                            //         const Color(0xffF8F7FC), Colors.grey),
                            //   ],
                            // ),
                            // const SizedBox(height: 7),

///////////////////////////////////
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedTime = 'Custom';
                                      showTimeWidget = !showTimeWidget;
                                    });
                                  },
                                  child: _buildTimeSection('Custom', const Color(0xffF8F7FC), Colors.black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            if (showTimeWidget)
                              Column(
                                children: [
                                  // Row(
                                  //   children: <Widget>[
                                  //     textSection(
                                  //         'Custom', const Color(0xffF8F7FC), Colors.black),
                                  //     const SizedBox(height: 20),
                                  //   ],
                                  // ),
                                  // const SizedBox(height: 16),
                                  if (selectedTime == 'Custom')
                                    Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: const Color(0xffF8F7FC),
                                            borderRadius:
                                            BorderRadius.circular(4),
                                          ),
                                          width:
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.4,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              const Text(
                                                "5",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              GestureDetector(
                                                child: const Text(
                                                  "hrs",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        const SizedBox(width: 8),

                                        Container(
                                          height: 60,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: const Color(0xffF8F7FC),
                                            borderRadius:
                                            BorderRadius.circular(4),
                                          ),
                                          width:
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.4,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              const Text(
                                                "30",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              GestureDetector(
                                                child: const Text(
                                                  "min",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),

                    // const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text(
                      'Clear',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Drugs  have been saved successfully.'),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DigitalScreen()),
                    );
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xff32856E),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
        ]),
      ),
    );
  }

  // Widget drugDetail(BuildContext context) {
  //   return Column(
  //     children: [
  //       const SizedBox(height: 10),
  //       const Row(
  //         children: [
  //           Text(
  //             'Quantity',
  //             style: TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 5),
  //       CustomTextField(
  //         controller: quantityController,
  //         hintText: 'Quantity/Dosage',
  //         height: 45,
  //       ),
  //       const SizedBox(height: 9),
  //       const Row(
  //         children: [
  //           Text('Dosage Frequency',
  //               style: TextStyle(fontWeight: FontWeight.bold)),
  //         ],
  //       ),
  //       const SizedBox(height: 5),
  //       const Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           DrugCard(name: "SOS"),
  //           DrugCard(name: "Stat"),
  //           DrugCard(name: "1-1-0"),
  //           DrugCard(name: "1-0-1"),
  //           DrugCard(name: "1-1-1"),
  //         ],
  //       ),
  //       const Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           DrugCard(name: "0-0-1"),
  //           DrugCard(name: "0-1-0"),
  //           DrugCard(name: "1-0-0"),
  //           DrugCard(name: "0-1-1"),
  //           DrugCard(name: "other"),
  //         ],
  //       ),
  //       const SizedBox(height: 5),
  //       const Row(
  //         children: [
  //           Text('Dosage Time', style: TextStyle(fontWeight: FontWeight.bold)),
  //         ],
  //       ),
  //       const SizedBox(height: 5),
  //       const Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           DrugCard(name: "After meal"),
  //           DrugCard(name: "Before meal"),
  //           DrugCard(name: "Empty stomach"),
  //         ],
  //       ),
  //       const SizedBox(height: 5),
  //       const Row(
  //         children: [
  //           Text(
  //             'Duration',
  //             style: TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 5),
  //       CustomTextField(
  //         controller: durationController,
  //         hintText: 'e.g.for 5 days',
  //         height: 45,
  //       ),
  //       const SizedBox(height: 5),
  //       Row(
  //         children: [
  //           const Text('From', style: TextStyle(fontWeight: FontWeight.bold)),
  //           const SizedBox(width: 18),
  //           Container(
  //             width: 100,
  //             color: const Color(0xffF8F7FC),
  //             alignment: Alignment.center,
  //             child: TextFormField(
  //               textAlign: TextAlign.center,
  //               readOnly: true,
  //               controller: _dateController1,
  //               decoration: const InputDecoration(
  //                   hintText: '1-1-01',
  //                   border: UnderlineInputBorder(borderSide: BorderSide.none)),
  //               onTap: () async {
  //                 final DateTime? pickedDate = await showDatePicker(
  //                   context: context,
  //                   initialDate: DateTime.now(),
  //                   firstDate: DateTime(2015, 8),
  //                   lastDate: DateTime(2101),
  //                 );
  //                 if (pickedDate != null && pickedDate != selectedDate1) {
  //                   setState(() {
  //                     selectedDate1 = pickedDate;
  //                     _dateController1.text =
  //                     '${selectedDate1!.day}/${selectedDate1!
  //                         .month}/${selectedDate1!.year}';
  //                   });
  //                 }
  //               },
  //             ),
  //           ),
  //           const SizedBox(width: 20),
  //           const Text('To', style: TextStyle(fontWeight: FontWeight.bold)),
  //           const SizedBox(width: 18),
  //           Container(
  //             width: 100,
  //             color: const Color(0xffF8F7FC),
  //             alignment: Alignment.center,
  //             child: TextFormField(
  //               textAlign: TextAlign.center,
  //               readOnly: true,
  //               controller: _dateController2,
  //               decoration: const InputDecoration(
  //                   hintText: '1-1-01',
  //                   border: UnderlineInputBorder(borderSide: BorderSide.none)),
  //               onTap: () async {
  //                 final DateTime? pickedDate = await showDatePicker(
  //                   context: context,
  //                   initialDate: DateTime.now(),
  //                   firstDate: DateTime(2015, 8),
  //                   lastDate: DateTime(2101),
  //                 );
  //                 if (pickedDate != null && pickedDate != selectedDate2) {
  //                   setState(() {
  //                     selectedDate2 = pickedDate;
  //                     _dateController2.text =
  //                     '${selectedDate2!.day}/${selectedDate2!
  //                         .month}/${selectedDate2!.year}';
  //                   });
  //                 }
  //               },
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Widget _buildTextSection(String text, Color defaultBackgroundColor, Color defaultTextColor) {
    bool isSelected = selectedDateText == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (text == 'Custom') {
            selectedDateText = 'Custom';
            showDateWidget = !showDateWidget;
          } else {
            selectedDateText = text;
            selectedDate = null;
            showDateWidget = false;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff32856E) : defaultBackgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : defaultTextColor,
          ),
        ),
      ),
    );
  }


  Widget _buildTimeSection(String text, Color defaultBackgroundColor, Color defaultTextColor) {
    bool isSelected = selectedTime == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (text == 'Custom') {
            selectedTime = 'Custom';
            showTimeWidget = !showTimeWidget;
          } else {
            selectedTime = text;
            showTimeWidget = false;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff32856E) : defaultBackgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : defaultTextColor,
          ),
        ),
      ),
    );
  }
  Widget textSection(String text,
      Color defaultBackgroundColor,
      Color defaultTextColor,) {
    bool isAboveTimeSection = text == 'None' || text == 'Custom';
    bool isSelected = selectedTime == text;
    bool shouldTextBeBlack = selectedTime == 'Custom' && !isSelected;
    bool isCustomSelected = text == 'Custom' && DateWidget == 'Custom';

    return GestureDetector(
      onTap: () {
        if (text == 'Custom') {
          setState(() {
            showDateWidget = !showDateWidget;
          });
        } else if (text == DateWidget) {
          _selectDate(context);
        } else {
          setState(() {
            showDateWidget = false;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _getBackgroundColor(
              text, defaultBackgroundColor, isSelected, isCustomSelected,
              isAboveTimeSection),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Text(
              _getDisplayText(text, isSelected),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: _getTextColor(
                    defaultTextColor, isCustomSelected, shouldTextBeBlack,
                    isSelected),
              ),
            ),
            if (isCustomSelected) ...[],
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(String text, Color defaultBackgroundColor,
      bool isSelected, bool isCustomSelected, bool isAboveTimeSection) {
    if (isCustomSelected || isSelected) {
      return const Color(0xff32856E);
    } else if (isAboveTimeSection) {
      return defaultBackgroundColor;
    }
    return const Color(0xffF8F7FC);
  }

  String _getDisplayText(String text, bool isSelected) {
    if (isSelected && text == 'Custom') {
      return selectedTime;
    }
    return text;
  }

  Color _getTextColor(Color defaultTextColor, bool isCustomSelected,
      bool shouldTextBeBlack, bool isSelected) {
    if (isCustomSelected || isSelected) {
      return Colors.white;
    } else if (shouldTextBeBlack) {
      return Colors.black;
    } else if (isSelected) {
      return Colors.white;
    }
    return defaultTextColor;
  }
}

class DateWidget extends StatelessWidget {
  final DateTime? selectedDate;
  final VoidCallback onSelectDate;

  const DateWidget({
    Key? key,
    this.selectedDate,
    required this.onSelectDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xffF8F7FC),
        borderRadius: BorderRadius.circular(4),
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectableText(
            '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            onTap: onSelectDate,
          ),
          GestureDetector(
            onTap: onSelectDate,
            child: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheet extends StatefulWidget {
  final String drugName;
  final String drugSubtitle;

  const BottomSheet({
    Key? key,
    required this.drugName,
    required this.drugSubtitle,
  }) : super(key: key);

  @override
  State<ShowBottomSheet> createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  TextEditingController quantityController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  DateTime? selectedDate1;
  DateTime? selectedDate2;
  String? selectedOption;
  bool isQuantityFilled = false;

  @override
  void initState() {
    super.initState();
    quantityController.addListener(() {
      setState(() {
        isQuantityFilled = quantityController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    quantityController.dispose();
    durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.130 +
            MediaQuery.of(context).viewInsets.bottom -
            20,
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.130 +
                    MediaQuery.of(context).viewInsets.bottom -
                    20,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 14.10,
                      offset: Offset(3, 3),
                      spreadRadius: 8,
                    )
                  ],
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 8.0, right: 8),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.white1Color,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            widget.drugName,
                                            style: GoogleFonts.urbanist(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17,
                                                  color: Color(0xFF202741)),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                    height: 20,
                                                    width: 25,
                                                    decoration:
                                                    const BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape
                                                            .circle),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.edit,
                                                        size: 14,
                                                        color:
                                                        Color(0xff0B0B0B),
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Contents: ',
                                            style: GoogleFonts.urbanist(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                  color: Color(0xff0C091F)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              widget.drugSubtitle,
                                              style: GoogleFonts.urbanist(
                                                textStyle: const TextStyle(
                                                    color: AppColors.blueColor,
                                                    fontSize: 13,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 14),
                                      if (widget.drugName == 'Ambrowell 100ml')
                                        Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffF8F7FC),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFF1227E3))),
                                              child: const Center(
                                                child: Text(
                                                  'Syp',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (widget.drugName == 'Meronem')
                                        Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffF8F7FC),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFF1227E3))),
                                              child: const Center(
                                                child: Text(
                                                  'Inj',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (widget.drugName != 'Ambrowell 100ml' &&
                                          widget.drugName != 'Meronem')
                                        Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffF8F7FC),
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFF1227E3))),
                                              child: const Center(
                                                child: Text(
                                                  'Tab',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Row(
                              children: [
                                Text(
                                  AppText.quantity,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 8.0, right: 8),
                              child: CustomTextField(
                                controller: quantityController,
                                hintText: 'Quantity/Dosage',
                                height: 45,
                              ),
                            ),
                            const SizedBox(height: 9),
                            const Row(
                              children: [
                                Text('Dosage Frequency',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const DrugCard(name: "SOS"),
                                const DrugCard(name: "Stat"),
                                const DrugCard(
                                  name: "1-1-1",
                                ),
                                DrugCard(
                                    name: "1-0-1",
                                    isSelected: isQuantityFilled),
                                const DrugCard(name: "1-0-0"),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DrugCard(name: "1-1-1"),
                                DrugCard(name: "0-0-1"),
                                DrugCard(name: "0-1-0"),
                                DrugCard(name: "1-0-0"),
                                DrugCard(name: "0-1-1"),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 14.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DrugCard(name: "Other"),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              children: [
                                Text('Dosage Time',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DrugCard(
                                    name: "After Meal",
                                    isSelected: isQuantityFilled),
                                const DrugCard(name: "Before Meal"),
                                const DrugCard(name: "Empty Stomach"),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              children: [
                                Text(
                                  'Duration',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            GestureDetector(
                              onTap: () {
                                showBottomSheet(context);
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                            color: AppColors.white1Color,
                                            borderRadius:
                                            BorderRadius.circular(4),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12.0),
                                                  child: CustomTextField(
                                                    controller:
                                                    durationController,
                                                    hintText: 'e.g. for 5 days',
                                                    height: 45,
                                                  ),
                                                ),
                                              ),
                                              const IconButton(
                                                icon:
                                                Icon(Icons.keyboard_arrow_down_outlined),
                                                onPressed: null,
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (durationController.text.isNotEmpty)
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 12.0, top: 8.0),
                                            child: Text(
                                              'e.g. from 01-03-24 to 05-03-24',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 165,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.greenColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Center(
                                  child: Text(
                                    AppText.save,
                                    style:
                                    TextStyle(color: AppColors.whiteColor),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                quantityController.clear();
                                durationController.clear();
                              },
                              child: Container(
                                width: 165,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.white1Color,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Clear All',
                                    style:
                                    TextStyle(color: AppColors.blackColor),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height / 1.9,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        buildOptionContainer('Custom', setState, context),
                        buildOptionContainer('For 3 days', setState, context),
                        buildOptionContainer('For 5 days', setState, context),
                        buildOptionContainer('For a week', setState, context),
                        buildOptionContainer('For 2 weeks', setState, context),
                        buildOptionContainer('For a month', setState, context),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    if (selectedOption != null) {
      if (selectedOption == 'Custom') {
        durationController.text = selectedOption!;
        await showCustomDatePickerBottomSheet(context);
      } else {
        setState(() {
          durationController.text = selectedOption!;
        });
      }
    }
  }

  Widget buildOptionContainer(
      String option, StateSetter setState, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option; // Update selectedOption on tap
          Navigator.pop(context); // Close the bottom sheet
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xffF7F7F7),
          borderRadius: BorderRadius.circular(5),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.3),
          //     spreadRadius: 1,
          //     blurRadius: 5,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Text(
          option,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Future<void> showCustomDatePickerBottomSheet(BuildContext context) async {
    DateTime? startDate;
    DateTime? endDate;
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.2,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text('Select the start and end date for medication',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppColors.greenColor)),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Column(
                        children: [
                          CalendarDatePicker(
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                            onDateChanged: (DateTime date) {
                              setState(() {
                                startDate = date;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(height: 20),
                          CalendarDatePicker(
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                            onDateChanged: (DateTime date) {
                              setState(() {
                                endDate = date;
                                if (startDate != null && endDate != null) {
                                  durationController.text =
                                  '${startDate!.day}-${startDate!.month}-${startDate!.year} to ${endDate!.day}-${endDate!.month}-${endDate!.year}';
                                  Navigator.pop(context);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}