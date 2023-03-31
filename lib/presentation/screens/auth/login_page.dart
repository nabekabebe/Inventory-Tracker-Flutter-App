import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/core/common/routes.dart';
import 'package:inventory_tracker/core/utils/common.dart';
import 'package:inventory_tracker/domain/controllers/auth_controller.dart';
import 'package:inventory_tracker/domain/form_inputs/form_validators.dart';
import 'package:inventory_tracker/presentation/screens/auth/widgets/FormField.dart';
import 'package:inventory_tracker/presentation/screens/auth/widgets/rive_background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authC = AuthController.c;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Get.arguments['withError']) {
        Get.snackbar("Unexpected Error", "Please try logging in again!",
            snackPosition: SnackPosition.BOTTOM);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const RiveAnimationContainer(),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: const SizedBox(),
              ),
            ),
            Container(
              width: widthQuery(
                  context, MediaQuery.of(context).size.width > 420 ? 60 : 100),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 32),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Column(
                    children: [
                      Form(
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            CustomFormField(
                                label: 'Email',
                                controller: authC.email,
                                onChange: (value) {
                                  if (authC.hasError) {
                                    authC.setError = "";
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  return authC.formValidation(
                                      FormFieldType.email, value);
                                }),
                            const SizedBox(height: 20),
                            CustomFormField(
                              label: 'Password',
                              obscure: true,
                              controller: authC.password,
                              validator: (value) {
                                if (value == null || value.isEmpty) return null;
                                return authC.formValidation(
                                    FormFieldType.password, value);
                              },
                              onChange: (value) {
                                if (authC.hasError) {
                                  authC.setError = "";
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Forgot password logic
                          },
                          child: const Text("forgot password"),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(() => authC.loading.value
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: ElevatedButton(
                                child: const Text("Sign in"),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    authC.submitLogin();
                                  }
                                },
                              ),
                            )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                              text: 'Don\'t have an account yet? ',
                              style: const TextStyle(color: Colors.blue),
                              children: [
                                WidgetSpan(
                                  child: GestureDetector(
                                    child: const Text("Sign up",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                    onTap: () {
                                      authC.clearForm();
                                      Get.toNamed(Routes.REGISTER);
                                    },
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
