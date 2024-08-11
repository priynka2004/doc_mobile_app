import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/ScheduledAppoint/AppointmentDetails/appoint_details.dart';
import 'package:healtether_clinic_app/Screens/api/appointment_api.dart';
import 'package:intl/intl.dart';

class AppointInfoCard extends StatelessWidget {
  final Appointment appointment;
  final int slotNumber;

  const AppointInfoCard({
    Key? key,
    required this.appointment,
    required this.slotNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppointmentDetails(
              appointment: appointment,
              slotNumber: slotNumber,
            ),
          ),
        );
      },
      child: Container(
        width: screenSize.width * 0.9,
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        appointment.name,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      alignment: Alignment.centerRight,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'SLOT - $slotNumber',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xff4646B5),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        appointment.doctorName,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      alignment: Alignment.centerRight,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '${appointment.timeSlot}', // Display timeSlot
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Last visited: ${DateFormat('d/M/yy').format(DateTime.now())}',
                        style: GoogleFonts.montserrat(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: appointment.virtualConsultation,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 5,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Virtual',
                              style: GoogleFonts.montserrat(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    DateFormat('d MMM, yyyy').format(appointment.scheduleDate),
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}









// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:healtether_clinic_app/Screens/Provider/appointmentdata.dart';
// import 'package:healtether_clinic_app/Screens/ScheduledAppoint/AppointmentDetails/appoint_details.dart';
// import 'package:healtether_clinic_app/Screens/api/appointment_api.dart';
// import 'package:intl/intl.dart';

// class AppointInfoCard extends StatelessWidget {
//   final Appointment appointment;
//   final int slotNumber;

//   const AppointInfoCard({
//     Key? key,
//     required this.appointment,
//     required this.slotNumber,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;

//     return GestureDetector(
//       onTap: () {
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => AppointmentDetails(
//         //       appointmentId:
//         //           appointment.id, // Pass appointment ID to AppointmentDetails
//         //       slotNumber: slotNumber,
//         //     ),
//         //   ),
//         // );
//       },
//       child: Container(
//         width: screenSize.width * 0.9,
//         decoration: BoxDecoration(
//           color: Color(0xffF5F5F5),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: FittedBox(
//                       alignment: Alignment.centerLeft,
//                       fit: BoxFit.scaleDown,
//                       child: Text(
//                         appointment.name,
//                         style: GoogleFonts.montserrat(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: FittedBox(
//                       alignment: Alignment.centerRight,
//                       fit: BoxFit.scaleDown,
//                       child: Text(
//                         'SLOT - $slotNumber',
//                         style: GoogleFonts.montserrat(
//                           color: Color(0xff4646B5),
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: screenSize.height * 0.01,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: FittedBox(
//                       alignment: Alignment.centerLeft,
//                       fit: BoxFit.scaleDown,
//                       child: Text(
//                         appointment.doctorName,
//                         style: GoogleFonts.montserrat(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: FittedBox(
//                       alignment: Alignment.centerRight,
//                       fit: BoxFit.scaleDown,
//                       child: Text(
//                         'Time Slot: ${appointment.timeSlot}', // Display timeSlot
//                         style: GoogleFonts.montserrat(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: screenSize.height * 0.01,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: FittedBox(
//                       fit: BoxFit.scaleDown,
//                       child: Text(
//                         'Last visited: ${DateFormat('d/M/yy').format(DateTime.now())}',
//                         style: GoogleFonts.montserrat(
//                           fontSize: 11,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Visibility(
//                       visible: appointment.virtualConsultation,
//                       child: FittedBox(
//                         fit: BoxFit.scaleDown,
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.red,
//                               radius: 5,
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               'Virtual',
//                               style: GoogleFonts.montserrat(
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Text(
//                     DateFormat('d MMM, yyyy').format(appointment.scheduleDate),
//                     style: GoogleFonts.montserrat(
//                       color: Colors.grey,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
