import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:healtether_clinic_app/models/patient/patient_model.dart';
import 'package:healtether_clinic_app/services/patients/patient_api.dart';
import 'package:meta/meta.dart';

part 'patient_records_event.dart';

part 'patient_records_state.dart';

class PatientRecordsBloc
    extends Bloc<PatientRecordsEvent, PatientRecordsState> {
  PatientRecordsBloc() : super(PatientRecordsInitial()) {
    on<LoadPatientRecordsEvent>(loadPatientRecordsEvent);
    on<LoadPatientFullRecordEvent>(loadPatientFullRecordEvent);
  }

  FutureOr<void> loadPatientRecordsEvent(
      LoadPatientRecordsEvent event, Emitter<PatientRecordsState> emit) async {
    emit(PatientRecordsLoadingState());

    print("process started");
    try {
      List<dynamic> patients = await PatientApi.getPatent(event.id);

      if (patients.isNotEmpty) {
        emit(PatientRecordLoadedState(patients: patients));
      } else {
        emit(PatientRecordLoadFailedState(
            error: "Unable to Fetch Patient Records"));
      }
    } catch (e) {
      emit(PatientRecordLoadFailedState(error: e.toString()));
    }
  }

  FutureOr<void> loadPatientFullRecordEvent(LoadPatientFullRecordEvent event,
      Emitter<PatientRecordsState> emit) async {
    try {
      emit(LoadingFullRecordState());

      PatientModel? patient = await PatientApi.getFullPatientRecord(event.id);

      if (patient != null) {
        emit(SinglePatientRecordLoadedstate(patient: patient));
      } else {
        emit(SinglePatientFullRecordLoadFailedState());
      }
    } catch (e) {
      emit(SinglePatientFullRecordLoadFailedState());
    }
  }
}
