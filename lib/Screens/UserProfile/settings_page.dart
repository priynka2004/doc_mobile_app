import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/cancel_appoinments.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/reschedule_appoinment.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/schedule_follow_up.dart';
import 'package:healtether_clinic_app/Screens/UserProfile/clinic_details_page.dart';
import 'package:healtether_clinic_app/Screens/UserProfile/clinic_settings.dart';
import 'package:healtether_clinic_app/Screens/UserProfile/notifications_settings.dart';
import 'package:healtether_clinic_app/Screens/UserProfile/payment_settings.dart';
import 'package:healtether_clinic_app/Screens/UserProfile/permissions_settings.dart';
import 'package:healtether_clinic_app/Screens/patients_records/model/patient_model.dart';
import 'package:healtether_clinic_app/Screens/patients_records/patient_record_screen.dart';
import 'package:healtether_clinic_app/constant/constant.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late PatientModel patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            Text(
              'Settings',
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize:20),
            ),
          ],
        ),
        actions: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blackColor),
              borderRadius: BorderRadius.circular(6),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close_rounded,
              ),
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'option_1') {
                // Handle option 1
              } else if (value == 'option_2') {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const ScheduleFollowUp(),
                );
              } else if (value == 'option_3') {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const RescheduleAppointment(),
                );
              } else if (value == 'option_4') {
                showDialog(
                    context: context,
                    builder: (BuildContext) {
                      return const CancelAppointment();
                    });
              } else if (value == 'option_5') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientRecordsScreen(
                            patient: patient,
                          )),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'option_1',
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff5DDCB8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: const Row(
                    children: [
                      Text(
                        'Menu',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Spacer(),
                      Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'option_2',
                child: ListTile(
                  title: Text(
                    'Schedule Follow-up',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'option_3',
                child: ListTile(
                  title: Text(
                    'Reschedule Appointment',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'option_4',
                child: ListTile(
                  title: Text(
                    'Cancel Appointment',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'option_5',
                child: ListTile(
                  title: Text(
                    'View Patient Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 170,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 25),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40.0),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/homeimages/Ellipse 760.png'),
                        radius: 45,
                      ),
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 110,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(247, 247, 222, 4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Center(
                              child: Text(
                                'Super Admin',
                                style: GoogleFonts.montserrat(
                                  fontWeight :FontWeight.w500,
                                fontSize: 14,
                                  color:Color(0xff110C2C)
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),),
                          ),

                        const SizedBox(
                          height: 11,
                        ),
                        Text(
                          'Dr. Kim Jones',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 34,
                              width: 58,
                              decoration: BoxDecoration(
                                color: const Color(0xff32856E),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  'Save',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 34,
                              width: 68,
                              decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 320,
              child: Divider(
                thickness: 2,
                color: Color(0xffEEEEEE),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ClinicSettings();
                }));
              },
              child: Container(
                height: 60,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0xffEEEEEE),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 10),
                  child: Text(
                    'Clinic details',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 16,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ClinicDetails();
                }));
              },
              child: Container(
                height: 60,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0xffEEEEEE),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 10),
                  child: Text(
                    'Clinic settings',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const PaymentSettings();
                }));
              },
              child: Container(
                height: 60,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0xffEEEEEE),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 10),
                  child: Text(
                    'Payments settings',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 16,
                      color: const Color(0xff000000),

                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const NotificationSettings();
                }));
              },
              child: Container(
                height: 60,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0xffEEEEEE),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 10),
                  child: Text(
                    'Notifications settings',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 16,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const PermissionsSettings();
                }));
              },
              child: Container(
                height: 60,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0xffEEEEEE),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 10),
                  child: Text(
                    'App Permissions',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 16,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.copyright_rounded,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Copyright 2024 HealTether. All Rights Reserved.',
                        style: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
