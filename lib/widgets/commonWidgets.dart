import 'package:flutter/material.dart';
import '../global/colors.dart';

SizedBox mySizedBox(
    {@required double myHeight, @required double myWidth, child}) {
  return SizedBox(
    height: double.parse("$myHeight"),
    width: double.parse("$myWidth"),
    child: child,
  );
}

showSnackbar(ScaffoldState key, String text, Color color) {
  key.showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: color ?? ColorPlate.RedColor,
  ));
}

Container txtFilled(
    {final String hint,
    final TextEditingController controller,
    final bool isSecured,
    final TextInputType keyBoard,
    final valid,
    final submit,
    final focusNode,
    final textInputAction,
    final prefixIcon,
    final autovalid,
    final maxLength,
    final suffixIcon,
    final maxLines}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: TextFormField(
      maxLines: maxLines ?? 1,
      style: TextStyle(color: ColorPlate.BlueColor),
      maxLength: maxLength,
      obscureText: isSecured == true ? true : false,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: submit,
      controller: controller,
      autovalidateMode: AutovalidateMode.always,
      validator: valid,
      cursorColor: ColorPlate.BlueColor,
      keyboardType: keyBoard,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: ColorPlate.RedColor),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPlate.BlueColor, width: 0.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPlate.BlueColor, width: 0.0),
        ),
        hintStyle: TextStyle(color: ColorPlate.BlueColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPlate.BlueColor, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPlate.BlueColor, width: 0.0),
        ),
        contentPadding: EdgeInsets.all(6),
        suffixIcon: suffixIcon,
        counterText: "",
        hintText: hint ?? "",
        border: OutlineInputBorder(),
        prefixIcon: prefixIcon,
      ),
    ),
  );
}

myAuthButton({Function onTapped, String label}) {
  return Padding(
    padding: EdgeInsets.only(top: 20, left: 40, right: 40),
    child: MaterialButton(
      splashColor: ColorPlate.BlackColor,
      color: ColorPlate.BlueColor,
      onPressed: onTapped ?? () {},
      child: myDataText(
        maxLines: 1,
        text: label,
        myTextStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 10,
      minWidth: 40,
      height: 50,
      textColor: ColorPlate.WhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}

Text myDataText({
  String text,
  @required int maxLines,
  TextStyle myTextStyle,
  TextAlign myTextAlign,
}) {
  return Text(
    text ?? "",
    maxLines: maxLines ?? 0,
    textAlign: myTextAlign,
    overflow: TextOverflow.ellipsis,
    style: myTextStyle,
  );
}
