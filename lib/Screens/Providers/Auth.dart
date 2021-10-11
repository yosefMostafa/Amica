import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token = '';
  DateTime _expiryDate = DateTime.utc(2000);
  String _userid = '';
  String temptoken = '';

  bool get isAuth {
    return _token != '';
  }

  String get token {
    if (_expiryDate.isAfter(DateTime.utc(2000)) &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != '') {
      return _token;
    }
    return '';
  }

  Future<void> _authenticate(
      String email, String password, String urlseg) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlseg?key=AIzaSyBqjG1DTr7Y-ZaJJ05yzxaty6-9GxMgDv8';
    try {
      final res = await http.post(Uri.parse(url),
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));

      final data = json.decode(res.body);

      if (data['error'] != null) {
        final error = data['error']['message'].toString();

        if (error.contains('EMAIL_EXISTS')) {
          throw 'This email already in use';
        } else if (error.contains('INVALID_EMAIL')) {
          throw 'This is not a valid email address';
        } else if (error.contains('WEAK_PASSWORD')) {
          throw 'Weak password';
        } else if (error.contains('EMAIL_NOT_FOUND')) {
          throw 'Could not find a user with this email';
        } else if (error.contains('INVALID_PASSWORD')) {
          throw 'Invalid password';
        } else {
          throw "AUTHENTICATION FAILED";
        }
      } else {
        if (urlseg != "signUp") {
          bool verified = await confirmverfication(data['idToken']);
          if (verified) {
            _token = data['idToken'];
            _userid = data['localId'];
            _expiryDate = DateTime.now()
                .add(Duration(seconds: int.parse(data['expiresIn'])));
            notifyListeners();
          } else {
            throw "Please verify your email";
          }
        } else {
          temptoken = data['idToken'];
          Verify("VERIFY_EMAIL", temptoken);
        }
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> Sign_up(String email, String password) {
    return _authenticate(email, password, "signUp");
  }

  // Future<void> getoobcode(String email) async {
  //   final url =
  //       'https://www.googleapis.com/identitytoolkit/v3/relyingparty/getOobConfirmationCode?key=AIzaSyBqjG1DTr7Y-ZaJJ05yzxaty6-9GxMgDv8';
  //   try {
  //     final res = await http.post(Uri.parse(url),
  //         body: json.encode({
  //           "kind": "identitytoolkit#relyingparty",
  //           "requestType": "VERIFY_EMAIL",
  //           "email": email,
  //           "idToken": temptoken,
  //         }));
  //     print(json.decode(res.body));
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<void> Verify(String reqtype, String token) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyBqjG1DTr7Y-ZaJJ05yzxaty6-9GxMgDv8';
    try {
      final res = await http.post(Uri.parse(url),
          body: json.encode({
            "requestType": reqtype,
            'idToken': token,
          }));
    } catch (e) {
      throw e;
    }
  }

  Future<bool> confirmverfication(String token) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=AIzaSyBqjG1DTr7Y-ZaJJ05yzxaty6-9GxMgDv8';
    try {
      final res = await http.post(Uri.parse(url),
          body: json.encode({
            "idToken": token,
          }));
      final body = json.decode(res.body);

      return body['users'][0]['emailVerified'];
    } catch (e) {
      throw e;
    }
  }

  Future<void> Deleteaccounttemp() async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:delete?key=AIzaSyBqjG1DTr7Y-ZaJJ05yzxaty6-9GxMgDv8';
    try {
      final res = await http.post(Uri.parse(url),
          body: json.encode({
            "idToken": temptoken,
          }));
      temptoken = '';
    } catch (e) {
      throw e;
    }
  }

  Future<void> Sign_in(String email, String password) {
    return _authenticate(email, password, "signInWithPassword");
  }

  logout() {
    _token = '';
    _userid = '';
    _expiryDate = DateTime.utc(2000);
    notifyListeners();
  }
}
