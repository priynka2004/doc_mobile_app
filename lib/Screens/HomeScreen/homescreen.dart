import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/appoinment_detail_screen.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/appointment_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/vitals_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/symptoms%20_diagnosis/create_digital_prescription_screens.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/symptoms_tests_screen.dart';
import 'package:healtether_clinic_app/Screens/HomeScreen/drawer_menu.dart';
import 'package:healtether_clinic_app/Screens/HomeScreen/page_view_screen.dart';
import 'package:healtether_clinic_app/Screens/HomeScreen/patient_analysis.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/manage_staff_screen.dart';
import 'package:healtether_clinic_app/Screens/ScheduleAppointment/add_personl_detail_screen.dart';
import 'package:healtether_clinic_app/Screens/patients_records/patients_records.dart';
import 'package:healtether_clinic_app/Screens/payment_records/payment_records.dart';
import 'package:healtether_clinic_app/Screens/payment_records/payments_receipt_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedDate = '10:00-10:30';

  final List<String> firstText = ["Patient", "Manage", "Payment", "Data"];
  final List<String> secondText = ["Records", "Staff", "Records", "insights"];
  final List<Widget> navigations = [
    const PatientRecords(),
    const ManageStaffScreen(),
    const PaymentsRecordScreen(),
    const PatientAnalysis(),
  ];
  final List<String> images = [
    'assets/homeimages/Vector (1).svg',
    'assets/homeimages/Component 2.svg',
    'assets/homeimages/Component 3.svg',
    'assets/homeimages/trending-up.svg',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
            const GreenLine(),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Drawer(
                          child: DrawerMenu(),
                        ),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      children: [
                  const CircleAvatar(
                  backgroundImage: AssetImage(
                  'assets/homeimages/Ellipse 760 (2).png'),
                  radius: 35,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PatientRecords(),
                          ));
                    },
                    child: Container(
                      height: 50,
                      color: const Color(0xffF5F5F5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10),
                        child: Row(
                            children: [
                              const Icon(Icons.search),
                              const SizedBox(width: 6),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search for patients',
                                    hintStyle: GoogleFonts.montserrat(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    border: InputBorder.none,
                                  ),),
                                        // Padding(
                                        //   padding: const EdgeInsets.all(8.0),
                                        //   child: FittedBox(
                                        //     fit: BoxFit.scaleDown,
                                        //     child: Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.start,
                                        //       children: [
                                        //         Text(
                                        //           'Saturday,1 July',
                                        //           style: GoogleFonts.montserrat(
                                        //               fontSize: 16,
                                        //               color: Colors.black87,
                                        //               fontWeight: FontWeight.w500),
                                        //         ),
                                        //         // Text(
                                        //         //   '1 July, 2023',
                                        //         //   style: GoogleFonts.montserrat(
                                        //         //       fontSize: 14,
                                        //         //       color: Colors.black87,
                                        //         //       fontWeight: FontWeight.w500),
                                        //         // ),
                                        //       ],
                                        //
                                        //     ),
                                        //   ),
                                        // ),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                            ),

                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff03BF9C),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 29,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'May 24',
                              style: GoogleFonts.urbanist(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: CircularPercentIndicator(
                          radius: 50.0,
                          animation: true,
                          animationDuration: 1200,
                          lineWidth: 10.0,
                          percent: 0.6,
                          center: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "40%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              ),
                              Text(
                                'done',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              )
                            ],
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          progressColor: const Color(0xffE4E0F3),
                          backgroundColor: const Color(0xff03BF9C),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '4/10 patients helped',
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: const Color(0xff0C091F),
                              ),
                            ),
                            const SizedBox(height: 9),
                            const SmallContainer(
                              color: Color(0xff03BF9C),
                              text: 'Completed',
                            ),
                            const SizedBox(height: 9),
                            const SmallContainer(
                                color: Color(0xffE4E0F3), text: 'Remaining'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DateCards(
                              width: 90,
                              isSelected: selectedDate == '10:00-10:30',
                              onTap: () {
                                setState(() {
                                  selectedDate = '10:00-10:30';
                                });
                              },
                              text: '10:00-10:30',
                              textColor: selectedDate == '10:00-10:30'
                                  ? Colors.black
                                  : const Color(0xff9E9E9E),
                            ),
                            DateCards(
                              width: 90,
                              isSelected: selectedDate == '11:00-11:30',
                              onTap: () {
                                setState(() {
                                  selectedDate = '11:00-11:30';
                                });
                              },
                              text: '11:00-11:30',
                              textColor: selectedDate == '11:00-11:30'
                                  ? Colors.black
                                  : const Color(0xff9E9E9E),
                            ),
                            DateCards(
                              width: 90,
                              isSelected: selectedDate == '12:00-12:30',
                              onTap: () {
                                setState(() {
                                  selectedDate = '12:00-12:30';
                                });
                              },
                              text: '12:00-12:30',
                              textColor: selectedDate == '12:00-12:30'
                                  ? Colors.black
                                  : const Color(0xff9E9E9E),
                            ),
                            DateCards(
                              width: 90,
                              isSelected: selectedDate == '12:30-1:00',
                              onTap: () {
                                setState(() {
                                  selectedDate = '12:30-1:00';
                                });
                              },
                              text: '12:30-1:00',
                              textColor: selectedDate == '12:30-1:00'
                                  ? Colors.black
                                  : const Color(0xff9E9E9E),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Upcoming Appointments',
                            style: GoogleFonts.urbanist(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomePageView(selectedIndex: 1),
                                    ),
                                  ).then((_) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AppointmentScreen(),
                                      ),
                                    );
                                  });
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AppointmentScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'See All',
                                    style: TextStyle(
                                      color: Color(0xff32856E),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                width: screenWidth * 0.14,
                                decoration: const BoxDecoration(
                                  color: Color(0xff32856E),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 150.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            child: GestureDetector(
                              child: const AppointmentCard(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tools',
                        style: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: firstText.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisExtent: 80),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => navigations[index],
                            ),
                          ),
                          child: Center(
                            child: MyCard(
                              text1: firstText[index],
                              text2: secondText[index],
                              image: images[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: const Drawer(
          child: DrawerMenu(),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: const Color(0xff32856E),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AddPersonalDetailsScreen();
              // AddAppointScreen();
            }));
          },
          child: Icon(
            MdiIcons.accountMultiplePlus,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class SmallContainer extends StatelessWidget {
  final Color color;
  final String text;

  const SmallContainer({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(3)),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xff0C091F)),
          ),
        ),
      ],
    );
  }
}

class MyCard extends StatelessWidget {
  final String text1;
  final String text2;
  final String image;

  const MyCard({
    super.key,
    required this.text1,
    required this.text2,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          color: Color(0xff0C091F),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Text(
                      text2,
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xff0C091F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                image,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateCards extends StatelessWidget {
  final double width;
  final bool isSelected;
  final VoidCallback onTap;
  final String text;
  final Color textColor;

  const DateCards({
    super.key,
    required this.width,
    required this.isSelected,
    required this.onTap,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isSelected ? const Color(0xff03BF9C) : const Color(0xffFFFFFF),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          width: width,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(6),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(8),
                ),
                color: Color(0xff8BDFC7)),
            width: MediaQuery.of(context).size.width - 32,
            // height: 50,
            child: Row(
              children: [
                Column(children: [
                  Text(
                    'Luna joseph',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Urbanist',
                          fontSize: 17),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '35 years,Female',
                        style: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ]),
                const Spacer(),
                const Text(
                  '11:30AM-12:00PM',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SymptomsTestsScreen()));
                  },
                  child: getOptionWidget(
                    imgPath: 'assets/homeimages/Component 15.svg',
                    title: 'Past Medical\n History',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VitalsScreen()));
                  },
                  child: getOptionWidget(
                    imgPath: 'assets/homeimages/Vector (15).svg',
                    title: 'Vitals & \nExamination',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CreateDigitalPrescriptionScreens()));
                  },
                  child: getOptionWidget(
                    imgPath: 'assets/homeimages/Vector (16).svg',
                    title: 'Write\nprescription',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PaymentsReceiptScreen()));
                  },
                  child: getOptionWidget(
                    imgPath: 'assets/homeimages/Vector (17).svg',
                    title: 'Make\nreceipt',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget getOptionWidget({
    required String title,
    String? imgPath,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xffEFE9E9),
          ),
          child: imgPath != null
              ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(height: 20,width: 20,
                            imgPath,
                            color: const Color(0xff413D56),
                          ),
              )
              : Icon(
            icon,
            color: const Color(0xff281B6F),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.urbanist(
            textStyle: const TextStyle(fontSize: 12),
            fontWeight: FontWeight.w500,
            color: const Color(0xff0C091F),
          ),
        ),
      ],
    );
  }

}
