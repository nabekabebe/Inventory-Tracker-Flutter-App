import 'dart:ui';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/core/common/routes.dart';
import 'package:inventory_tracker/core/utils/common.dart';
import 'package:inventory_tracker/domain/controllers/auth_controller.dart';
import 'package:inventory_tracker/domain/form_inputs/form_validators.dart';
import 'package:inventory_tracker/presentation/screens/auth/widgets/FormField.dart';
import 'package:inventory_tracker/presentation/screens/auth/widgets/rive_background.dart';

class SignupPage extends GetView<AuthController> {
  SignupPage({super.key});

  final authC = AuthController.c;
  final _formKey = GlobalKey<FormState>();

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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Register",
                      style: TextStyle(fontSize: 32),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Column(
                      children: [
                        CustomFormField(
                            label: 'Full Name',
                            controller: authC.fullName,
                            onChange: (value) {
                              if (authC.hasError) {
                                authC.setError = "";
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) return null;
                              return authC.formValidation(
                                  FormFieldType.name, value);
                            }),
                        const SizedBox(height: 10),
                        CustomFormField(
                            label: 'Email',
                            controller: authC.email,
                            onChange: (value) {
                              if (authC.hasError) {
                                authC.setError = "";
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) return null;
                              return authC.formValidation(
                                  FormFieldType.email, value);
                            }),
                        const SizedBox(height: 10),
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
                        const SizedBox(height: 10),
                        Obx(
                          () => CustomFormField(
                            label: 'Managing Token',
                            controller: authC.managingToken,
                            enabled: authC.asManager,
                            onChange: (value) {
                              if (authC.hasError) {
                                authC.setError = "";
                              }
                            },
                            validator: (v) => "",
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () => {
                                showCountryPicker(
                                    context: context,
                                    onSelect: (Country code) {
                                      authC.countryCode.value = code.flagEmoji;
                                    })
                              },
                              child: Row(children: [
                                Obx(() => Text(authC.countryCode.value)),
                                const Icon(Icons.arrow_drop_down_rounded)
                              ]),
                            ),
                            Expanded(
                              child: CustomFormField(
                                  label: 'Phone Number',
                                  controller: authC.phoneNumber,
                                  onChange: (value) {
                                    if (authC.hasError) {
                                      authC.setError = "";
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return null;
                                    return authC.formValidation(
                                        FormFieldType.phone, value);
                                  }),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Obx(() => Checkbox(
                                  value: authC.isManager.value,
                                  onChanged: (bool? value) {
                                    authC.isManager.value = value ?? false;
                                  },
                                )),
                            const Text("Signup as manager"),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Obx(() => authC.loading.value
                            ? const CircularProgressIndicator()
                            : SizedBox(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: ElevatedButton(
                                  child: const Text("Sign up"),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      authC.submitRegister();
                                    }
                                  },
                                ),
                              )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                                text: 'Already have an account? ',
                                style: const TextStyle(color: Colors.blue),
                                children: [
                                  WidgetSpan(
                                    child: GestureDetector(
                                      child: const Text("Sign in",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold)),
                                      onTap: () {
                                        authC.clearForm();
                                        Get.toNamed(Routes.LOGIN);
                                      },
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
