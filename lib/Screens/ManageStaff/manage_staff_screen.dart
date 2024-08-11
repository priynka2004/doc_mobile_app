import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/cancel_appoinments.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/reschedule_appoinment.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/schedule_follow_up.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_request_model.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/provider/staff_provider.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/staff_records_screen.dart';
import 'package:healtether_clinic_app/Screens/Models/schedule_date.dart';
import 'package:healtether_clinic_app/Screens/patients_records/model/patient_model.dart';
import 'package:healtether_clinic_app/Screens/patients_records/patient_record_screen.dart';
import 'package:healtether_clinic_app/constant/app_colors.dart';
import 'package:healtether_clinic_app/constant/app_text.dart';
import 'package:provider/provider.dart';
import '../AppointmentScreen/appointment_screen.dart';
import 'add_member_screen.dart';

class ManageStaffScreen extends StatefulWidget {
  const ManageStaffScreen({super.key});

  @override
  State<ManageStaffScreen> createState() => _ManageStaffScreenState();
}

class _ManageStaffScreenState extends State<ManageStaffScreen> {
  String selectedDate = 'All';

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
              AppText.manageStaff,
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
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'option_1') {
                // Handle option 1
              } else if (value == 'option_2') {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const ScheduleFollowUp(),
                );
              } else if (value == 'option_3') {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const RescheduleAppointment(),
                );
              } else if (value == 'option_4') {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return const CancelAppointment();
                  },
                );
              } else if (value == 'option_5') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientRecordsScreen(
                            patient: PatientModel(),
                          )),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'option_1',
                child: SizedBox(
                  width: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff5DDCB8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    child: const Row(
                      children: [
                        Text(
                          'Menu',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'option_2',
                child: ListTile(
                  title: Text(
                    'Schedule Follow-up',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'option_3',
                child: ListTile(
                  title: Text(
                    'Reschedule Appointment',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'option_4',
                child: ListTile(
                  title: Text(
                    'Cancel Appointment',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'option_5',
                child: ListTile(
                  title: Text(
                    'View Patient Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (_) => StaffProvider(),
        builder: (context, child) {
          return Consumer<StaffProvider>(
            builder:
                (BuildContext context, StaffProvider provider, Widget? child) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            color: AppColors.whiteColor,
                            width: 336,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 10, left: 10, right: 30),
                              child: Row(
                                children: [
                                  const Icon(Icons.search),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 210,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: AppText.quickSearch,
                                        hintStyle: GoogleFonts.montserrat(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  ScheduleSearchBox(),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 38,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                DateCards(
                                  width: 35,
                                  isSelected: selectedDate == 'All',
                                  onTap: () {
                                    setState(() {
                                      selectedDate = 'All';
                                    });
                                  },
                                  text: 'All',
                                ),
                                DateCards(
                                  width: 110,
                                  isSelected: selectedDate == 'Super Admin',
                                  onTap: () {
                                    setState(() {
                                      selectedDate = 'Super Admin';
                                    });
                                  },
                                  text: 'Super Admin',
                                ),
                                DateCards(
                                  width: 66,
                                  isSelected: selectedDate == 'Admins',
                                  onTap: () {
                                    setState(() {
                                      selectedDate = 'Admins';
                                    });
                                  },
                                  text: 'Admins',
                                ),
                                DateCards(
                                  width: 62,
                                  isSelected: selectedDate == 'Guests',
                                  onTap: () {
                                    setState(() {
                                      selectedDate = 'Guests';
                                    });
                                  },
                                  text: 'Guests',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              InfoCard(
                                selectedDate: selectedDate,
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                  if (provider.isLoading)
                    const Center(child: CircularProgressIndicator()),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          showSelectStatusBottomSheet(context);
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
                              AppText.addMember,
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
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  void showSelectStatusBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          width: 375,
          height: 210,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SELECT STATUS',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                height: 2,
                width: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF52CFAC)),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddMemberScreen(),
                      ));
                },
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.white1Color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              Text(
                                'Admin',
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddMemberScreen(),
                      ));
                },
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.white1Color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              Text(
                                'Guest',
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class InfoCard extends StatefulWidget {
  final String selectedDate;

  const InfoCard({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<StaffProvider>(context, listen: false).fetchStaff();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StaffProvider>(
      builder: (context, provider, child) {
        // List<staff_model.StaffModel> filteredStaff = [];
        List<StaffModel> filteredStaff = [];

        if (widget.selectedDate == 'All') {
          filteredStaff = provider.staffList;
        } else {
          filteredStaff = provider.staffList.where((staff) {
            if (widget.selectedDate == 'Super Admin') {
              return staff.isDoctor == true;
            } else if (widget.selectedDate == 'Admins') {
              return staff.isDoctor == false;
            } else if (widget.selectedDate == 'Guests') {
              return staff.isDoctor == false;
            }
            return true;
          }).toList();
        }

        if (widget.selectedDate == 'Guests' && filteredStaff.isEmpty) {
          return const Center(
            child: Text('No data found.'),
          );
        }

        return SizedBox(
          height: 436,
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: filteredStaff.length,
            itemBuilder: (BuildContext context, int index) {
              // staff_model.StaffModel staff = filteredStaff[index];
              StaffModel staff = filteredStaff[index];
              var id = staff.sId;
              return Column(
                children: [
                  Container(
                    height: 100,
                    width: 326,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return StaffRecordsScreen(data: staff);
                                    }),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${staff.firstName} ${staff.lastName}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: Text(
                                        staff.mobile ?? '91 7896 32154',
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 110,
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(
                                    staff.isDoctor == true
                                        ? 'Super Admin'
                                        : 'Admin',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text(
                                'Doctor',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 170),
                              const Icon(Icons.mail_outline, size: 20),
                              Image.asset(
                                "assets/homeimages/whatsapp.png",
                                color: const Color(0xFF110C2C),
                                height: 26,
                                width: 26,
                              ),
                              InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Column(
                                            children: [
                                              Text(
                                                'Do you want to delete the staff from the directory?',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                'The staff details will bw deleted permanently.',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                 MaterialStateProperty.all(
                                                    const Color(0xff32856E)),
                                                shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        4.0),
                                                  ),
                                                ),
                                                minimumSize:
                                                MaterialStateProperty.all(
                                                    const Size(110, 50)),
                                              ),
                                              child: const Text(
                                                'No',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                await provider
                                                    .deleteStaff(staff.sId!);
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                                  const Color(0xFF0F8F7FC),
                                                ),
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        4.0),
                                                  ),
                                                ),
                                                minimumSize:
                                                MaterialStateProperty.all(
                                                    const Size(110, 50)),
                                              ),
                                              child: const Text(
                                                'Yes',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Icon(Icons.delete, size: 20)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
