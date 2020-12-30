import 'package:flutter/material.dart';
import 'package:gkblab/global/app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/screenUtils.dart';
class LogoutScreen extends StatefulWidget {
  @override
  _LogoutScreenState createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.LogoutTxt),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(AppString.LogoutTxt),
          onPressed: () async {
            nextScreenReplace(context, "/Login");
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.clear();
          },
        ),
      ),
    );
  }
}
