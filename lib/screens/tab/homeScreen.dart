import 'package:flutter/material.dart';
import 'package:gkblab/global/app.dart';
import '../../services/authServices.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FingerAuth fingerAuth = FingerAuth();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(AppString.HomeTxt),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(AppString.FingerAuthTxt),
          onPressed: () async {
            if (await fingerAuth.isBiometricAvailable()) {
              await fingerAuth.authenticateUser(context, scaffoldKey.currentState);
            }
          },
        ),
      ),
    );
  }
}
