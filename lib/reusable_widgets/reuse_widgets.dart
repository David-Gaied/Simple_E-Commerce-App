import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart'as http;

final  emailvalidator = MultiValidator([
  EmailValidator(errorText: "Email Format is not valid"),
  RequiredValidator(errorText: "Email is Required")
]);
final passwordvalidator = MultiValidator([
  RequiredValidator(errorText: "Password is Required"),
  MinLengthValidator(8, errorText: "Password must contain at least 8 charachter"),
  PatternValidator(r'(?=.*?[!@#\$&*~])', errorText: "Password must contain at least one special charachter")

]);

sizeBox(double height) => SizedBox(height: height,);
InputDecoration buildInputDecorationEmail( labelText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0)),
    labelText: labelText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}
InputDecoration buildInputDecorationPassword( labelText,IconData iconPre, IconData iconSuf ) {
  return InputDecoration(
    prefixIcon: Icon(iconPre, color: Color.fromRGBO(50, 62, 72, 1.0)),
    suffixIcon: Icon(iconSuf, color: Color.fromRGBO(50, 62, 72, 1.0)),
    labelText: labelText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}

var emailControler = TextEditingController();
var passwordControler = TextEditingController();
var nameControler = TextEditingController();
