import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp/models/user.dart';
import 'package:temp/screens/wrapper.dart';
import 'package:temp/services/authService.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
