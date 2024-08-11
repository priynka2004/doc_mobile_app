import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/appointment_info_screen.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/model/appointment_request_model.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/provider/appointment_provider.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/vitals_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/digital_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/symptoms_tests_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  InfoCardState createState() => InfoCardState();
}

class InfoCardState extends State<InfoCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AppointmentProvider>(context, listen: false)
          .fetchAppointments();
    });
  }

  String formatDate(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString);
      return DateFormat('d MMM yy').format(dateTime);
    } catch (e) {
      return 'Invalid date';
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Consumer<AppointmentProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.appointments.isEmpty) {
          return const Center(child: Text('No appointments found.'));
        }

        return SizedBox(
          height: 400,
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: provider.appointments.length,
            itemBuilder: (BuildContext context, int index) {
              AppointmentResponse appointment = provider.appointments[index];

              return Slidable(
                key: const ValueKey(0),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  extentRatio: 0.9,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 6),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const DigitalScreen();
                            }));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF5F5F5),
                                ),
                                child: Center(
                                    child: SvgPicture.asset(
                                  'assets/homeimages/Vector (16).svg',
                                  color: const Color(0xff413D56),
                                )),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Write',
                                style: TextStyle(fontSize: 11),
                              ),
                              const Text(
                                'Prescription',
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 6),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SymptomsTestsScreen()));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF5F5F5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(
                                    'assets/homeimages/Component 15.svg',
                                    height: 22,
                                    width: 22,
                                    color: const Color(0xff413D56),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Past Medical',
                                style: TextStyle(fontSize: 11),
                              ),
                              const Text(
                                'History',
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 6),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const VitalsScreen()));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF5F5F5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(
                                    'assets/homeimages/Vector (15).svg',
                                    height: 20,
                                    width: 20,
                                    color: const Color(0xff413D56),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Vitals &',
                                style: TextStyle(fontSize: 11),
                              ),
                              const Text(
                                'Examination',
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 6),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentInfoScreen(
                                  appointmentResponse: appointment,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF5F5F5),
                                ),
                                child: const Icon(
                                  Icons.manage_history,
                                  color: Color(0xff413D56),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Manage',
                                style: TextStyle(fontSize: 11),
                              ),
                              const Text(
                                'Appt',
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '103568',
                                    style: GoogleFonts.urbanist(
                                      textStyle: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    appointment.name ?? 'N/A',
                                    style: GoogleFonts.urbanist(
                                      textStyle: const TextStyle(
                                        color: Color(0xff0F0B28),
                                        fontFamily: 'Poppins',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '35 years, Female',
                                    style: GoogleFonts.urbanist(
                                      textStyle: const TextStyle(
                                        color: Color(0xff0C091F),
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.phone,
                                        size: 16,
                                      ),
                                      Text(
                                        ' +91 ${appointment.mobile ?? 'N/A'}',
                                        style: GoogleFonts.urbanist(
                                          textStyle: const TextStyle(
                                            color: Color(0xffAEAEAE),
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            // color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_alarm,
                                        size: 18,
                                        color: Color(0xff413D56),
                                      ),
                                      SizedBox(
                                        width: width * 0.34,
                                        child: Text(
                                          '  ${appointment.timeSlot ?? 'N/A'}',
                                          style: GoogleFonts.urbanist(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff413D56),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.02),
                                  Row(
                                    children: [
                                      const SizedBox(width: 2),
                                      Image.asset(
                                        'assets/homeimages/stethscope.png',
                                        height: 18,
                                        width: 18,
                                        color: const Color(0xff413D56),
                                      ),
                                      SizedBox(
                                        width: width * 0.35,
                                        child: Text(
                                          '  Dr.${appointment.doctorName ?? 'N/A'}',
                                          style: GoogleFonts.urbanist(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff413D56),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
