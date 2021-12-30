import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:test_crud/log_reg/register.dart';
import 'package:test_crud/reusable_widgets/reuse_widgets.dart';
import 'package:test_crud/screens/user_profile.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // var emailControler = TextEditingController();
  // var passwordControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future login() async {
    if (emailControler.text.isNotEmpty && passwordControler.text.isNotEmpty) {
      var response;
      try {
        var client = http.Client();
        // he do it to show what's wrong
        // print({
        //   "email": emailControler.text,
        //   "name": nameControler.text,
        //   "password": passwordControler.text
        // });
        response = await client.post(
            Uri.parse('http://192.168.1.38:8000/api/login'),
            headers: <String, String>{},
            body: {
              "email": emailControler.text,
              "password": passwordControler.text
            });
      } catch (e, trace) {
        log(e.toString());
        log(trace.toString());
      }

      print("I am here register");

      log("response.body");
      log(response.body);
      log("response.statusCode");
      log(response.statusCode.toString());
      //
      // if(response.statusCode==200){
      // print(response.body);
      // return User.fromJson(json.decode(response.body));
      // }else{
      // print(response.body);
      // throw Exception(response.statusCode);
      // }

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Splash()),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid")));
      }

      // );

    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizeBox(15.0),
                    Text("Email"),
                    sizeBox(5.0),
                    TextFormField(
                      controller: emailControler,
                      autofocus: false,
                      validator: emailvalidator,
                      onSaved: (val) {
                        if (val == null) {
                          return;
                        }
                      },
                      decoration: buildInputDecorationEmail(
                          "Email Adress", Icons.email),
                    ),
                    sizeBox(20.0),
                    Text("Password"),
                    sizeBox(15.0),
                    TextFormField(
                      controller: passwordControler,
                      autofocus: false,
                      validator: passwordvalidator,
                      decoration: buildInputDecorationPassword(
                          "Enter your password",
                          Icons.lock,
                          Icons.remove_red_eye),
                      obscureText: true,
                    ),
                    sizeBox(10.0),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Splash()));
                            if(_formKey.currentState!.validate())
                            {
                              login();
                            }

                            // else {
                            //   Flushbar(
                            //     title: "Invalid process",
                            //     message: "Please Complete the form proper",
                            //     duration: Duration(seconds: 4),
                            //
                            //   ).show(context);
                            // }
                          },
                          child: Text("Login")),
                    ),
                    sizeBox(5.0),
                    TextButton(
                      child: const Text("Forgot password?",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      onPressed: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("If you don\'t have an account ?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text("Sing Up"))
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
