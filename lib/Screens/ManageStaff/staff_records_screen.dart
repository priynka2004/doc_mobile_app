import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/edit_profile_screen.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_request_model.dart';
import 'package:healtether_clinic_app/constant/constant.dart';

class StaffRecordsScreen extends StatefulWidget {
  final StaffModel data;
  const StaffRecordsScreen({super.key, required this.data});

  @override
  State<StaffRecordsScreen> createState() => _StaffRecordsScreenState();
}

class _StaffRecordsScreenState extends State<StaffRecordsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text(
          AppText.staffRecords,
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/homeimages/Ellipse 759.png',
                      ),
                      radius: 45,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 33,
                          width: 110,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(247, 247, 222, 4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              widget.data.isDoctor == true ? 'Super Admin' : 'Admin',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat'),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.data.firstName ?? 'Dr.'} ${widget.data.lastName ?? 'Kim Jones'}',
                        style: GoogleFonts.montserrat(
                          color: AppColors.blackColor,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'MBBS, DLO,MS(ENT)',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'General Physician',
                        style: GoogleFonts.montserrat(
                          color: AppColors.blueColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfileScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              AppText.editProfile,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              const Divider(),
              Container(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      buildDetailSection(
                        title: AppText.PERSONALDETAILS,
                        details: [
                          detailRowWidget(subTitle: '12/01/1993', title: 'Birthday'),
                          detailRowWidget(subTitle: '30', title: 'Age'),
                          detailRowWidget(subTitle: 'Male', title: 'Gender'),
                        ],
                      ),
                      const Divider(),
                      buildDetailSection(
                        title: AppText.CONTACTDETAILS,
                        details: [
                          detailRowWidget(subTitle: "+91 ${widget.data.mobile ?? '9865 632142'}", title: 'Mobile'),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 28,
                                        width: 28,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/homeimages/whatsapp.png',
                                                ))),
                                      ),
                                      const Spacer(),
                                    ],
                                  )),
                              const SizedBox(
                                width: 9,
                              ),
                              const Text(':'),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Container(
                                  child: const Text('+91 8964 521674',
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color(0xFF266A57),
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.clip),
                                ),
                              )
                            ],
                          ),
                          detailRowWidget(subTitle:'kimjones@gmail.com', title: 'Email'),
                          detailRowWidget(
                              subTitle:
                              'Plot No. 4-75/1, Madhavi Nagar, Oppo BHEL R&D Gate, BalaNagar, Hyderabad, Telangana, 500037',
                              title: 'Address'),
                        ],
                      ),
                      const Divider(),
                      buildDetailSection(
                        title: AppText.BANKDETAILS,
                        details: [
                          detailRowWidget(subTitle: 'ajitbhalla@ybl', title: 'UPI ID'),
                          detailRowWidget(subTitle: 'Indian Bank', title: 'Bank'),
                          detailRowWidget(subTitle: '5213 5123 6554 5894', title: 'A/c no.'),
                          detailRowWidget(subTitle: 'IDBI000H013', title: 'IFSC code'),
                          detailRowWidget(subTitle: 'Kim Jones', title: 'Account Holder'),
                        ],
                      ),
                      const Divider(),
                      buildDetailSection(
                        title: 'DOCUMENTS',
                        details: [
                          detailRowWidget(subTitle: 'Aadhar', title: 'ID type'),
                          detailRowWidget(subTitle: '9658 4521 6563 8954', title: 'ID no.'),
                          detailWidget(subTitle: '', title: 'Other Documents'),
                          detailsRowWidget(subTitle: '', title: '1. Aadhar card.png'),
                        ],
                      ),
                      const Divider(),
                      buildDetailSection(
                        title: 'PAYMENTS HISTORY',
                        details: [
                          detailRowWidget(subTitle: '', title: 'Receipts'),
                          detailsRowWidget(subTitle: '', title: '1. Salary_aug23'),
                          detailsRowWidget(subTitle: '', title: '2. Salary_july23'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailSection({required String title, required List<Widget> details}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        greenLine(),
        const SizedBox(
          height: 10,
        ),
        ...details,
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Container greenLine() {
    return Container(
      height: 2,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF52CFAC)),
    );
  }

  Row detailRowWidget({required String title, required String subTitle}) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xFF6D6D6D),
          ),
        ),
      ),
      const Text(':'),
      const SizedBox(
        width: 30,
      ),
      Expanded(
        child: Container(
          child: Text(subTitle,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                fontSize: 16,
                color: Color(0xFF266A57),
              ),
              softWrap: true,
              overflow: TextOverflow.clip),
        ),
      )
    ]);
  }

  Row detailWidget({required String title, required String subTitle}) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xFF6D6D6D),
          ),
        ),
      ),
      Expanded(
        child: Container(
          child: Text(subTitle,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                fontSize: 16,
                color: Color(0xFF266A57),
              ),
              softWrap: true,
              overflow: TextOverflow.clip),
        ),
      )
    ]);
  }

  Row detailsRowWidget({required String title, required String subTitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF266A57),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  subTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    fontSize: 16,
                    color: Color(0xFF266A57),
                  ),
                  softWrap: true,
                  overflow: TextOverflow.clip,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.find_in_page_rounded, color: Colors.black),
            ],
          ),
        ),
      ],
    );
  }
}
