import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtether_clinic_app/models/user_model/user_model.dart';
import 'package:healtether_clinic_app/providers/bloc/user_bloc.dart';
import 'package:healtether_clinic_app/utils/save_token.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<String> loginUser(String phone, String password,BuildContext context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      var response = await http.post(
          Uri.parse("https://api-uhi.azurewebsites.net/api/authlogin"),
          body: {"emailOrPhone": phone, "password": password});
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      var result = jsonDecode(response.body);
      if (kDebugMode) {
        print("Result: $result");
      }

      if (result['success'] == true) {

        UserModel user =UserModel.fromJson(result['user']);

        if (kDebugMode) {
          print( user);
        }

       UserBloc bloc=BlocProvider.of<UserBloc>(context,listen: false);
       bloc.user=user;
        //    // prefs.setString("token", result['token']);
        //     String accessToken = result['access'];
        //     await SharedPrefService.setAccessToken(accessToken);
        //     return "Login Success";
        //   } else {
        //     print(response.body);
        //     return result['message'];
        //   }
        // } catch (e) {
        //   return e.toString();
        // }
        String accessToken = result['token'];
        if (kDebugMode) {
          print("Access Token: $accessToken");
        }


        if (accessToken != null && accessToken.isNotEmpty) {
          await SharedPrefService.setAccessToken(accessToken);
          prefs.setString('token', accessToken);
          if (kDebugMode) {
            print("Access Token saved successfully");
          }
          return "Login Success";
        } else {
          return "Access token is null";
        }
      } else {
        if (kDebugMode) {
          print(response.body);
        }
        return result['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }

  static const _key = 'token';

  static Future<void> deleteLoginToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

}
// class AuthService {
//   static Future<String> loginUser(
//       String phone, String password, BuildContext context) async {
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//       var response = await http.post(
//           Uri.parse("https://api-uhi.azurewebsites.net/api/authlogin"),
//           body: {"emailOrPhone": phone, "password": password});
//
//       print("Response status: ${response.statusCode}");
//       print("Response body: ${response.body}");
//
//       if (response.statusCode == 200) {
//           var result = jsonDecode(response.body);
//           print("Result: $result");
//
//           if (result['success'] == true) {
//             UserModel user = UserModel.fromJson(result['user']);
//             print(user);
//
//             UserBloc bloc = BlocProvider.of<UserBloc>(context, listen: false);
//             bloc.user = user;
//
//             String accessToken = result['token'];
//             print("Access Token: $accessToken");
//
//             if (accessToken != null && accessToken.isNotEmpty) {
//               await SharedPrefService.setAccessToken(accessToken);
//               prefs.setString('token', accessToken);
//               print("Access Token saved successfully");
//               return "Login Success";
//             } else {
//               return "Access token is null";
//             }
//           } else {
//             print(response.body);
//             return result['message'];
//           }
//       } else {
//         print("Error: ${response.statusCode}");
//         return "Failed to login. Please try again.";
//       }
//     } catch (e) {
//       return e.toString();
//     }
//   }
//
//   static const _key = 'token';
//
//   static Future<void> deleteLoginToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_key);
//   }
// }
