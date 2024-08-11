import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/model/create_medications_model.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/service/medications_service.dart';

class MedicationsProvider with ChangeNotifier {
  CreateMedications? createMedications;
  List<String> selectedDiagnoses = [];
  int nMedications = 0;
  bool isLoading = false;
  String? errorMessage;
  CreateMedications? medicationResponse;

  void updateDiagnoses(List<String> diagnoses) {
    selectedDiagnoses = diagnoses;
    notifyListeners();
  }

  void updateNMedications(int count) {
    nMedications = count;
    notifyListeners();
  }

  Future<void> createMedication() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    CreateMedications medications = CreateMedications(
      selectedDiagnoses: selectedDiagnoses,
      nMedications: nMedications,
    );

    try {
      MedicationsService medicationsService = Get.find();
      CreateMedications? response = await medicationsService.createMedications(medications);
      if (response != null) {
        medicationResponse = response;
      } else {
        errorMessage = 'Failed to create medications';
      }
    } catch (e) {
      errorMessage = 'Error: $e';
      print(errorMessage);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
