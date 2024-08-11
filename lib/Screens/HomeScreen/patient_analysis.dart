import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentAnalysis/appointment_analysis_bloc.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/widgets/custom_textfield.dart';
import 'package:healtether_clinic_app/Screens/HomeScreen/bar_chart_card.dart';
import 'package:healtether_clinic_app/Screens/HomeScreen/payment_analysis.dart';
import 'package:healtether_clinic_app/Screens/Widgets/piechart_card.dart';
import 'package:healtether_clinic_app/constant/constant.dart';
import 'package:healtether_clinic_app/services/appointment_analysis/appointment_api.dart';
import '../AppointmentAnalysis/appointment_anlaysis_event.dart';


final AppointmentService appointmentService = AppointmentService(
  "https://9316dbec-7490-466d-bc74-5e4bb14eefc2.mock.pstmn.io/",
);

class PatientAnalysis extends StatefulWidget {
  const PatientAnalysis({super.key});

  @override
  State<PatientAnalysis> createState() => _PatientAnalysisState();
}

class _PatientAnalysisState extends State<PatientAnalysis> {
  late final AppointmentBloc _appointmentBloc;
  String selectedAnalysis = 'Patients Analysis';
  String selectedDate = 'Today';
  final List<String> items = [
    'Patients Analysis',
    'Appointments Analysis',
    'Payments Analysis'
  ];
  AppointmentService api = AppointmentService(
      "https://9316dbec-7490-466d-bc74-5e4bb14eefc2.mock.pstmn.io/");
  final List<String> dateOptions = [
    'Today',
    'Yearly',
    'Monthly',
    'Weekly',
    'Custom'
  ];
  String containerText = 'kimjones@ybl';
  TextEditingController additionalAnotherNumberController =
  TextEditingController();

  bool showAnotherNumber = false;

  @override
  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: containerText));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied!'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _appointmentBloc = AppointmentBloc(appointmentService);
    _appointmentBloc.add(FetchDataEvent());
  }

  @override
  void dispose() {
    _appointmentBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back)),
            Text(
              ' Analytics',
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
              child: GestureDetector(
                onTap: (){
                  showSwitchClinicsBottomSheet(context);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedAnalysis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down_outlined),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _buildSelectedAnalysis(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedAnalysis() {
    switch (selectedAnalysis) {
      case 'Patients Analysis':
        return _buildPatientsAnalysis();
      case 'Appointments Analysis':
        return _buildAppointmentsAnalysis();
      case 'Payments Analysis':
        return _buildPaymentsAnalysis();
      default:
        return Container();
    }
  }

  Widget _buildPatientsAnalysis() {
    return Column(
      children: [
        SizedBox(
          height: 48,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              DateCards(
                isSelected: selectedDate == 'Today',
                onTap: () {
                  setState(() {
                    selectedDate = 'Today';
                  });
                },
                text: 'Today',
              ),
              DateCards(
                isSelected: selectedDate == 'Yearly',
                onTap: () {
                  setState(() {
                    selectedDate = 'Yearly';
                  });
                },
                text: 'Yearly',
              ),
              DateCards(
                isSelected: selectedDate == 'Monthly',
                onTap: () {
                  setState(() {
                    selectedDate = 'Monthly';
                  });
                },
                text: 'Monthly',
              ),
              DateCards(
                isSelected: selectedDate == 'Weekly',
                onTap: () {
                  setState(() {
                    selectedDate = 'Weekly';
                  });
                },
                text: 'Weekly',
              ),
              DateCards(
                isSelected: selectedDate == 'Custom',
                onTap: () {
                  setState(() {
                    selectedDate = 'Custom';
                  });
                },
                text: 'Custom',
              ),
            ],
          ),
        ),
        const SizedBox(height: 44),
        const PieChartCard(
          paddingvalue: 0,
          degree: 60,
          text: 'Patients Ratio',
          dataMap: {'Repeated patients': 90, 'New patients': 10},
          colorList: [
            Color(0xff85F8D5),
            Color(0xff205C4C),
          ],
        ),
        const SizedBox(height: 28),
        const PieChartCard(
          paddingvalue: 60,
          degree: -120,
          text: 'Gender Ratio',
          dataMap: {'Other': 10, 'Female': 42, 'Male': 58},
          colorList: [
            Color(0xffe205C4C),
            Color(0xff85F8D5),
            Color(0xff44B092),
          ],
        ),
        const SizedBox(height: 28),
        buildBarChartCard(
          'Age group Analysis',
          {
            'Less than 15': 15,
            'Less than 40': 60,
            'Less than 60': 20,
            'More than 60': 5,
          },
          [
            const Color(0xff85F8D5),
            Colors.tealAccent,
            Colors.teal,
            const Color(0xff205C4C),
          ],
          25,
        ),
      ],
    );
  }
  void showSwitchClinicsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          width: 375,
          height: 280,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SELECT ANALYSIS',
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
                height: 9,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAnalysis = 'Patients Analysis';
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
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
                                'Patients Analysis',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 9,),
              const SizedBox(
                height: 9,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAnalysis = 'Appointments Analysis';
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
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
                                'Appointments Analysis',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 9,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAnalysis = 'Payments Analysis';
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
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
                                'Payment Analysis',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
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
  Widget _buildAppointmentsAnalysis() {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      bloc: _appointmentBloc,
      builder: (context, state) {
        if (state is AppointmentLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                buildDateOptions(),
                const SizedBox(height: 44),
                buildPieChartCard(
                    'Mode of consultation',
                    state.modeOfConsultationData,
                    const [
                      Color(0xff85F8D5),
                      Color(0xff205C4C),
                    ],
                    60,
                    0),
                buildPieChartCard(
                    'Appointments booking Analysis',
                    state.appointmentsBookingData,
                    const [Color(0xff85F8D5), Color(0xff205C4C)],
                    70,
                    0),
                buildPieChartCard(
                    'Appointments Analysis',
                    state.appointmentsAnalysisData,
                    const [
                      Color(0xff85F8D5),
                      Color(0xff205C4C),
                      Color(0xff44B092),
                    ],
                    120,
                    50),
              ],
            ),
          );
        } else if (state is AppointmentError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${state.errorMessage}'),
            ),
          );
        } else {
          // Loading state or initial state
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _buildPaymentsAnalysis() {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                DateCards(
                  isSelected: selectedDate == 'Today',
                  onTap: () {
                    setState(() {
                      selectedDate = 'Today';
                    });
                  },
                  text: 'Today',
                ),
                DateCards(
                  isSelected: selectedDate == 'Yearly',
                  onTap: () {
                    setState(() {
                      selectedDate = 'Yearly';
                    });
                  },
                  text: 'Yearly',
                ),
                DateCards(
                  isSelected: selectedDate == 'Monthly',
                  onTap: () {
                    setState(() {
                      selectedDate = 'Monthly';
                    });
                  },
                  text: 'Monthly',
                ),
                DateCards(
                  isSelected: selectedDate == 'Weekly',
                  onTap: () {
                    setState(() {
                      selectedDate = 'Weekly';
                    });
                  },
                  text: 'Weekly',
                ),
                DateCards(
                  isSelected: selectedDate == 'Custom',
                  onTap: () {
                    setState(() {
                      selectedDate = 'Custom';
                    });
                  },
                  text: 'Custom',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 60,
                color: const Color(0xffF5F5F5),
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 18, bottom: 10, left: 10, right: 30),
                  child: Text(
                    containerText,
                    style: GoogleFonts.montserrat(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  _copyToClipboard();
                },
                child: Container(
                  height: 60,
                  width: 95,
                  decoration: BoxDecoration(
                    color: const Color(0xff32856E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Copy',
                        style: GoogleFonts.montserrat(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Icon(
                        Icons.copy_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                if (showAnotherNumber) ...[
                  CustomTextField(
                    controller: additionalAnotherNumberController,
                    hintText: 'Additional another number',
                    height: 45,
                  ),
                  const SizedBox(height: 16),
                ],
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showAnotherNumber = true;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: AppColors.blueColor,
                          ),
                          Text(
                            'Add another number',
                            style: TextStyle(color: AppColors.blueColor),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 2,
                          width: screenSize.width * 0.5,
                          color: AppColors.blueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RevenueCard(
                desc: 'Total revenue collected',
                amnt: '5.2',
                value: 'K',
              ),
              RevenueCard(
                desc: 'Total money deposited in Bank',
                amnt: '5',
                value: 'K',
              ),
            ],
          ),
          const PieChartCard(
            paddingvalue: 60,
            degree: -120,
            text: 'Mode of payments',
            dataMap: {'Cash': 10, 'Card': 32, 'UPI': 58},
            colorList: [
              Color(0xff205C4C),
              Color(0xff85F8D5),
              Color(0xff44B092)
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          const PieChartCard(
            paddingvalue: 30,
            degree: 70,
            text: 'Payments Analysis',
            dataMap: {
              'Done': 90,
              'Pending': 10,
            },
            colorList: [
              Color(0xff85F8D5),
              Color(0xff205C4C),
            ],
          ),
          const SizedBox(
            height: 28,
          ),
        ],
      ),
    );
  }

  Widget buildDateOptions() {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dateOptions.length,
        itemBuilder: (context, index) {
          final dateOption = dateOptions[index];
          return DateCards(
            isSelected: selectedDate == dateOption,
            onTap: () {
              setState(() {
                selectedDate = dateOption;
              });
            },
            text: dateOption,
          );
        },
      ),
    );
  }

  Widget buildPieChartCard(String text, Map<String, double> dataMap,
      List<Color> colorList, double degree, double paddingValue) {
    if (dataMap.isNotEmpty) {
      return Column(
        children: [
          PieChartCard(
            paddingvalue: paddingValue,
            degree: degree,
            text: text,
            dataMap: dataMap,
            colorList: colorList,
          ),
          const SizedBox(height: 28),
        ],
      );
    } else {
      return Container();
    }
  }


  Widget buildBarChartCard(String text, Map<String, double> dataMap, List<Color> colorList, double paddingValue) {
    if (dataMap.isNotEmpty) {
      return Column(
        children: [
          BarChartCard(
            paddingvalue: paddingValue,
            text: text,
            dataMap: dataMap,
            colorList: colorList,
          ),
          const SizedBox(height: 28),
        ],
      );
    } else {
      return Container();
    }
  }
}



