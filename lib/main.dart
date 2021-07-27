import 'package:flutter/material.dart';
import 'package:flutter_application_2/interfaces/login_interface.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:flutter_application_2/services/login_service.dart';
import 'package:flutter_application_2/views/home/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ILogin _login = LoginService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: 'e-mail'),
                      textInputAction: TextInputAction.next,
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(hintText: 'password'),
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () async {},
                    ),
                    TextButton(
                        onPressed: () async {
                          UserModel user = await _login.login(
                              _emailController.text, _passwordController.text);

                          print(user.token);
                        },
                        child: Text("Login"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
