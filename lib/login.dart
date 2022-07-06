import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproject/MQTTAppState.dart';
import 'package:testproject/MQTTManager.dart';
 
class Login extends StatelessWidget {
  
  const Login({Key? key}) : super(key: key);
 
  static const String _title = 'Smart Home';
 
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
      debugShowCheckedModeBanner: false
    );
  }
}
 
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
 
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
 
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController topicController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
   late MQTTAppState currentAppState;
    late MQTTManager manager;

  
 
  @override
  Widget build(BuildContext context) {
     final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    // Keep a reference to the app state.
    currentAppState = appState;
    //  _configureAndConnect();
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator:(value) {
                    if (value!.isEmpty) {
                    return 'Please enter some text';
                    }
                return null;
                }, 
                controller: topicController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Topic',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    print(topicController.text);
                    // print(passwordController.text);
                    // currentAppState.setId(1);
                    // manager.publish(topicController.text, 'topic:${topicController.text}');
                    _configureAndConnect();
                    currentAppState.setId(1);
                  },
                )
            )
          ],
        ));
  }
  void _configureAndConnect() {
    // ignore: flutter_style_todos
    // TODO: Use UUID
    String osPrefix = 'Flutter_iOS';
    if (Platform.isAndroid) {
      osPrefix = 'Flutter_Android';
    }
    manager = MQTTManager(
        host : "learning.masterofthings.com",
        topic : topicController.text,
        identifier: osPrefix,
        state: currentAppState);
    manager.initializeMQTTClient();
    manager.connect();
  }
}