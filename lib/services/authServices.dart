import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gkblab/global/colors.dart';
import 'package:http/http.dart' as http;
import '../models/userModels.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/screenUtils.dart';
import 'package:local_auth/local_auth.dart';
import '../widgets/commonWidgets.dart';

getUsersLogin(email, password, context, key) async {
  String url = "https://api.mocki.io/v1/b4209c6d";
  var responce = await http.get(url);
  var result = json.decode(responce.body);
  if (result["data"]["success"] == true) {
    Data.fromJson(result["data"]);
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('email', result["data"]['email']);
    await sp.setString('lastName', result["data"]['last_name']);
    await sp.setString('firstName', result["data"]['first_name']);
    nextScreenReplace(context, "/Home");
  } else {
    showSnackbar(key, "User Not Found", ColorPlate.RedColor);
  }
}

class FingerAuth {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  Future<bool> isBiometricAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    isAvailable
        ? print('Biometric is available!')
        : print('Biometric is unavailable.');
    return isAvailable;
  }

  Future<void> authenticateUser(context, key) async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: "Please authenticate to login",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    isAuthenticated
        ? print('User is authenticated!')
        : print('User is not authenticated.');
    if (isAuthenticated) {
      nextScreenReplace(context, "/Home");
    } else {
      showSnackbar(key, "Invalid Fingerprint", ColorPlate.RedColor);
    }
  }
}
