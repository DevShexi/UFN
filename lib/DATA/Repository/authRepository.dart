import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {
  AuthenticationRepository();

  Future<String> getjwt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authResponse = prefs.getString("auth_response");
    final decodeData = json.decode(authResponse);
    return decodeData["session"]["jwt"];
  }

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  // Stream<User> get user {
  //   //Get User Logic Comes Here
  //   return null;
  // }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    final String loginUrl = "http://3.138.49.8:4000/api/v1/auth/attempt";
    final http.Response response = await http.post(
      loginUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, Map>{
          'session': {
            'username': "$email",
            'password': "$password",
            'device_type': 'android',
            'device_id': "DeviceTokenGeneratedViaFCM",
            'app': 'admin'
          }
        },
      ),
    );
    var decodeData = json.decode(response.body);
    try {
      if (response.statusCode == 200) {
        if (decodeData.containsKey("errors")) {
          return decodeData["errors"];
        } else {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("auth_response", response.body);
          return {"status": true};
        }
      } else if (response.statusCode == 422) {
        switch (decodeData["meta"]["status"]) {
          case "bad_password":
            {
              print("From BadPassword, Returned: ");
              print(decodeData['errors']);
              return decodeData["errors"];
            }
            break;
          case "not_found":
            {
              print("From Not Found, Returned: ");
              print(decodeData["errors"]);
              return decodeData["errors"];
            }
            break;
          default:
            return null;
        }
      } else {
        print('Login Failed');
        return null;
      }
    } catch (e) {
      print("Exception Caught while Auth Attempt: $e");
      return null;
    }
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
