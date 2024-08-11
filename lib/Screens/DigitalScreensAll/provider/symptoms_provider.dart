import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/model/create_symptoms_model.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/service/symptoms_service.dart';

class CreateSymptomsProvider extends ChangeNotifier {
  CreateSymptoms? createSymptoms;
  String? errorMessage;

  List<String> symptomsList = [];
  List<String> diagnosesList = [];

  Future<void> postCreateSymptoms(
    String searchText,
    List<String> selectedSymptoms,
    List<String> selectedDiagnoses,
  ) async {
    try {
      CreateSymptomsService createSymptomsService = Get.find();
      final result = await createSymptomsService.createSymptoms(
          searchText, selectedSymptoms, selectedDiagnoses);
      symptomsList = result['symptoms'] ?? [];
      diagnosesList = result['diagnoses'] ?? [];
      errorMessage = null;
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      notifyListeners();
    }
  }
}
