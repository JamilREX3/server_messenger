import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get_storage/get_storage.dart';
import 'package:test_messages/controllers/user_model.dart';
import 'package:test_messages/views/global_view.dart';
import 'package:test_messages/views/login_view.dart';
import '../api_request.dart';

class AuthController extends GetxController {
  auth() async {
    var token = await GetStorage().read('token');
    if (token == null) {
      Get.offAll( LoginView());
    } else {
      dio.Response? response = await ApiRequest().get(path: '/me');
      if (response.statusCode.toString().startsWith(RegExp(r'2'))) {
        UserModel userModel = UserModelReq.fromJson(response.data).userModel!;
        if(userModel.userType=='client'){
          Get.snackbar('Error', 'not Auth');
          //todo logout if he is log in
          Get.snackbar('Error', 'Not Auth');
          Get.offAll( LoginView());
          //todo show snackbar
          final service = FlutterBackgroundService();
          service.invoke('stopService');
        }else{
          Get.offAll( GlobalView());
        }
      }else{
        //todo stop service
        final service = FlutterBackgroundService();
        service.invoke('stopService');
        Get.offAll( LoginView());
      }
    }
  }
}
