import 'package:flutter/material.dart';
import 'package:healtether_clinic_app/Screens/ScheduledAppoint/AppointmentDetails/widgets/appointment_details_body.dart';
import 'package:healtether_clinic_app/Screens/ScheduledAppoint/AppointmentDetails/widgets/appointment_details_appbar.dart';
import 'package:healtether_clinic_app/Screens/api/appointment_api.dart';
import 'package:healtether_clinic_app/Screens/Provider/appointmentdata.dart';
import 'package:provider/provider.dart';

class AppointmentDetails extends StatelessWidget {
  final Appointment appointment;
  final int slotNumber;
  final TimeOfDay? timeSlot;
  const AppointmentDetails({
    Key? key,
    required this.appointment,
    required this.slotNumber,
    this.timeSlot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appointmentData = Provider.of<AppointmentData>(context);
    return Scaffold(
      appBar: AppointmentDetailsAppBar(
        appointment: appointment,
        onDelete: () =>
            _handleDeleteAppointment(context),
      ),
      body: AppointmentDetailsBody(
        appointment: appointment,
        slotNumber: slotNumber,
        timeSlot: timeSlot,
      ),
    );
  }

  void _handleDeleteAppointment(BuildContext context) {
    // Provider.of<AppointmentData>(context, listen: false)
    //     .deleteAppointment(appointment);
    // Navigator.pop(context); // Go back after deleting the appointment
  }
}
