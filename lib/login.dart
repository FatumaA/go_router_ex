import 'dart:async';
import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import 'login_info.dart';
import 'user.model.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

// final List<User> users = [];

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  setUserTimer(bool val) {
    print('Bool check: $val');
    return Timer(const Duration(seconds: 5), () {
          val = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final login = LoginInfo();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Router Demo'),
      ),
      body: Center(
        child: Container(
          width: 800,
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !EmailValidator.validate(_email.text)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email',
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: _email,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        try {
                          // setState(() {
                            var newUser = User(_email.text);
                            // User(_email.text, true, setUserTimer(true));
                            LoginInfo().login(newUser);
                            // login.loggedIn;
                          // });            
                          print(newUser);
                          
                          // context.go('/home');
                        } catch (e) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                contentPadding: const EdgeInsets.all(16),
                                backgroundColor: Colors.grey[800],
                                title: const Text(
                                  'Oops something went wrong',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white70,
                                  ),
                                ),
                                content: Text(
                                  e.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white60,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text(
                                      'Got it',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                          _email.text = '';
                          _password.text = '';
                        }
                      } 
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
