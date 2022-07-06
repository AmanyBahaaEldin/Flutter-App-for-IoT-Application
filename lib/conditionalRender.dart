import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproject/MQTTAppState.dart';
import 'package:testproject/Home.dart';
import 'package:testproject/Login.dart';

 class IsLogged extends StatefulWidget {
  const IsLogged({ Key? key }) : super(key: key);

  @override
  State<IsLogged> createState() => _IsLoggedState();
}

class _IsLoggedState extends State<IsLogged> {
     late MQTTAppState currentAppState;

  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    // Keep a reference to the app state.
    currentAppState = appState;
    return currentAppState.getId == -1? Login():Home();
  }
}