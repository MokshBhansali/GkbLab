import 'package:flutter/material.dart';
import '../global/app.dart';
import '../global/colors.dart';
import '../global/images.dart';
import '../widgets/commonWidgets.dart';
import '../utils/screenUtils.dart';
import '../services/authServices.dart';
// import '../';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  bool isSecured = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(MyImage.AppLogo, fit: BoxFit.fill),
                mySizedBox(myHeight: getScrennheight(context, .08), myWidth: 0),
                txtFilled(
                  autovalid: true,
                  controller: loginEmailController,
                  focusNode: focusNode1,
                  textInputAction: TextInputAction.next,
                  valid: (val) {
                    return val.length < 1
                        ? null
                        : val.contains(AppString.ContainsATTxt)
                            ? null
                            : AppString.ValidEmailTxt;
                  },
                  hint: AppString.EmailTxt,
                  prefixIcon:
                      Icon(Icons.person_outline, color: ColorPlate.BlueColor),
                  submit: (term) {
                    focusNode1.unfocus();
                    FocusScope.of(context).requestFocus(focusNode2);
                  },
                ),
                txtFilled(
                  autovalid: true,
                  controller: loginPasswordController,
                  focusNode: focusNode2,
                  textInputAction: TextInputAction.done,
                  valid: (val) {
                    return val.length < 1
                        ? null
                        : val.length < 5
                            ? AppString.ValidPasswordTxt
                            : null;
                  },
                  hint: AppString.PasswordTxt,
                  isSecured: isSecured ? true : false,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: ColorPlate.BlueColor,
                  ),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      isSecured ? Icons.visibility : Icons.visibility_off,
                      color: ColorPlate.BlueColor,
                    ),
                    onTap: () {
                      isSecured = !isSecured;
                      setState(() {});
                    },
                  ),
                ),
                myAuthButton(
                  label: "Login",
                  onTapped: () {
                    getSignIn();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getSignIn() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate() && getMyemail()) {
      getUsersLogin(
          loginEmailController.text.trim(),
          loginPasswordController.text.trim(),
          context,
          _scaffoldKey.currentState
          );
    } else {
      showSnackbar(_scaffoldKey.currentState, AppString.ValueNullTxt,
          ColorPlate.BlueColor);
    }
  }

  bool getMyemail() {
    if (loginEmailController.text.contains(AppString.ContainsATTxt) &&
        loginPasswordController.text.length >= 5)
      return true;
    else
      return false;
  }
}
