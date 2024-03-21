import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../customTextField.dart';
import '../custom_text.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              'Login',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16.0),
            CustomTextFormField(
              hintText: 'username',
              prefixIcon: Icons.person,
              controller: controller.usernameController,
              labelText: 'username',
            ),
            const SizedBox(height: 16.0),
            CustomTextFormField(
              hintText: 'Password',
              prefixIcon: Icons.lock,
              keyboardType: TextInputType.visiblePassword,
              controller: controller.passwordController,
              obscureText: true,
              labelText: 'Password',
            ),
            const SizedBox(height: 16.0),
            CustomTextFormField(
              hintText: 'https://api.yourSite.com/api',
              prefixIcon: Icons.satellite_alt_outlined,
              controller: controller.urlController,
              labelText: 'url',
            ),
            const SizedBox(height: 8.0),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: controller.login,
              child:  const CustomText('Login'),
            ),
          ],
        ),
      ),
    );
  }
}