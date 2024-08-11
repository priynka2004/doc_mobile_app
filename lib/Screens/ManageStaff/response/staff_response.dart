import 'package:healtether_clinic_app/Screens/ManageStaff/model/get_staff_response_model.dart';

class ProductResponse {
  List<GetStaffResponse> products = [];
  ProductResponse({required this.products});

  factory ProductResponse.fromJson(List<dynamic> json) {
    List<GetStaffResponse> productList = [];
    for (var productJson in json) {
      productList.add(GetStaffResponse.fromJson(productJson));
    }
    return ProductResponse(products: productList);
  }
}


