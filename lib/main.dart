import 'package:flutter/material.dart';
import 'package:testproject/Home.dart';
import 'package:testproject/MQTTAppState.dart';
import 'package:provider/provider.dart';
import 'package:testproject/conditionalRender.dart';

// void main() {
//   runApp(Home());
// }


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late MQTTAppState currentAppState;
  @override
  Widget build(BuildContext context) {
    // final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    // currentAppState = appState;
     return MaterialApp(
        // title: 'Flutter Demo',
        // theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // primarySwatch: Colors.blue,
        // ),
        home: ChangeNotifierProvider<MQTTAppState>(
          create: (_) => MQTTAppState(),
          
          // child: currentAppState.getId == 0? Login():Home(),
          child: IsLogged(),
        ),debugShowCheckedModeBanner: false);
  }
}


// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//    late MQTTAppState currentAppState;

//   @override
//   Widget build(BuildContext context) {
//     /*
//     final MQTTManager manager = MQTTManager(host:'test.mosquitto.org',topic:'flutter/amp/cool',identifier:'ios');
//     manager.initializeMQTTClient();
//      */
//     final MQTTAppState appState = Provider.of<MQTTAppState>(context);
//     currentAppState = appState;
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Flutter Demo')),
//         body: const MyStatefulWidget(),
//       ),
//     )
//   }
// }

// (
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           // This is the theme of your application.
//           //
//           // Try running your application with "flutter run". You'll see the
//           // application has a blue toolbar. Then, without quitting the app, try
//           // changing the primarySwatch below to Colors.green and then invoke
//           // "hot reload" (press "r" in the console where you ran "flutter run",
//           // or simply save your changes to "hot reload" in a Flutter IDE).
//           // Notice that the counter didn't reset back to zero; the application
//           // is not restarted.
//           primarySwatch: Colors.blue,
//         ),
//         home: ChangeNotifierProvider<MQTTAppState>(
//           create: (_) => MQTTAppState(),
          
//           child: currentAppState.getId == 0? Login():Home(),
//           // child: Login(),
//         ),debugShowCheckedModeBanner: false);

/*
Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child:Column(
            children: <Widget>[
              Center(
                child: RaisedButton(
                  child: Text("Connect"),
                  onPressed: manager.connect ,
                ),
              )
            ],
          ) ,
        ),
      )
 */

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     // return MaterialApp(home: Center(child: Text('hello flutter'),),) ;
//     return MaterialApp(home: MyHome(),debugShowCheckedModeBanner: false,);
//     // return MaterialApp(home: Home(),debugShowCheckedModeBanner: false,);
//   }
// }

// class MyHome extends StatelessWidget{
//   @override
//   // Widget build(BuildContext context) => const Center(child: Text('hello flutter zahra'),);
//   Widget build(BuildContext context) => Scaffold(appBar: AppBar(
//                                                   title: Text('Flutter'),
//                                                   centerTitle: true,
//                                                   leading: Icon(Icons.person),
//                                                   // bottom: Text('app created by zahra'),
//                                                   actions: [
//                                                     IconButton(onPressed: ()=> print('share'), icon: Icon(Icons.share)),
//                                                     IconButton(onPressed: ()=> print('settings'), icon: Icon(Icons.settings)),
//                                                     IconButton(onPressed: ()=> print('notifications'), icon: Icon(Icons.notifications)),
//                                                   ],
//                                                   backgroundColor: Colors.green[400],
//                                                   elevation: 10,
//                                                   shadowColor: Colors.deepPurple,
//                                                   ),
//                                                   body: Container(height: 230,color:Colors.blueGrey,width: double.infinity,
//                                                   child: SingleChildScrollView(
//                                                     child: Column(children: [
//                                                         const Text('hello zahra'),
//                                                         const Text('hello '),
//                                                         Image.network('data:image/jpeg;base64,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')
//                                                     ],)
//                                                   ),),
//                                                   // floatingActionButton: FloatingActionButton(onPressed: null),
                                                  
//                                                   bottomNavigationBar: Container(height: 50, color: Colors.yellow,
//                                                   // Center(child: Text('Disability Smart Home'),),
                                                  
//                                                   )
//                                                   );
  
// }