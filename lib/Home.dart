import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproject/MQTTAppState.dart';
import 'package:testproject/MQTTManager.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // return _MQTTViewState();/
    return _HomeState();
  }
}





class _HomeState extends State<Home> {
  
 late MQTTAppState currentAppState;
  late MQTTManager manager;

  List<String> lightImages = ['images/lightOff.jpg','images/lightOn.jpg'];
  
  @override
  Widget build(BuildContext context) {
   
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    // Keep a reference to the app state.
    currentAppState = appState;
    //  _configureAndConnect();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Power Management Home'),
          centerTitle: true,
          leading: Icon(Icons.home),
          backgroundColor: Color.fromARGB(255, 43, 131, 47),
          elevation: 10,
          shadowColor: Color.fromARGB(255, 8, 61, 39),
        ),
        body: Container(color:Color.fromARGB(255, 233, 193, 132),width: double.infinity,height: double.infinity,
                child: Column(children: [
                  Row(
                    children: [
                       Expanded(flex: 1, child: Container(height: 200, width: 200, margin: EdgeInsets.all(10), decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage((lightImages[currentAppState.getLight])))
                         ), ))
                 ],
                  )
                ],)
              ),
              
              bottomNavigationBar: Container(
                height: 35, color: Colors.yellow,
              ),
      ),
      debugShowCheckedModeBanner: false,
    );
    
  }
  // void _configureAndConnect() {
  //   // ignore: flutter_style_todos
  //   // TODO: Use UUID
  //   String osPrefix = 'Flutter_iOS';
  //   if (Platform.isAndroid) {
  //     osPrefix = 'Flutter_Android';
  //   }
  //   manager = MQTTManager(
  //       host : "learning.masterofthings.com",
  //       topic : "iot_intake42/ITI/microwaveTimer/1",
  //       identifier: osPrefix,
  //       state: currentAppState);
  //   manager.initializeMQTTClient();
  //   manager.connect();
  // }

  void _disconnect() {
    manager.disconnect();
  }

  // void _publishMessage(String text) {
  //   String osPrefix = 'Flutter_iOS';
  //   if (Platform.isAndroid) {
  //     osPrefix = 'Flutter_Android';
  //   }
  //   final String message = osPrefix + ' says: ' + text;
  //   manager.publish(message);
  // }
}














