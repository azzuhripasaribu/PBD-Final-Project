import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:final_project/page/drawer.dart';

  
class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool hidePassword = true;
  void togglePasswordView() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  final _formKey = GlobalKey<FormState>();

  String username = "";
  String password1 = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Color.fromARGB(255, 226, 77, 124),
      ),
      drawer: myDrawer(context),
      body:Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 40
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "User Name",
                          labelText: "User Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Behavior when data is typed
                        onChanged: (String? value) {
                          setState(() {
                            username = value!;
                          });
                        },
                        // Behavior when data is Saved
                        onSaved: (String? value) {
                          setState(() {
                            username = value!;
                          });
                        },
                        // Validator as form validation
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your username';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Behavior when data is typed
                        onChanged: (String? value) {
                          setState(() {
                            password1 = value!;
                          });
                        },
                        // Behavior when data is Saved
                        onSaved: (String? value) {
                          setState(() {
                            password1 = value!;
                          });
                        },
                        // Validator as form validation
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your password1';
                          }
                          return null;
                        },
                      
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final response = await request.login("https://midterm-project-pbp.up.railway.app/auth/json", {
                          'username': username,
                          'password': password1,
                        });
                        if (request.loggedIn) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('You have successfully logged in')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Wrong Username or password')),
                          );
                        }
                      }, 
                      child: const Text('Login')
                    )
                  ]
                ),
              ), 
            ),
          ),
        ]
      ),
    );
  }
}