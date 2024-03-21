import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_messages/controllers/global_controller.dart';
import 'package:test_messages/custom_text.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GlobalView extends StatelessWidget {
  final GlobalController controller = Get.put(GlobalController());

  GlobalView({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterBackgroundService().invoke('setAsForeground');
    var latestMessage = GetStorage().read('lastMessage');
    var staticUrl = GetStorage().read('staticUrl');
    return GetBuilder<GlobalController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: controller.text=='Start Service'?Colors.red:Colors.green,
                title: const CustomText('server messenger',style: TextStyle(color: Colors.white),),
              ),
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    //Text(latestMessage.toString()),
                    Text(staticUrl.toString()),
                    SizedBox(height: 10),
                    SizedBox(
                      height: Get.height*0.2,
                      child: ElevatedButton(
                          onPressed: () async {
                            final service = FlutterBackgroundService();
                            var isRunning = await service.isRunning();
                            if (isRunning) {
                              service.invoke('stopService');
                            } else {
                              service.startService();
                              FlutterBackgroundService()
                                  .invoke('setAsForeground');
                            }
                            if (!isRunning) {
                              controller.text = 'Stop Service';
                            } else {
                              controller.text = 'Start Service';
                            }
                            controller.update();
                          },
                          //style: ButtonStyle(backgroundColor: controller.text=='Stop Service'?MaterialStateProperty.all(Colors.green):MaterialStateProperty.all(Colors.red)),
                          child: CustomText('     ${controller.text}     ',style: TextStyle(fontSize: 20),)),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: ()async{
                        await launchUrlString('https://technorex.net', mode: LaunchMode.externalApplication);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network('https://zdstor.com/image/logo.png',width: 30,height: 30,),
                          CustomText('Powered by tecnorex.net',style: TextStyle(color: Colors.grey,fontSize: 12),),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                      ),
                    ),

                    ElevatedButton(

                        onPressed: () {
                          controller.signup();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText('Sign up'),
                            SizedBox(width: 20),
                            Icon(Icons.logout_rounded)
                          ],
                        )),
                  ],
                ),
              ),
            ));
  }
}
