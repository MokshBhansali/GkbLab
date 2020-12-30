import 'package:flutter/material.dart';
import 'package:gkblab/global/app.dart';
import 'package:gkblab/global/images.dart';
import 'package:gkblab/utils/screenUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String email, firstName, lastName;
  @override
  void initState() {
    super.initState();
    getUsersData();
  }

  getUsersData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email");
    firstName = sp.getString("firstName");
    lastName = sp.getString("lastName");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.ProfileTxt),
      ),
      body: Container(
        height: getScrennheight(context, 1.0),
        width: getScreenWidth(context, 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(MyImage.AppLogo,
                fit: BoxFit.fill, height: getScrennheight(context, .3)),
            Container(
              margin: EdgeInsets.all(40),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Email: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(email ?? ""),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "FirstName: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(firstName ?? ""),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Last Name: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(lastName ?? ""),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
