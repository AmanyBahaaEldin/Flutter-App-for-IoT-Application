import 'package:flutter/cupertino.dart';
import 'package:vibration/vibration.dart';
import 'package:torch_light/torch_light.dart';



class MQTTAppState with ChangeNotifier{

  int _light = 0;
  int _id = -1;

  String status = "pending";

  void setReceivedText(String message) {
    _light=int.parse(message);
    notify(_light);
    print('subscribed messages is ...... $message');
    notifyListeners();
  }
  

  int get getLight => _light;
  int get getId => _id;


  void setId(int x) { 
    _id = x;
    notifyListeners();
    }
  void vibrateMobile() async {
    if (await Vibration.hasVibrator()) { //check if device has vibration feature
          Vibration.vibrate(duration: 3000); //500 millisecond vibration
    }
  }
  void turnOnFlash() async{
    try {
        await TorchLight.enableTorch();
      } on Exception catch (_) {
      }
  }
  void turnOffFlash() async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
    }
  }
  void notify(int value){
    if(value == 0){
      turnOffFlash();
    }
    else{
      turnOnFlash();
      vibrateMobile();
    }
  }
}