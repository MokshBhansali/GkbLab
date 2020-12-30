import 'package:flutter/material.dart';
import '../global/images.dart';
import '../utils/screenUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var email;

  AnimationController animationController;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    getUserMail();
    startAnimation();
  }

  getUserMail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email");
    setState(() {});
  }

  startAnimation() {
    animationController =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    animation = Tween<double>(begin: 0, end: 1.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
    animation.addStatusListener((AnimationStatus status) async {
      if (status == AnimationStatus.completed) {
        email == null
            ? nextScreenReplace(context, "/Login")
            : nextScreenReplace(context, "/Main");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: animation.value,
          duration: Duration(milliseconds: 3000),
          child: Image.asset(MyImage.AppLogo, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
