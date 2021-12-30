import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_crud/log_reg/login.dart';
import 'package:test_crud/reusable_widgets/reuse_widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  Future register() async {
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
            Uri.parse('http://192.168.1.38:8000/api/register'),
            headers: <String, String>{
            },
            body: {
              "email": emailControler.text,
              "name": nameControler.text,
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
          MaterialPageRoute(builder: (context) => Login()),
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
          title: const Text("Registrations Page"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: formKey,
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
                      decoration: buildInputDecorationEmail(
                          "Email Adress", Icons.email),
                    ),
                    sizeBox(5.0),

                    Text("Name"),
                    sizeBox(5.0),
                    TextFormField(
                      controller: nameControler,
                      autofocus: false,
                      decoration: buildInputDecorationEmail(
                          "Enter your Name", Icons.email),
                    ),
                    sizeBox(5.0),
                    const Text("Password"),
                    sizeBox(5.0),
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
                    // const Text("Confirm Password"),
                    // sizeBox(15.0),
                    // TextFormField(
                    //   autofocus: false,
                    //   validator: passwordvalidator,
                    //   onSaved: (val) => _confirmPassword = val,
                    //   decoration: buildInputDecorationPassword(
                    //       "Confirm Your Password",
                    //       Icons.lock,
                    //       Icons.remove_red_eye),
                    //   obscureText: true,
                    // ),
                    // sizeBox(10.0),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                await register();
                              } catch (e) {
                                log(e.toString());
                              }
                            }

                            // 1- call api request to server
                            // 2- add data to request
                            // 3- receive response and check if success
                          },
                          child: Text("Register")),
                    ),
                    sizeBox(5.0),
                    TextButton(
                      child: const Text("Forgot password?",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      onPressed: () {
                        //Navigator.pushReplacementNamed(context, '/reset-password');
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("If you have already account ?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            },
                            child: Text("Login"))
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

//   _submit() {
//     // username
//     // password
//     http.
//   }
// }
