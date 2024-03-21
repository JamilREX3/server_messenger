import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../api_request.dart';
import '../models/login_user_model.dart';
import '../views/auth_view.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  var obscureText = true.obs;
  final dio = Dio();

  bool _validateFields() {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty || urlController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields');
      return false;
    }
    return true;
  }

  void login() async {
    if (_validateFields()) {
      await GetStorage().write('staticUrl', urlController.text);
      var response = await ApiRequest().post(
        path: '/login',
        authRequire: false,
        body: {
          'username': usernameController.text,
          'password': passwordController.text,
        },
      );
      if (response.statusCode.toString().startsWith(RegExp(r'2'))) {
        LoginUserModel loginUserModel =
            LoginUserModelReq.fromJson(response.data).loginUserModel!;
        await GetStorage().write('token', loginUserModel.token);

        Get.offAll(const AuthView());
      }
    }
  }
}
