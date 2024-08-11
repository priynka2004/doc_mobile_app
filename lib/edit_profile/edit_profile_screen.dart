import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/birtdate.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/custom_textfield.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/gender_dropdown.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/address_staff_model.dart';
import 'package:healtether_clinic_app/Screens/Provider/appointmentdata.dart';
import 'package:healtether_clinic_app/Screens/api/appointment_api.dart';
import 'package:healtether_clinic_app/Screens/api/clinic_timeslots_api.dart';
import 'package:healtether_clinic_app/Screens/api/doctor_selection_api.dart';
import 'package:healtether_clinic_app/Screens/patients_records/model/post/address_patient_model.dart';
import 'package:healtether_clinic_app/Screens/patients_records/model/post/documents_patient_model.dart';
import 'package:healtether_clinic_app/Screens/patients_records/model/post/patient_create_model.dart';
import 'package:healtether_clinic_app/models/patient/patient_model.dart';
import 'package:provider/provider.dart';
import '../Screens/patient_profile/edit_profile/contact_detail.dart';
import '../Screens/patients_records/provider/patient_record_provider.dart';
import '../Screens/patients_records/service/patient_service.dart';
import '../constant/app_colors.dart';
import '../constant/app_text.dart';

class EditProfileScreens extends StatefulWidget {
  final PageController? pageController;

  const EditProfileScreens({
    Key? key,
    this.pageController,
  }) : super(key: key);

  @override
  State<EditProfileScreens> createState() => _EditProfileScreensState();
}

class _EditProfileScreensState extends State<EditProfileScreens> {
  TextEditingController mobileNocController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  final PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  bool isRowVisible = true;
  bool isVirtualConsultation = false;
  bool isCancelled = false;
  bool isMobileNumberRegistered = false;

  DateTime? _selectedDate;
  DateTime? _dob;
  String? genderText;
  String? doctorText;
  String? timeSlotText;

  // String bearerToken =
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YTUxNzBkNDFmMTk5ZmIwM2M0YTRkOSIsImlhdCI6MTcxMjE2MzYwMywiZXhwIjoxNzEyMzM2NDAzfQ.z6f7eRwxC4BMIVxy27usOJpF_znVN6vuJWy2jFSuqZk';

  List<Map<String, String>> doctorList = [];
  List<Map<String, dynamic>> timeSlotList = [];
  List<Appointment> appointments = [];

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
    //  _fetchTimeSlots();
  }

  Future<void> _fetchDoctors() async {
    try {
      DoctorApi doctorApi = DoctorApi();
      List<Map<String, String>> fetchedDoctorList =
          await doctorApi.fetchDoctors();
      setState(() {
        doctorList = fetchedDoctorList;
      });
    } catch (e) {
      print('Error fetching doctors: $e');
      // Handle error
    }
  }

  Future<void> _fetchTimeSlots() async {
    try {
      TimeSlotApi timeSlotApi = TimeSlotApi();
      List<Map<String, dynamic>> fetchedTimeSlotList =
          await timeSlotApi.fetchTimeSlots();
      setState(() {
        timeSlotList = fetchedTimeSlotList;
      });
    } catch (e) {
      print('Error fetching time slots: $e');
      // Handle error
    }
  }

  Future<void> _fetchAppointments() async {
    try {
      AppointmentApi appointmentApi = AppointmentApi();
      List<Appointment> fetchedAppointments =
          await appointmentApi.fetchAppointments();
      setState(() {
        appointments = fetchedAppointments;
      });
    } catch (e) {
      print('Error fetching appointments: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    var appointmentData = Provider.of<AppointmentData>(context, listen: false);
    return Scaffold(
      body: Consumer<PatientRecordsProvider>(
          builder: (context, patientRecordProvider, child) {
        // if (patientRecordProvider.isLoading) {
        //   return Center(child: const CircularProgressIndicator());
        // }

        if (patientRecordProvider.errorMessage != null) {
          return Text('Error: ${patientRecordProvider.errorMessage}');
        }

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          AppText.personalDetails,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: firstNameController,
                          hintText: AppText.firstName,
                          height: 52,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: lastNameController,
                          hintText: AppText.lastName,
                          height: 52,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: BirthDateContainer(
                                selectedDate: _dob,
                                onTap: _pickDOB,
                                width: 0.45,
                                text: AppText.birthDate,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomTextField(
                              keyBoardType: TextInputType.number,
                              controller: ageController,
                              hintText: AppText.age,
                              height: 52,
                              width: MediaQuery.of(context).size.width * 0.45,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GenderDropDown(
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
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CustomTextField(
                              controller: heightController,
                              hintText: 'Height',
                              height: 52,
                              width: MediaQuery.of(context).size.width * 0.41,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            CustomTextField(
                              controller: weightController,
                              hintText: 'Weight',
                              height: 52,
                              width: MediaQuery.of(context).size.width * 0.41,
                            ),
                          ],
                        ),
                        const SizedBox(height: 190),
                      ],
                    ),
                  ),

                  // SizedBox(height: 30,),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () async {
                // Create an instance of PatientCreate with actual data
                // PatientCreate patientCreate = PatientCreate(
                //   firstName: firstNameController.text,
                //   lastName: lastNameController.text,
                //   patientId: "SD_131",
                //   age: ageController.text,
                //   height: heightController.text,
                //   weight: weightController.text,
                //   birthday: _dob?.toIso8601String(),
                //   gender: genderText,
                //   // mobile: "8796545895",
                //   // email: "test@gmail.com",
                //   address: AddressPatient(
                //       // house: "58",
                //       // street: "Streeat",
                //       // landmarks: "Landmark",
                //       // city: "chennai",
                //       // pincode: "600000",
                //       ),
                //   documentType: "Aadhaar Card",
                //   documentNumber: "7895641",
                //   documents: [
                //     DocumentsPatient(
                //       fileName: "SED_Receipt.pdf",
                //       blobName: "KRugJpIml7ZFELLuAC2xi.pdf",
                //     ),
                //   ],
                //   createdOn: "29/06/2024, 10:47:29",
                //   modifiedOn: "29/06/2024, 10:47:29",
                //   clientId: "662ca0a41a2431e16c41ebaa",
                // );
                try {
                  // await patientRecordProvider.postPatient(patientCreate);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactDetailScreen(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                birthDate: _dob?.toIso8601String(),
                                age: ageController.text,
                                gender: genderText,
                                height: heightController.text,
                                weight: weightController.text,
                              )));
                } catch (e) {
                  print('Error: $e');
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 36, right: 36, top: 5, bottom: 8),
                child: Container(
                  height: 60,
                  width: 326,
                  decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      AppText.save,
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            )

            // GestureDetector(
            //   onTap: () {
            //     PatientCreate patientCreate = PatientCreate(
            //         firstName: 'Nitin',
            //         lastName: 'Sheoran',
            //         age: '90',
            //         height: '6',
            //         weight: '50',
            //         birthday: '2005-09-30',
            //         gender: 'male',
            //         mobile: '1234567890',
            //         email: 'example@example.com',
            //         patientId: "SD_132",
            //         address: AddressPatient(
            //           house: '123',
            //           street: 'Main Street',
            //           landmarks: 'Near the park',
            //           city: 'New York',
            //           pincode: '100013',
            //         ),
            //         documentType: 'ID Card',
            //         documentNumber: 'ABC123',
            //         documents: [
            //           DocumentsPatient(
            //             fileName: 'document.pdf',
            //             blobName: 'blob123',
            //           ),
            //         ],
            //         createdOn: "29/06/2024, 10:47:29",
            //         modifiedOn: "29/06/2024, 10:47:29",
            //         clientId: "662ca0a41a2431e16c41ebab");
            //     patientRecordProvider.postPatient(patientCreate).then((_) {
            //       if (patientRecordProvider.errorMessage == null) {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) {
            //             return const ContactDetailScreen();
            //           }),
            //         );
            //       }
            //     });
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(
            //         left: 36, right: 36, top: 5, bottom: 8),
            //     child: Container(
            //       height: 60,
            //       width: 326,
            //       decoration: BoxDecoration(
            //         color: AppColors.greenColor,
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       child: Center(
            //         child: Text(
            //           AppText.save,
            //           style: GoogleFonts.montserrat(
            //             fontSize: 12,
            //             fontWeight: FontWeight.w600,
            //             color: AppColors.whiteColor,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        );
      }),
    );
  }

  //
  // bool _isScheduleButtonEnabled() {
  //   return nameController.text.isNotEmpty &&
  //       genderText != null &&
  //       _selectedDate != null &&
  //       mobileNocController.text.isNotEmpty;
  // }
  //
  // void _pickDate() async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //     builder: (BuildContext context, Widget? child) {
  //       return Theme(
  //         data: ThemeData.light().copyWith(
  //           colorScheme: const ColorScheme.light(
  //             primary: Color(0xff32856E), // Your chosen color
  //             onPrimary: Colors.white,
  //           ),
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //   if (pickedDate != null && pickedDate != _selectedDate) {
  //     setState(() {
  //       _selectedDate = pickedDate;
  //     });
  //   }
  // }

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

// void _scheduleTap(int pageIndex) async {
//   var appointmentData = Provider.of<AppointmentData>(context, listen: false);
//   if (widget.pageController != null && _isScheduleButtonEnabled()) {
//     String mobile = mobileNocController.text;
//     String name = nameController.text;
//     String gender = genderText ?? '';
//     String age = ageController.text; // Add age if needed
//     String birthDate = _dob != null ? _dob.toString() : '';
//     String appointmentDate =
//     _selectedDate != null ? _selectedDate.toString() : '';
//     String timeSlot = timeSlotText ?? '';
//     String reason = reasonController.text;
//     String patientId = ''; // Add patient ID if needed
//     String doctorId = ''; // Add doctor ID if needed
//     String doctorName = doctorText ?? '';
//     String clientId = ''; // Add client ID if needed
//
//     try {
//       await BookAppointmentApi.bookAppointment(
//         token: bearerToken,
//         mobile: mobile,
//         name: name,
//         gender: gender,
//         age: age,
//         birthDate: birthDate,
//         appointmentDate: appointmentDate,
//         timeSlot: timeSlot,
//         reason: reason,
//         patientId: patientId,
//         doctorId: doctorId,
//         doctorName: doctorName,
//         clientId: clientId,
//       );
//
//       // Move to the next page if booking was successful
//       widget.pageController!.animateToPage(
//         pageIndex,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.ease,
//       );
//     } catch (e) {
//       print('Error booking appointment: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content:
//             Text('Failed to book appointment. Please try again later.')),
//       );
//     }
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Please fill in all the details')),
//     );
//   }
// }
}
