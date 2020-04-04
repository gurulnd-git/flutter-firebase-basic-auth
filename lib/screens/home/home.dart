import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp/services/authService.dart';
import 'package:temp/services/dbService.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: Text("hi tre"),
        );
      });
    }
    
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
          FlatButton.icon(
            icon: Icon(Icons.settings),
            label: Text('settings'),
            onPressed: () => _showSettingsPanel(),
          )
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Text("Let's Do it!!")
      ),
    );

  }
}
