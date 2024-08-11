import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/custom_textfield.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/id_proof_dropdown.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/create_staff_model.dart';
import 'package:healtether_clinic_app/Screens/patients_records/model/post/address_patient_model.dart';
import 'package:healtether_clinic_app/Screens/patients_records/model/post/patient_create_model.dart';
import 'package:healtether_clinic_app/Screens/patients_records/provider/patient_record_provider.dart';
import 'package:healtether_clinic_app/constant/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';

class DocumentScreen extends StatefulWidget {
  final PageController? pageController;
  final PatientCreate? patientCreate;
  final CreateStaff? createStaff;

  const DocumentScreen(
      {super.key, this.pageController, this.patientCreate, this.createStaff});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController additionalIDController = TextEditingController();
  String? idProofText;
  bool showID = false;
  int currentPageIndex = 2;
  final PageController pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: const Text(
          'Add member',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color(0XFF4646B5),
                fontSize: 18,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Consumer<PatientRecordsProvider>(
        builder: (context, patientRecordProvider, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: SmoothPageIndicator(
                              controller: pageController,
                              count: 4,
                              effect: const ExpandingDotsEffect(
                                expansionFactor: 5,
                                dotColor: Color(0XFF5351C7),
                                strokeWidth: 3,
                                dotHeight: 8,
                                dotWidth: 8,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            AppText.documents,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: IdProofDropDown(
                                  value: idProofText,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      idProofText = newValue;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: idController,
                            hintText: AppText.iDNo,
                            height: 52,
                          ),
                          const SizedBox(height: 10),
                          if (showID)
                            CustomTextField(
                              controller: additionalIDController,
                              hintText: AppText.additionalID,
                              height: 52,
                            ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showID = true;
                              });
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.add, color: AppColors.blueColor),
                                Text(
                                  AppText.addAnotherID,
                                  style: TextStyle(color: AppColors.blueColor),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 2,
                              width: screenSize.width * 0.6,
                              color: AppColors.blueColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Divider(),
                          const Text(
                            AppText.addDocuments,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            AppText.uploadImage,
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 35,
                            width: 370,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Browse to upload documents',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 65,
                                  ),
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    color: AppColors.whiteColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                          const Text(
                            AppText.list,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Text(
                                '1. Aadhar card.png',
                                style: TextStyle(
                                  color: Color(0xff6D6D6D),
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.find_in_page_rounded)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete)),
                            ],
                          ),
                          const SizedBox(
                            height: 140,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  PatientCreate patientCreate = PatientCreate(
                    firstName: widget.patientCreate?.firstName,
                    lastName: widget.patientCreate?.lastName,
                    birthday: widget.patientCreate?.birthday,
                    age: widget.patientCreate?.age,
                    gender: widget.patientCreate?.gender,
                    height: widget.patientCreate?.height,
                    weight: widget.patientCreate?.weight,
                    mobile: widget.patientCreate?.mobile,
                    email: widget.patientCreate?.email,
                    address: AddressPatient(
                        house: widget.patientCreate?.address?.house,
                        street: widget.patientCreate?.address?.street,
                        landmarks: widget.patientCreate?.address?.landmarks,
                        city: widget.patientCreate?.address?.city,
                        pincode: widget.patientCreate?.address?.pincode),
                    documentType: idProofText,
                    documentNumber: idController.text,
                  );
                  // GetPatientService getPateintService = GetPatientService();
                  // getPateintService.postPatient(
                  //     widget.firstName,
                  //     widget.lastName,
                  //     widget.birthDate,
                  //     widget.age,
                  //     widget.gender,
                  //     widget.height,
                  //     widget.weight,
                  //     widget.phone,
                  //     widget.email,
                  //     widget.house,
                  //     widget.area,
                  //     widget.landmark,
                  //     widget.city,
                  //     widget.pincode,
                  //     idProofText,
                  //     idController.text);
                  await patientRecordProvider.postPatient(patientCreate);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return PaymentDetailScreen();
                  //     },
                  //   ),
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 36, right: 36, bottom: 8, top: 5),
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
              ),
            ],
          );
        },
      ),
    );
  }
}
