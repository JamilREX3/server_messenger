


import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:telephony/telephony.dart';
import 'package:test_messages/api_request.dart';
import 'package:test_messages/main.dart';
import 'package:test_messages/views/auth_view.dart';


Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
      iosConfiguration: IosConfiguration(),
      androidConfiguration:
      AndroidConfiguration(onStart: onStart, isForegroundMode: true,autoStart: true,autoStartOnBoot: true));
  await service.startService();
}

@pragma('vm:entry-point')
backgrounMessageHandler(SmsMessage message) async {
  //Handle background message
  await GetStorage.init();
  // print('hhhhhhhhhhhhhhhhhhhhhhhh222222222222222back');
  print('body : ${message.body}');
  print('sender : ${message.address}');
  print('timeReceived : ${message.dateSent.toString()}');


  // print('sender : ${message.address}');
  //print('timeReceived : ${message.date.toString()}');
  var response = await ApiRequest().post(
      path: '/sms/store',
      body: {
        'message':message.body.toString(),
        'sender':message.address.toString(),
      }
  );
  print(response.statusCode);
  await GetStorage().write('lastMessage', message.body);
}


@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });
    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }
  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  //smsListener();
  smsListenerByTelephony();
 

  if (service is AndroidServiceInstance) {
   await GetStorage.init();
    var staticUrl = GetStorage().read('staticUrl');
    if (await service.isForegroundService()) {
      service.setForegroundNotificationInfo(
          title: 'Running Service',
          content: 'on : ${staticUrl.toString()}');
    }
  }

}





smsListenerByTelephony()async{
  final Telephony telephony = Telephony.instance;
  telephony.listenIncomingSms(
    listenInBackground: true,
      onBackgroundMessage: backgrounMessageHandler,
      onNewMessage: (SmsMessage message)async {
        // Handle message
        print('hhhhhhhhhhhhhhhhhhhhhhh11155112222222222222');
        print('hhhhhhhhhhhhhhhhhhhhhhh11155112222222222222');
        print('body : ${message.body}');
       print('sender : ${message.address}');
        print('timeReceived : ${message.dateSent.toString()}');
            var response = await ApiRequest().post(
      path: '/sms/store',
      body: {
        'message':message.body.toString(),
        'sender':message.address.toString(),
      }
    );
    print(response.statusCode);
        await GetStorage().write('lastMessage', message.body);
      },
     // onBackgroundMessage: backgroundMessageHandler
  );
}

class GlobalController extends GetxController {
  String text = 'Stop Service';


  signup(){
    GetStorage().erase();
    final service = FlutterBackgroundService();
    service.invoke('stopService');
    Get.offAll(const AuthView());
  }



  @override
  void onInit()async {
    var status =await Permission.sms.status;

    if(await Permission.sms.request().isGranted){
      print('granted');
    }else{
      print('no granted');
    }
    print('statusssssssss = ${status.isGranted}');
    await initializeService();
    super.onInit();
  }
}
