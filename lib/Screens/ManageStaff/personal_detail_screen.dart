import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/birtdate.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/custom_textfield.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/gender_dropdown.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/contact_detail_screen.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/create_staff_model.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/document_staff_model.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/provider/staff_provider.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/title_dropdown.dart';
import 'package:healtether_clinic_app/constant/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PersonalDetailScreen extends StatefulWidget {
  final PageController? pageController;

  const PersonalDetailScreen({super.key, this.pageController});

  @override
  State<PersonalDetailScreen> createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<PersonalDetailScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  DateTime? _selectedDate;
  DateTime? _dob;
  String? genderText;
  String? timeSlotText;
  String? titleText;
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<StaffProvider>(builder: (context, staffProvider, child) {
      if (staffProvider.errorMessage != null) {
        return Center(child: Text('Error: ${staffProvider.errorMessage}'));
      }
      return Column(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        AppText.personalDetails,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Stack(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey[300],
                                backgroundImage:
                                    _image != null ? FileImage(_image!) : null,
                                child: _image == null
                                    ? IconButton(
                                        onPressed: () {
                                          _getImage();
                                        },
                                        icon: const Icon(
                                            Icons.camera_alt_outlined),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text(
                                  'Click on the Profile photo to change it.',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    height: 18.07 / 13,
                                    letterSpacing: 0.5 / 100 * 13,
                                    color: Color(0xFF8E8E8E),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      CustomTextField(
                        controller: positionController,
                        hintText: AppText.position,
                        height: 52,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: TitleDropDown(
                              value: titleText,
                              onChanged: (String? newValue) {
                                setState(() {
                                  titleText = newValue;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      CustomTextField(
                        controller: firstNameController,
                        hintText: AppText.firstName,
                        height: 52,
                      ),
                      const SizedBox(height: 6),
                      CustomTextField(
                        controller: lastNameController,
                        hintText: AppText.lastName,
                        height: 52,
                      ),
                      const SizedBox(height: 6),
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
                            controller: ageController,
                            hintText: AppText.age,
                            height: 52,
                            width: MediaQuery.of(context).size.width * 0.45,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          GestureDetector(
            onTap: () {
              if (_image != null &&
                  firstNameController.text.isNotEmpty &&
                  lastNameController.text.isNotEmpty) {
                String profilePicPath = _image!.path;
                CreateStaff createStaff = CreateStaff(
                  staffId: "CHENNAI_79",
                  profilepic: profilePicPath,
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  specialisation: positionController.text,
                  age: ageController.text,
                  birthday: _dob?.toIso8601String(),
                  gender: genderText,
                  isDoctor: "true",
                  // documentType: "Aadhaar Card",
                  documentNumber: "125",
                  documents: [
                    Documents(
                      fileName: 'file-sample_150kB.pdf',
                      blobName: 'mvw0xntkO9pPB3-pJHOgD.pdf',
                    ),
                  ],
                  isAdmin: "false",
                  createdOn: "29/06/2024, 11:43:05",
                  modifiedOn: "29/06/2024, 11:43:05",
                  clientId: "662ca0a41a2431e16c41ebaa",
                );
                Provider.of<StaffProvider>(context, listen: false)
                    .createStaff(createStaff);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    // return const EditContactDetailScreen();
                    return ContactDetailScreen(
                      createStaff: createStaff,
                    );
                  }),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Please Fill All Value.')),
                );
              }
            },
            child: Container(
              height: 60,
              width: 280,
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
        ],
      );
    }));
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
              primary: Color(0xff32856E), // Your chosen color
              onPrimary: Colors.white,
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
        ageController.text = age.toString();
      });
    }
  }

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
