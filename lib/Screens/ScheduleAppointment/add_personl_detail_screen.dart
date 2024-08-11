import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/birtdate.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/custom_textfield.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/gender_dropdown.dart';
import 'package:healtether_clinic_app/Screens/ScheduleAppointment/schedule_successfully_screen.dart';
import 'package:healtether_clinic_app/Screens/ScheduleAppointment/timeslot_dropdown.dart';
import 'package:healtether_clinic_app/constant/constant.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'doctor_dropDown.dart';

class AddPersonalDetailsScreen extends StatefulWidget {
  const AddPersonalDetailsScreen({super.key});

  @override
  State<AddPersonalDetailsScreen> createState() =>
      _AddPersonalDetailsScreenState();
}

class _AddPersonalDetailsScreenState extends State<AddPersonalDetailsScreen> {
  bool scheduleNowPressed = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController appointmentBriefController = TextEditingController();
  DateTime? _selectedDate;
  DateTime? _dob;
  String? genderText;
  String? doctorText;
  String? timeSlotText;
  String? titleText;
  File? _image;
  bool showDuplicateNumberMessage = false;
  bool isSelected = false;
  bool showInvalidNumberMessage = false;

  List<String> existingNumbers = [];

  List<String> patientNames = ["Patient A", "Jane Doe", "Add New Patient"];

  String? selectedPatientOption;

  @override
  void initState() {
    super.initState();
    _timeSlots = generateTimeSlots();
    mobileNumberController.addListener(_handleMobileNumberChange);
    firstNameController.addListener(_updateButtonColors);
    mobileNumberController.addListener(_updateButtonColors);
    ageController.addListener(_updateButtonColors);
    reasonController.addListener(_updateButtonColors);
    fetchExistingNumbers();
  }

  @override
  void dispose() {
    mobileNumberController.removeListener(_handleMobileNumberChange);
    mobileNumberController.removeListener(_updateButtonColors);
    firstNameController.removeListener(_updateButtonColors);
    ageController.removeListener(_updateButtonColors);
    reasonController.removeListener(_updateButtonColors);
    mobileNumberController.dispose();
    firstNameController.dispose();
    ageController.dispose();
    reasonController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  Future<void> saveMobileNumber(String number) async {
    print("Saving number: $number");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> numbers = prefs.getStringList('mobileNumbers') ?? [];
    if (!numbers.contains(number)) {
      numbers.add(number);
      await prefs.setStringList('mobileNumbers', numbers);
      print("Number saved: $numbers");
    } else {
      print("Number already exists: $number");
    }
  }

  Future<List<String>> getMobileNumbers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('mobileNumbers') ?? [];
  }

  void fetchExistingNumbers() async {
    List<String> numbers = await getMobileNumbers();
    setState(() {
      existingNumbers = numbers;
    });
  }

  void _handleMobileNumberChange() {
    if (mobileNumberController.text.isEmpty) {
      setState(() {
        showDuplicateNumberMessage = false;
        selectedPatientOption = null;
      });
    }
  }

  List<String> generateTimeSlots() {
    List<String> timeSlots = ['Select Time Slot'];
    DateTime startTime = DateTime(2021, 1, 1, 9, 0); // Example start time
    DateTime endTime = DateTime(2021, 1, 1, 18, 0); // Example end time

    while (startTime.isBefore(endTime)) {
      DateTime nextTime = startTime.add(const Duration(minutes: 15));
      timeSlots.add(
          "${DateFormat('h:mm a').format(startTime)} - ${DateFormat('h:mm a').format(nextTime)}");
      startTime = nextTime;
    }
    return timeSlots;
  }

  List<String> _timeSlots = [];
  String? _selectedTimeSlot;

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
        ageController.text = age.toString();
      });
    }
  }

  bool _isDuplicateNumber(String number) {
    return existingNumbers.contains(number);
  }

  void _checkDuplicateNumber() {
    String number = mobileNumberController.text;
    if (number.length != 10) {
      setState(() {
        showInvalidNumberMessage = true;
        showDuplicateNumberMessage = false;
      });
    } else if (_isDuplicateNumber(number)) {
      setState(() {
        showDuplicateNumberMessage = true;
        showInvalidNumberMessage = false;
      });
    } else {
      setState(() {
        showDuplicateNumberMessage = false;
        showInvalidNumberMessage = false;
      });
    }
  }

  bool _isFormComplete() {
    bool isComplete = mobileNumberController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        genderText != null &&
        _dob != null &&
        mobileNumberController.text.length == 10;
    print("Is form complete: $isComplete");
    return isComplete;
  }

  void _updateButtonColors() {
    setState(() {});
  }

  void _submitForm() {
    if (_isFormComplete()) {
      print("Form submitted with number: ${mobileNumberController.text}");
      saveMobileNumber(mobileNumberController.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const ScheduleSuccessfullyScreen();
      }));
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'Birthdate';
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: const Text(
          AppText.addAppointment,
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_today_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: mobileNumberController,
                hintText: AppText.mobileNo,
                keyBoardType: TextInputType.phone,
                height: 52,
                onChanged: (value) {
                  _checkDuplicateNumber();
                },
              ),
              if (showDuplicateNumberMessage)
                Container(
                  height: 150,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.only(bottom: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: ListView.builder(
                    itemCount: patientNames.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPatientOption = patientNames[index];
                            if (selectedPatientOption != null &&
                                selectedPatientOption != "Add New Patient") {
                              firstNameController.text = selectedPatientOption!;
                            }
                            if (selectedPatientOption == "Add New Patient") {
                              showDuplicateNumberMessage = false;
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 12),
                          decoration: BoxDecoration(
                            color: selectedPatientOption == patientNames[index]
                                ? Colors.grey.withOpacity(0.2)
                                : Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                patientNames[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              if (selectedPatientOption == patientNames[index])
                                const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(height: 12),
              Text(
                AppText.personalDetails,
                style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xff605C72)),
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: firstNameController,
                hintText: AppText.name,
                height: 52,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: BirthDate(
                      selectedDate: _dob,
                      onTap: _pickDOB,
                      width: 0.45,
                      text: AppText.birthDate,
                      showIcon: true,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomTextField(
                    controller: ageController,
                    hintText: AppText.age,
                    height: 52,
                    width: MediaQuery.of(context).size.width * 0.45,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GenderContainer(
                      value: genderText,
                      onChanged: (String? newValue) {
                        setState(() {
                          genderText = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  // Container(
                  //   width: 24,
                  //   height: 24,
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFFF5F5F5),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(0.25),
                  //         offset: const Offset(1, 4),
                  //         blurRadius: 8,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color(0xFFA1A1A1),
                      ),
                      color: isSelected
                          ? const Color(0xFFFEFEFE)
                          : Colors.transparent,
                    ),
                    child: isSelected
                        ? const Icon(
                            Icons.check,
                            size: 12,
                            color: Colors.black,
                          )
                        : null,
                  ),
                  const SizedBox(width: 18),
                  Text(
                    'Virtual Consultation',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 1.25,
                          letterSpacing: 0.16,
                          color: Color(0xff0C091F)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                'Appointment Details',
                style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xff605C72),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DoctorDropDown(
                      value: doctorText,
                      onChanged: (String? newValue) {
                        setState(() {
                          doctorText = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              BirthDate(
                selectedDate: _dob,
                onTap: _pickDOB,
                width: 2.45,
                text: 'Select date',
                showIcon: false,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TimeSlotDropDown(
                      value: _selectedTimeSlot,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedTimeSlot = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: appointmentBriefController,
                hintText: 'Appointment Brief',
                height: 52,
              ),
              const Text(
                'This field is optional.',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Container(
                height: 60,
                margin: const EdgeInsets.only(left: 24, right: 24),
                decoration: BoxDecoration(
                  color: _isFormComplete()
                      ? const Color(0xFF32856E)
                      : const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: _isFormComplete() ? _submitForm : null,
                    child: Text(
                      'Schedule Appointment',
                      style: TextStyle(
                        color: _isFormComplete()
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF9E9E9E),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              // Container(
              //   width: 335,
              //   height: 62,
              //   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              //   decoration: BoxDecoration(
              //     color: _isFormComplete() ? const Color(0xFF32856E) : const Color(0xFFF5F5F5),
              //     borderRadius: BorderRadius.circular(7),
              //   ),
              //   child: Center(
              //     child: TextButton(
              //       onPressed: _isFormComplete()
              //           ? () {
              //         Navigator.push(context, MaterialPageRoute(builder: (context) {
              //           return const ScheduleSuccessfullyScreen();
              //         }));
              //       }
              //           : null,
              //       child: Text(
              //         AppText.scheduleNow,
              //         style: GoogleFonts.montserrat(
              //           fontSize: 12,
              //           fontWeight: FontWeight.w600,
              //           color: _isFormComplete() ? Colors.white : const Color(0xFFC2C2C2),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              // const SizedBox(height: 16),
              // GestureDetector(
              //   onTap: _isFormComplete()
              //       ? () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) {
              //       return const DocAppointmentScreen();
              //     }));
              //   }
              //       : null,
              //   child: Container(
              //     width: 335,
              //     height: 62,
              //     padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              //     decoration: BoxDecoration(
              //       color: const Color(0xFFF5F5F5),
              //       borderRadius: BorderRadius.circular(7),
              //     ),
              //     child: Center(
              //       child: Text(
              //         AppText.scheduleForLater,
              //         style: GoogleFonts.montserrat(
              //           fontSize: 12,
              //           fontWeight: FontWeight.w600,
              //           color: _isFormComplete() ? Colors.black : const Color(0xFFC2C2C2),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
