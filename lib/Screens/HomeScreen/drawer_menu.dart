import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/HomeScreen/feedback_page.dart';
import 'package:healtether_clinic_app/Screens/HomeScreen/patient_analysis.dart';
import 'package:healtether_clinic_app/Screens/UserProfile/settings_page.dart';
import 'package:healtether_clinic_app/constant/constant.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 320,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff9DCBBE),
                        Color(0xffC1E7DC),
                        Color(0xff9DCBBE),
                      ],
                      stops: [0.2, 0.8, 1],
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 25),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/homeimages/Ellipse 760 (2).png',),
                                radius: 45,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(top: 96, left: 96),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFDBDBDB),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 35,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child:
                                    Text(
                                      'Admin',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                'Dr. Kim Jones',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'ENT Spealist',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          backgroundImage: AssetImage(
                                            'assets/homeimages/Group 36536.png',),

                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Jones Clinic',
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  showSwitchClinicsBottomSheet(context);
                                },
                                child: const Text(
                                  'Switch Clinic',
                                  style: TextStyle(
                                    color: Color(0xFF0C091F),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Urbanist',
                                    height: 1.35,
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.5,
                                width: 75,
                                color: const Color(0xFF281B6F),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 280,left:16,right: 16),
                  child: Container(
                    width: 358,
                    height: 135.02,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const PatientAnalysis()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF32856E), shape: BoxShape.circle),
                                  child:SvgPicture.asset(
                                    'assets/homeimages/Group 36542 (1).svg',
                                  ),
                                ),
                                const SizedBox(width: 8), // Adjust as needed
                                const Text(
                                  'Analytics',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF110C2C),
                                    height: 18.9 / 14,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Color(0xFFCFC8C8),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            height: 1,
                            color: const Color(0xFFCFC8C8),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF32856E), shape: BoxShape.circle),
                                child: const Icon(Icons.north, color: Colors.white),
                              ),
                              const SizedBox(width: 8), // Adjust as needed
                              const Text(
                                'Upgrade',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF110C2C),
                                  height: 18.9 / 14,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Color(0xFFCFC8C8),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black,size: 24,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SettingsPage()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: Color(0xFF32856E),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                'assets/homeimages/Group 36542 (1).svg',
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Settings',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF110C2C),
                                height: 18.9 / 14,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Color(0xFFCFC8C8),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        height: 1,
                        color: const Color(0xFFCFC8C8),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: const Color(0xFF32856E),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF32856E),
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/homeimages/Group 36546.svg',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Help',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF110C2C),
                                height: 18.9 / 14,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Color(0xFFCFC8C8),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        height: 1,
                        color: const Color(0xFFCFC8C8),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FeedBackPage()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: const Color(0xFF32856E),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF32856E),
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/homeimages/Vector (14).svg',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Feedback',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF110C2C),
                                height: 18.9 / 14,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Color(0xFFCFC8C8),
                            )
                          ],
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => const FeedBackPage()),
                      //     );
                      //   },
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         width: 35,
                      //         height: 35,
                      //         decoration: BoxDecoration(
                      //           color: const Color(0xFF32856E),
                      //           shape: BoxShape.circle,
                      //           border: Border.all(
                      //             color: const Color(0xFF32856E),
                      //             width: 2,
                      //           ),
                      //         ),
                      //         child: Container(
                      //           width: 30,
                      //           height: 30,
                      //           decoration: const BoxDecoration(
                      //             color: Color(0xFF32856E),
                      //             shape: BoxShape.circle,
                      //           ), child: SvgPicture.asset(
                      //                                   'assets/homeimages/Vector (14).svg',
                      //                                 ),
                      //         ),
                      //       ),
                      //       const SizedBox(width: 8), // Adjust as needed
                      //       const Text(
                      //         'Feedback',
                      //         style: TextStyle(
                      //           fontFamily: 'Montserrat',
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.w500,
                      //           color: Color(0xFF110C2C),
                      //           height: 18.9 / 14,
                      //         ),
                      //       ),
                      //       const Spacer(),
                      //       const Icon(
                      //         Icons.arrow_forward_ios,
                      //         size: 20,
                      //         color: Color(0xFFCFC8C8),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(height: 6),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        height: 1,
                        color: const Color(0xFFCFC8C8),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          return logoutDialog(context);
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: Color(0xFF32856E),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                'assets/homeimages/Group 36544.svg',
                              ),
                            ),
                            const SizedBox(width: 8), // Adjust as needed
                            const Text(
                              'Logout',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF110C2C),
                                height: 18.9 / 14,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Color(0xFFCFC8C8),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.5,
                      letterSpacing: 0.02,
                      color: Color(0xFF757575),
                    ),
                  ),
                  Spacer(), // Adjust as needed
                  Text(
                    'Terms and conditions',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.5,
                      letterSpacing: 0.02,
                      color: Color(0xFF757575),
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

  void showSwitchClinicsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          width: 375,
          height: 295,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SELECT CLINIC',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                height: 2,
                width: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF52CFAC)),
              ),
              const SizedBox(
                height: 9,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.white1Color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                backgroundImage:
                                AssetImage('assets/homeimages/image 6 (3).png'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Kim Jones Clinic',
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.white1Color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 20,
                                backgroundImage: AssetImage(
                                    'assets/homeimages/image 6.png'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'ABC Clinic',
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.white1Color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 20,
                                backgroundImage: AssetImage(
                                    'assets/homeimages/image 6 (2).png'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Jones Clinic',
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
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
        );
      },
    );
  }

  void logoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Do you want to Logout ?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff32856E)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(110, 50)),
              ),
              child: const Text(
                'No',
                style: TextStyle(color: Colors.white),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFF0F8F7FC),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(110, 50)),
              ),
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }


}