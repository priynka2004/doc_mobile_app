import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/custom_textfield.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/id_proof_dropdown.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/payment_detail_screen.dart';
import 'package:healtether_clinic_app/constant/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DocumentDetailScreen extends StatefulWidget {
  final PageController? pageController;

  const DocumentDetailScreen({super.key, this.pageController});

  @override
  State<DocumentDetailScreen> createState() => _DocumentDetailScreenState();
}

class _DocumentDetailScreenState extends State<DocumentDetailScreen> {
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
        title: const Text(
          'Add member',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
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
                          count: 3,
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
                      if (showID) ...[
                        CustomTextField(
                          controller: additionalIDController,
                          hintText: AppText.additionalID,
                          height: 52,
                        ),
                      ],
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
                              )
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
                                color: Color(
                                  0xff6D6D6D,
                                ),
                                fontSize: 12),
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
          Padding(
            padding:
            const EdgeInsets.only(left: 36, right: 36, bottom: 8, top: 5),
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
      ),
    );
  }
}
