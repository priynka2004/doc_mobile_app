import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtether_clinic_app/Screens/patients_records/model/patient_model.dart';
import 'package:healtether_clinic_app/Screens/patients_records/model/patient_response_model.dart';
import 'package:healtether_clinic_app/Screens/patients_records/model/post/create_patient_response_model.dart';
import 'package:healtether_clinic_app/Screens/patients_records/model/post/patient_create_model.dart';
import 'package:healtether_clinic_app/Screens/patients_records/service/patient_service.dart';

class PatientRecordsProvider extends ChangeNotifier {
  List<PatientModel> patients = [];
  int totalCount = 0;
  bool isLoading = false;
  String? errorMessage;

  PatientCreate? patientCreate;

  void fetchPatients() async {
    isLoading = true;
    notifyListeners();
    try {
      GetPatientService service = Get.find();
      PatientResponse getPatient = await service.fetchPatients();
      patients = getPatient.data ?? [];
      totalCount = getPatient.totalCount ?? 0;
    } catch (error) {
      print('Failed to load patients: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deletePatient(String id) async {
    try {
      GetPatientService service = Get.find();
      await service.deletePatient(id);
      patients.removeWhere((patient) => patient.id == id);
      notifyListeners();
    } catch (error) {
      print('Failed to delete patient: $error');
      throw Exception('Failed to delete patient');
    }
  }

  Future<void> postPatient(PatientCreate patientCreate) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      GetPatientService getPatientService = Get.find();
      patientCreate = await getPatientService.postPatient(patientCreate);
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
