import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/custom_textfield.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/date_container.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/doctor_option.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/schedule_button.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/timeslot_dropdown.dart';
import 'package:healtether_clinic_app/Screens/Provider/appointmentdata.dart';
import 'package:healtether_clinic_app/Screens/api/book_appointment_api.dart';
import 'package:healtether_clinic_app/constant/constant.dart';
import 'package:provider/provider.dart';

class AppointLater extends StatefulWidget {
  final PageController? pageController;

  const AppointLater({
    Key? key,
    this.pageController,
  }) : super(key: key);

  @override
  State<AppointLater> createState() => _AppointLaterState();
}

class _AppointLaterState extends State<AppointLater> {
  TextEditingController mobilenocontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController reasoncontroller = TextEditingController();


  DateTime? _selectedDate;
  DateTime? _dob;
  String? genderText;
  String? doctorText;
  String? timeSlotText;
  String bearerToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YTUxNzBkNDFmMTk5ZmIwM2M0YTRkOSIsImlhdCI6MTcxMjE2MzYwMywiZXhwIjoxNzEyMzM2NDAzfQ.z6f7eRwxC4BMIVxy27usOJpF_znVN6vuJWy2jFSuqZk';

  List<Map<String, String>> doctorList = [];
  List<Map<String, dynamic>> timeSlotList = [];

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
    _fetchTimeSlots();
  }

  Future<void> _fetchDoctors() async {
  }

  Future<void> _fetchTimeSlots() async {
  }

  @override
  Widget build(BuildContext context) {
    var appointmentData = Provider.of<AppointmentData>(context, listen: false);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              AppText.appointmentDetails,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            DateContainer(
              selectedDate: _selectedDate,
              onTap: _pickDate,
              width: 1,
              text: 'Select date',
            ),
            const SizedBox(height: 5),
            TimeSlotDropdown(
              value: timeSlotText,
              items: timeSlotList,
              onChanged: (Map<String, dynamic>? newValue) {
                setState(() {
                  timeSlotText = newValue!['timeSlot']; // Fix here
                });
              },
              hintText: 'Select Time Slot',
            ),
            const SizedBox(height: 10),
            DoctorOption(
              value: doctorText,
              items: doctorList,
              onChanged: (String? newValue) {
                setState(() {
                  doctorText = newValue;
                });
              },
              hintText: 'Attending Doctor',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: reasoncontroller,
              hintText: 'Appointment Reason',
              height: 50,
            ),
            const SizedBox(height: 85),
            ScheduleButton(
              text: 'Schedule appointment',
              pageIndex: 2,
              onTap: () => _scheduleTap(2),
              isFilled: _isScheduleButtonEnabled(),
            ),
          ],
        ),
      ),
    );
  }

  bool _isScheduleButtonEnabled() {
    return namecontroller.text.isNotEmpty &&
        genderText != null &&
        _selectedDate != null &&
        mobilenocontroller.text.isNotEmpty;
  }

  void _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.greenColor, // Your chosen color
              onPrimary: AppColors.whiteColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  void _pickDOB() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _dob) {
      setState(() {
        _dob = pickedDate;
        int age = calculateAge(pickedDate);
        agecontroller.text = age.toString();
      });
    }
  }

  void _scheduleTap(int pageIndex) async {
    var appointmentData = Provider.of<AppointmentData>(context, listen: false);
    if (widget.pageController != null && _isScheduleButtonEnabled()) {
      String mobile = mobilenocontroller.text ?? '';
      String name = namecontroller.text ?? '';
      String gender = genderText ?? '';
      String age = agecontroller.text;
      String birthDate = _dob != null ? _dob.toString() : '';
      String appointmentDate =
          _selectedDate != null ? _selectedDate.toString() : '';
      String timeSlot = timeSlotText ?? '';
      String reason = reasoncontroller.text ?? '';
      String patientId = '';
      String doctorId = '';
      String doctorName = doctorText ?? '';
      String clientId = '';

      try {
        await BookAppointmentApi.bookAppointment(
          token: bearerToken,
          mobile: mobile,
          name: name,
          gender: gender,
          age: age,
          birthDate: birthDate,
          appointmentDate: appointmentDate,
          timeSlot: timeSlot,
          reason: reason,
          patientId: patientId,
          doctorId: doctorId,
          doctorName: doctorName,
          clientId: clientId,
        );

        widget.pageController!.animateToPage(
          pageIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } catch (e) {
        if (kDebugMode) {
          print('Error booking appointment: $e');
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Failed to book appointment. Please try again later.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all the details')),
      );
    }
  }
}
