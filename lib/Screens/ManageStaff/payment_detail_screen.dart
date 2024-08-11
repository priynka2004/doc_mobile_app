import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/custom_textfield.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/bankname_dropdown.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/create_staff_model.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_request_model.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/provider/staff_provider.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/staff_records_screen.dart';
import 'package:healtether_clinic_app/constant/constant.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class PaymentDetailScreen extends StatefulWidget {
  final CreateStaff createStaff;
  final PageController? pageController;
   StaffModel? staff;

  PaymentDetailScreen(
      {super.key, this.pageController, required this.createStaff});

  @override
  State<PaymentDetailScreen> createState() => _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  TextEditingController upiIdController = TextEditingController();
  TextEditingController IFSCCodeController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController additionalUpiIDController = TextEditingController();
  TextEditingController additionalAnotherNumberIDController = TextEditingController();
  bool showUpiID = false;
  bool showAnotherNumber = false;
  String? bankNameText;
  int currentPageIndex = 3;
  final PageController pageController = PageController(initialPage: 3);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add member'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(color: Color(0XFF4646B5), fontSize: 18),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Consumer<StaffProvider>(builder: (context, staffProvider, child) {
        if (staffProvider.errorMessage != null) {
          return Center(child: Text('Error: ${staffProvider.errorMessage}'));
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        AppText.paymentDetails,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        AppText.upiID,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: upiIdController,
                        hintText: AppText.addUpiID,
                        height: 52,
                      ),
                      const SizedBox(height: 10),
                      if (showUpiID)
                        CustomTextField(
                          controller: additionalUpiIDController,
                          hintText: AppText.additionalUpiID,
                          height: 52,
                        ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showUpiID = true;
                          });
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.add, color: AppColors.blueColor),
                            Text(
                              AppText.addAnotherUPIID,
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
                      const Text(
                        AppText.bankDetails,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: BankNameDropDown(
                              value: bankNameText,
                              onChanged: (String? newValue) {
                                setState(() {
                                  bankNameText = newValue;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: accountNoController,
                        hintText: AppText.accountNo,
                        height: 52,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: IFSCCodeController,
                        hintText: AppText.iFSCCode,
                        height: 52,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: accountHolderNameController,
                        hintText: AppText.accountHolderName,
                        height: 52,
                      ),
                      const SizedBox(height: 10),
                      if (showAnotherNumber)
                        CustomTextField(
                          controller: additionalAnotherNumberIDController,
                          hintText: AppText.additionalAnotherNumber,
                          height: 52,
                        ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showAnotherNumber = true;
                          });
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.add, color: AppColors.blueColor),
                            Text(
                              AppText.addAnotherNumber,
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
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                widget.createStaff.bankName = bankNameText;
                widget.createStaff.account = accountNoController.text;
                widget.createStaff.accountName =
                    accountHolderNameController.text;
                widget.createStaff.ifsc = IFSCCodeController.text;
                staffProvider.createStaff(widget.createStaff).then((_) {
                  if (staffProvider.errorMessage == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StaffRecordsScreen(data: StaffModel()),
                      ),
                    );
                   }
                });
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
      }),
    );
  }
}
