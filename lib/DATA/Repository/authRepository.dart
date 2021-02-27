import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {
  AuthenticationRepository();

  Future<String> getToken() async {
    final String authURL =
        'http://134.122.14.40:8080/iteam/services/MDB/authenticate';
    final http.Response response = await http.post(authURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'application/json',
        },
        body: '{"username": "mnoman", "password": "Temp/mnoman123"}');
    var decodeData = json.decode(response.body);
    return decodeData['token'];
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String authResponse = prefs.getString("auth_response");
    // final decodeData = json.decode(authResponse);
    // return decodeData["session"]["jwt"];
  }

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  // Stream<User> get user {
  //   //Get User Logic Comes Here
  //   return null;
  // }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    print('Email: $email \n Password: $password');
    final String token = await getToken();
    final String jsonBody = '{"email": "$email", "password": "$password"}';
    final String loginUrl =
        "http://134.122.14.40:8080/iteam/services/UFN/getUsers";
    final http.Response response = await http.post(loginUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonBody);
    print(response.statusCode);
    var decodeData = json.decode(response.body);
    // print(decodeData['users'][0]['password']);
    Map authStatus = {
      "userFound": null,
      "passwordMatched": null,
      "message": null
    };
    try {
      if (response.statusCode == 200) {
        if (decodeData['users'] == null) {
          authStatus = {
            "userFound": false,
            "passwordMatched": null,
            "message": "No User Exists for the specified Email"
          };
        } else if (decodeData['users'].length == 1 &&
            decodeData['users'][0]['password'] != password) {
          authStatus = {
            "userFound": true,
            "passwordMatched": false,
            "message": "Your Password is incorrect"
          };
        } else
          authStatus = {
            "userFound": true,
            "passwordMatched": true,
            "message": "User Logged In Successfully"
          };
      }
    } catch (e) {
      print('Exception Caught on Login Request: $e');
    }
    print(authStatus);
    return {
      "userFound": authStatus['userFound'],
      "passwordMatched": authStatus['passwordMatched'],
      "message": authStatus['message']
    };
  }

//   Future<bool> logout() async {
//     final String revokeUrl = "http://3.138.49.8:4000/api/v1/auth/revoke";
//     final String jwt = await getjwt();
//     final http.Response response = await http.post(
//       revokeUrl,
//       headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//         HttpHeaders.authorizationHeader: "T $jwt",
//       },
//     );
//     bool revoked;
//     try {
//       if (response.statusCode == 200) {
//         final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         _googleSignIn.disconnect();
//         prefs.clear();
//         revoked = true;
//         print("Logout Sucess");
//       } else {
//         revoked = false;
//       }
//     } catch (e) {
//       print(
//           "Following Exception was Caught When the User Tried to SignOut: $e");
//       revoked = false;
//     }
//     return revoked;
//   }

//   Future<String> googleAuth() async {
//     final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
//     final googleUser = await _googleSignIn.signIn();
//     final googleAuth = await googleUser.authentication;
//     final String loginUrl = "http://3.138.49.8:4000/api/v1/auth/google_login";
//     String authenticationStatus;
//     final http.Response response = await http.post(
//       loginUrl,
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(
//         <String, Map>{
//           "google": {
//             "id_token": googleAuth.idToken,
//             "device_type": "android",
//             "device_id": "DeviceTokenGeneratedViaFCM",
//             "app": "customer"
//           }
//         },
//       ),
//     );
//     print(response.body);
//     try {
//       if (response.statusCode == 200) {
//         // var decodeData = json.decode(response.body);
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setString("auth_response", response.body);
//         authenticationStatus = "authenticated";
//       } else {
//         authenticationStatus = "unauthenticated";
//       }
//     } catch (e) {
//       print("Exception Caused while Authenticating User from backend: $e");
//       authenticationStatus = "unauthenticated";
//     }
//     return authenticationStatus;
//   }
}
