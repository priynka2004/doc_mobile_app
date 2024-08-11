import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/provider/appointment_provider.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/provider/medications_provider.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/provider/symptoms_provider.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/service/medications_service.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/service/symptoms_service.dart';
import 'package:healtether_clinic_app/Screens/HomeScreen/page_view_screen.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/api/get_staff_service.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/provider/staff_provider.dart';
import 'package:healtether_clinic_app/Screens/Provider/appointmentdata.dart';
import 'package:healtether_clinic_app/Screens/loginpage/login_page.dart';
import 'package:healtether_clinic_app/Screens/patients_records/provider/patient_record_provider.dart';
import 'package:healtether_clinic_app/Screens/payment_records/api_service/payment_record_api.dart';
import 'package:healtether_clinic_app/Screens/payment_records/provider/payment_provider.dart';
import 'package:healtether_clinic_app/Screens/payments/bloc/payments_bloc.dart';
import 'package:healtether_clinic_app/providers/bloc/user_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/AppointmentAnalysis/appointment_analysis_bloc.dart';
import 'Screens/HomeScreen/patient_analysis.dart';
import 'Screens/patients_records/service/patient_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  bool isExpired = token != null ? JwtDecoder.isExpired(token) : true;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PaymentsBloc()),
        BlocProvider(create: (context) => AppointmentBloc(appointmentService)),
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: ChangeNotifierProvider(
        create: (context) => AppointmentData(),
        // child: MyApp(token: prefs.getString('token')),
        child: MyApp(isLoggedIn: token != null && !isExpired),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // final String? token;
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);
  // static Future<bool?> loggIn() async {
  //   return await SharedPrefService.getLogin();
  // }
  @override
  Widget build(BuildContext context) {
    Get.put(StaffServices());
    Get.put(PaymentService());
    Get.put(CreateSymptomsService());
    // Get.put(GetStaffService());
    //Get.put(PaymentService());
Get.put(GetPatientService());
    Get.put(MedicationsService());

    // Get.put(AppointmentService());
   // Get.put(PaymentService());
    //Get.put(AppointmentService());
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) {
      return StaffProvider();
    }),

          ChangeNotifierProvider(create: (context) {
            return AppointmentProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return PaymentProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return PatientRecordsProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return CreateSymptomsProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return MedicationsProvider();
          }),
        ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      // home: (token == null || JwtDecoder.isExpired(token!))
      //     ? LoginPage()
      //     : HomePageView(selectedIndex: 0,),
     // home: isLoggedIn ? HomePageView(selectedIndex: 0) : LoginPage(),
      home: HomePageView(selectedIndex: 0),
    )
    );
  }
}
