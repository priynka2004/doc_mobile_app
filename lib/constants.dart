class ApiEndPoint {
  static const String baseUrl = "https://api-uhi.azurewebsites.net/api/";
  static const String getStaff =
      'https://api-uhi.azurewebsites.net/api/staff/getstaffs?clientId=662ca0a41a2431e16c41ebaa';
  static const String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NDc3OWFjNTU0NTE1YzQ3ZTNiODkwZCIsImlhdCI6MTcxODc3MjEyMiwiZXhwIjoxNzE4OTQ0OTIyfQ.4OAsJdJ5objvjgjIOh4XeCtv0VDat968W1O2pwhfn9s';

  // static const String getStaff =
  //     'https://api-uhi.azurewebsites.net/api/staff/getstaffs?clientId=662ca0a41a2431e16c41ebaa&page=0&size=5&sortby=mobile&direction=desc';
  static String getAppointment() =>
      'https://api-uhi.azurewebsites.net/api/appointment/getappointments?clinicId=662ca0a41a2431e16c41ebaa';

  // static String getStaffUrl(GetStaffRequest request) {
  //   return '${baseUrl + getStaff}?clientId=${request.clientId}&page=${request.page}&size=${request.size}';
  // }
  static const String getPatient =
      "https://api-uhi.azurewebsites.net/api/patient/getpatients?clientId=662ca0a41a2431e16c41ebaa";
  static const String getPayment =
      "https://api-uhi.azurewebsites.net/api/payment/getpayments?clientId=662ca0a41a2431e16c41ebaa";

  static const String deleteStaff =
      'https://api-uhi.azurewebsites.net/api/staff/deletestaff?id=667ff3491df20679bd2ae673';
  static const String createStaff =
      'https://api-uhi.azurewebsites.net/api/staff/upsert?';

  static const String postPatient =
      "https://api-uhi.azurewebsites.net/api/patient/addpatient";

  static const String postMedicationDdx =
      "http://13.126.139.115:8000/ddx/medications";
  static const String createSymptoms = "http://13.126.139.115:8000/ddx/search";



}
