import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/ChatScreen/chat_detailes_screen.dart';
import 'package:healtether_clinic_app/Screens/HomeScreen/homescreen.dart';

class ScheduleSuccessfullyScreen extends StatefulWidget {
  const ScheduleSuccessfullyScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleSuccessfullyScreen> createState() => _ScheduleSuccessfullyScreenState();
}

class _ScheduleSuccessfullyScreenState extends State<ScheduleSuccessfullyScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: Icon(
        //   Icons.arrow_back,
        //   size: 20,
        //   color: const Color(0xFF5351C7),
        // ),
        title: Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 20,
                color: Color(0xFF5351C7),
              ),
            ),
            const SizedBox(width: 10,),
            Text(
              'Back to home',
              style: GoogleFonts.urbanist(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF5351C7),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: isLargeScreen ? 32 : 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 80),
                Image.asset(
                  'assets/homeimages/charm_circle-tick.png',
                  height: isLargeScreen ? 80 : 60,
                ),
                Container(
                  margin: EdgeInsets.zero,
                  width: isLargeScreen ? 400 : 250,
                  // color: Colors.red,
                  height: 46,
                  child: Center(
                    child: Text(
                      'The appointment has been scheduled successfully.',
                      style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: isLargeScreen ? 18 : 16,
                          height: 1.25,
                        letterSpacing: 0.16,
                          color: const Color(0xFF0C091F),
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // const SizedBox(height: 16),
                // Image.asset(
                //   'assets/homeimages/Frame 2609237.png',
                //   height: isLargeScreen ? 180 : 120,
                // ),
                const SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLargeScreen ? 32.0 : 16.0,
                    vertical: 16.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "APPOINTMENT DETAILS",
                            style: GoogleFonts.urbanist(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: isLargeScreen ? 18.0 : 14.0,
                                height: 1.2,
                              letterSpacing: 1,
                                color: const Color(0xFF0C091F),
                              ),
                          ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                "Patient name:  ",
                                style: GoogleFonts.urbanist(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  fontSize: isLargeScreen ? 14.0 : 14,
                                  height: 1.2,
                                  color: const Color(0xFF266A57),
                                ),
                              ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "Jane Doe",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  fontSize: isLargeScreen ? 14.0 : 14,
                                  height: 1.2,
                                  letterSpacing: 1,
                                    color: const Color(0xFF0C091F),
                                  ),
                              ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "Patient ID:         ",
                                style: GoogleFonts.urbanist(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  fontSize: isLargeScreen ? 14.0 : 14,
                                  height: 1.2,
                                  color: const Color(0xFF266A57),
                                ),
                              ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "103455",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: isLargeScreen ? 14.0 : 14,
                                  height: 1.2,
                                  letterSpacing: 1,
                                    color: const Color(0xFF0C091F),
                                  ),
                              ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "Attending Doctor: ",
                                style: GoogleFonts.urbanist(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: isLargeScreen ? 14.0 : 14,
                                    height: 1.2,
                                    color: const Color(0xFF266A57),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "Dr. Kim Jones",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: isLargeScreen ? 14.0 : 14,
                                    height: 1.2,
                                    letterSpacing: 1,
                                    color: const Color(0xFF0C091F),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "Mode : ",
                                style: GoogleFonts.urbanist(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: isLargeScreen ? 14.0 : 14,
                                    height: 1.2,
                                    color: const Color(0xFF266A57),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "Physical",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: const Color(0xFF0C091F),
                                    fontWeight: FontWeight.w500,
                                    fontSize: isLargeScreen ? 14.0 : 14,
                                    height: 1.2,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "Date:  ",
                                style: GoogleFonts.urbanist(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  fontSize: isLargeScreen ? 14.0 : 14,
                                  height: 1.2,
                                  color: const Color(0xFF266A57),
                                ),
                              ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "24 July,2024",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: const Color(0xFF0C091F),
                                    fontWeight: FontWeight.w500,
                                    fontSize: isLargeScreen ? 14.0 : 14,
                                  height: 1.2,
                                  letterSpacing: 1,
                                  ),
                              ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "Time  ",
                                style: GoogleFonts.urbanist(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  fontSize: isLargeScreen ? 14.0 : 14,
                                  height: 1.2,
                                  color: const Color(0xFF266A57),
                                ),
                              ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "9:15 - 9:30",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: const Color(0xFF0C091F),
                                    fontWeight: FontWeight.w500,
                                    fontSize: isLargeScreen ? 14.0 : 14,
                                  height: 1.2,
                                  letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Text(
                            'Appointment Booked on 1 July, 2023',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: isLargeScreen ? 14.0 : 11,
                                height: 1.39,
                              letterSpacing: 0.06,
                                color: const Color(0xFF868686),
                              ),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return  const ChatDetailScreen();
                        }));
                      },
                      child: Container(
                        width: 280,
                        height: 60,
                        padding: const EdgeInsets.fromLTRB(19, 16, 19, 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF32856E),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                               Text(
                                'Send on',
                                textAlign: TextAlign.center,
                            style: GoogleFonts.urbanist(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  height: 21.6 / 16,
                                  // fontFamily: 'Montserrat',
                                ),
                              ),
                              ),
                              const SizedBox(width: 5),
                              Image.asset(
                                'assets/homeimages/whatsapp12.png',
                                color: Colors.white,
                                height: 16,
                                width: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const HomeScreen();
                      }));},
                      child: Container(
                        width: 280,
                        height: 60,
                        padding: const EdgeInsets.fromLTRB(19, 16, 19, 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F7FC),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Schedule another Appointment ',
                              // textAlign: TextAlign.center,
                              style: GoogleFonts.urbanist(
                                textStyle: const TextStyle(
                                  color: Color(0xFF0C091F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  // height: 21.6 / 16,
                                  // fontFamily: 'Montserrat',
                                ),
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
          ],
        ),
      ),
    );
  }
}
