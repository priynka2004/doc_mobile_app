import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/Models/schedule_date.dart';
import 'package:healtether_clinic_app/Screens/ScheduledAppoint/AppointmentFirstScreen/widgets/date_cards.dart';
import 'package:healtether_clinic_app/Screens/api/appointment_api.dart';
import 'package:healtether_clinic_app/Screens/ScheduledAppoint/AppointmentFirstScreen/widgets/info_cards.dart';

class AppointFirstScreen extends StatefulWidget {
  const AppointFirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AppointFirstScreen> createState() => _AppointFirstScreenState();
}

class _AppointFirstScreenState extends State<AppointFirstScreen> {
  DateTime? selectedDate;
  DateTime? searchDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointments',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
        child: FutureBuilder<List<Appointment>>(
          future: AppointmentApi()
              .fetchAppointments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<Appointment> appointments = snapshot.data!;

              List<Appointment> filteredAppointments = appointments;
              if (selectedDate != 'All') {
                if (selectedDate == 'Upcoming') {
                  filteredAppointments = filteredAppointments
                      .where((appointment) =>
                          appointment.scheduleDate.isAfter(DateTime.now()))
                      .toList();
                }
              }

              if (searchDate != null) {
                filteredAppointments = filteredAppointments
                    .where((appointment) =>
                        appointment.scheduleDate.year == searchDate!.year &&
                        appointment.scheduleDate.month == searchDate!.month &&
                        appointment.scheduleDate.day == searchDate!.day)
                    .toList();
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 60,
                    color: const Color(0xffF5F5F5),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 30, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Quick Search',
                                hintStyle: GoogleFonts.montserrat(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          ScheduleSearchBox(
                            onDateSelected: (DateTime? date) {
                              setState(() {
                                searchDate = date;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 38,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        DateCards(
                          width: 50,
                          isSelected: selectedDate == null,
                          onTap: () {
                            setState(() {
                              selectedDate = null;
                            });
                          },
                          text: 'All',
                        ),
                        DateCards(
                          width: 105,
                          isSelected: selectedDate != null &&
                              selectedDate!.isAfter(DateTime.now()),
                          onTap: () {
                            setState(() {
                              selectedDate = DateTime.now();
                            });
                          },
                          text: 'Super Admin',
                        ),
                        DateCards(
                          width: 90,
                          isSelected: selectedDate != null &&
                              selectedDate!.isBefore(DateTime.now()),
                          onTap: () {
                            setState(() {
                              selectedDate = DateTime.now();
                            });
                          },
                          text: 'Admins',
                        ),
                        DateCards(
                          width: 90,
                          isSelected: selectedDate != null &&
                              selectedDate!.isBefore(DateTime.now()),
                          onTap: () {
                            setState(() {
                              selectedDate = DateTime.now();
                            });
                          },
                          text: 'Guests',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.separated(
                      itemCount: filteredAppointments.length,
                      separatorBuilder: (BuildContext context, int index) {
                        // Add space between cards
                        return SizedBox(
                            height: MediaQuery.of(context).size.height *
                                0.02); // Adjust height as needed
                      },
                      itemBuilder: (context, index) {
                        final appointment = filteredAppointments[index];

                        return AppointInfoCard(
                          appointment: appointment,
                          slotNumber: index + 1,
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
