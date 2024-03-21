import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:telephony/telephony.dart';
import 'package:test_messages/views/auth_view.dart';

import 'api_request.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await initializeService();
  runApp(const MyApp());

}

// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();
//   await service.configure(
//       iosConfiguration: IosConfiguration(),
//       androidConfiguration:
//           AndroidConfiguration(onStart: onStart, isForegroundMode: true,autoStart: true,autoStartOnBoot: true));
//   await service.startService();
// }

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   if (service is AndroidServiceInstance) {
//     service.on('setAsForeground').listen((event) {
//       service.setAsForegroundService();
//     });
//     service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });
//   }
//   service.on('stopService').listen((event) {
//     service.stopSelf();
//   });
//   smsListener();
//   Timer.periodic(const Duration(seconds: 2), (timer) async {
//     if (service is AndroidServiceInstance) {
//       if (await service.isForegroundService()) {
//         service.setForegroundNotificationInfo(
//             title: 'Foreground Service',
//             content: 'updated at ${DateTime.now()}');
//       }
//     }
//   });
//
// }
//
// smsListener()async {
//   await GetStorage.init();
//   final plugin = Readsms();
//   print(plugin.read());
//   plugin.smsStream.listen((sms) async{
//     print('body : ${sms.body}');
//     print('sender : ${sms.sender}');
//     print('timeReceived : ${sms.timeReceived}');
//    await GetStorage().write('lastMessage', sms.body);
//   });
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //
    //FlutterBackgroundService().invoke('setAsForeground');
    //


    return GetMaterialApp(
      title: 'server messenger',
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthView(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   String text = 'Stop Service';
//   var latestMessage = GetStorage().read('lastMessage');
//   //print('latest message ${latestMessage.toString()}');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//
//         title: Text('Service App'),
//       ),
//       body: Column(
//         children: [
//
//           Text(latestMessage.toString()),
//           ElevatedButton(
//               onPressed: () {
//                 FlutterBackgroundService().invoke('setAsForeground');
//               },
//               child: const Text('Foreground Mode')),
//           ElevatedButton(
//               onPressed: () {
//                 FlutterBackgroundService().invoke('setAsBackground');
//               },
//               child: const Text('Background Mode')),
//           ElevatedButton(
//               onPressed: () async {
//                 final service = FlutterBackgroundService();
//                 var isRunning = await service.isRunning();
//                 if (isRunning) {
//                   service.invoke('stopService');
//                 } else {
//                   service.startService();
//                 }
//
//                 if (!isRunning) {
//                   text = 'Stop Service';
//                 } else {
//                   text = 'Start Service';
//                 }
//                 setState(() {});
//               },
//               child: Text(text)),
//         ],
//       ),
//     );
//   }
// }
