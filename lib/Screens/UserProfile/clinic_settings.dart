import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/constant/constant.dart';
import 'package:image_picker/image_picker.dart';

class ClinicSettings extends StatefulWidget {
  const ClinicSettings({super.key});

  @override
  State<ClinicSettings> createState() => _ClinicSettingsState();
}

class _ClinicSettingsState extends State<ClinicSettings> {
  TextEditingController text1 = TextEditingController();

  TextEditingController text2 = TextEditingController();

  TextEditingController text3 = TextEditingController();

  TextEditingController text4 = TextEditingController();
  File? _image;

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
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
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
          const SizedBox(
            width: 5,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 25,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    'ADD NEW CLINIC',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 83.0,
                    ),
                    child: SizedBox(
                      height: 5,
                      width: 54,
                      child: Divider(
                        thickness: 2,
                        color: Color(0xff52CFAC),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //Describe the logic for image picker
                    },
                    child: CircleAvatar(
                      radius: 56,
                      backgroundColor: const Color(0xffF1E7F9),
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null,
                      child: _image == null
                          ? IconButton(
                              onPressed: () {
                                _getImage();
                              },
                              icon: const Icon(Icons.camera_alt, size: 30),
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Clinic logo',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Click on the camera to add',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.grey),
                      ),
                      Text(
                        'Clinic logo',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0xffEEEEEE),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10),
                  child: TextField(
                    controller: text1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Clinic name',
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 60,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0xffEEEEEE),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10),
                  child: TextField(
                    controller: text2,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Admin name',
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 60,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0xffEEEEEE),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: text3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Mobile no',
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 60,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0xffEEEEEE),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10),
                  child: TextField(
                    controller: text4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Clinic's Email",
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              GestureDetector(
                onTap: () {
                  if (text1.text.isEmpty &&
                      text2.text.isEmpty &&
                      text3.text.isEmpty &&
                      text4.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please fill in all the details')),
                    );
                  }
                },
                child: Center(
                  child: Container(
                    height: 55,
                    width: 250,
                    decoration: BoxDecoration(
                      color: text1.text.isEmpty &&
                              text2.text.isEmpty &&
                              text3.text.isEmpty &&
                              text4.text.isEmpty
                          ? const Color(0xffF8F7FC)
                          : const Color(0xff32856E),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: text1.text.isEmpty &&
                                  text2.text.isEmpty &&
                                  text3.text.isEmpty &&
                                  text4.text.isEmpty
                              ? Colors.grey
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
