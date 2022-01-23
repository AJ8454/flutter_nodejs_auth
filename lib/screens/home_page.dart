import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emailFieldValue;
  var passwordFieldvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NodeJS Auth"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                  onChanged: (value) {
                    emailFieldValue = value;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      ))),
                  onChanged: (value) {
                    passwordFieldvalue = value;
                  },
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () => signup(
                    email: emailFieldValue,
                    password: passwordFieldvalue,
                  ),
                  child: const Text("Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  signup({String? email, String? password}) async {
    var url = "http://192.168.0.104/signup";
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email!,
        'password': password!,
      }),
    );

    log(response.body);

    // if (response.statusCode == 201) {
    // } else {}
  }
}
