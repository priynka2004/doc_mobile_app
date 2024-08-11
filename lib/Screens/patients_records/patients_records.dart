import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healtether_clinic_app/Screens/ChatScreen/chat_detailes_screen.dart';
import 'package:healtether_clinic_app/Screens/patients_records/bloc/patient_records_bloc.dart';
import 'package:healtether_clinic_app/Screens/patients_records/patient_record_screen.dart';
import 'package:healtether_clinic_app/Screens/patients_records/provider/patient_record_provider.dart';
import 'package:healtether_clinic_app/constant/constant.dart';
import 'package:healtether_clinic_app/edit_profile/add_members_screen.dart';
import 'package:provider/provider.dart';

class PatientRecords extends StatefulWidget {
  const PatientRecords({Key? key}) : super(key: key);

  @override
  State<PatientRecords> createState() => _PatientRecordsState();
}

class _PatientRecordsState extends State<PatientRecords> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  late PatientRecordsProvider patientRecordsProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      patientRecordsProvider =
          Provider.of<PatientRecordsProvider>(context, listen: false);
      patientRecordsProvider.fetchPatients();
    });
  }

  PatientRecordsBloc bloc = PatientRecordsBloc();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        automaticallyImplyLeading: false,
        title: const Text(
          AppText.patientRecords,
          style: TextStyle(fontSize: 20),
        ),
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
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
            ),
          ),
        ],
      ),
      body: Consumer<PatientRecordsProvider>(
        builder: (context, provider, child) {
          return Stack(
            children: [
              if (provider.isLoading) ...[
                const Center(child: CircularProgressIndicator()),
              ] else ...[
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Container(
                          height: 50,
                              color: const Color(0xffFFFFFF),
                          child: CupertinoSearchTextField(
                            controller: _searchController,
                            placeholder: "Quick Search",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'All ${provider.totalCount} appointments are listed',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.patients.length,
                          itemBuilder: (context, index) {
                            var patient = provider.patients[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PatientRecordsScreen(
                                            patient: patient,
                                          )),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 90,
                                color: const Color(0xFFF5F5F5),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            patient.firstName ?? '',
                                            style: const TextStyle(
                                              color: AppColors.lightBlueColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Text(
                                            '35yrs, Female',
                                            style: TextStyle(
                                              color: AppColors.lightBlueColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            "+91 ${patient.mobile ?? 'No phone number'}",
                                            style: const TextStyle(
                                              color: AppColors.violetLightColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      const VerticalDivider(
                                        color: Color(0xFFDFDFDF),
                                        thickness: 1,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ChatDetailScreen(),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 34,
                                              width: 34,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/homeimages/whatsapp2.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            const Icon(Icons.call, size: 22),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF32856E),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const AddMembersScreen();
                          }));
                        },
                        child: const Text(
                          "Add new patient",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            // Equivalent to AppColors.whiteColor
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
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
      ),
    );
  }
}
