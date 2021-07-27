import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/user_model.dart';

class HomeView extends StatefulWidget {
  final UserModel user;
  HomeView({@required this.user});
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.user.email),
            Text(widget.user.token),
          ],
        ),
      ),
    );
  }
}
