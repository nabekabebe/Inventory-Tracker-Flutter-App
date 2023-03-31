import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/core/common/app_constants.dart';
import 'package:inventory_tracker/core/common/routes.dart';
import 'package:inventory_tracker/core/utils/form_validation_mixin.dart';
import 'package:inventory_tracker/data/data_provider/Auth/local_provider.dart';
import 'package:inventory_tracker/data/dto/auth_response.dto.dart';
import 'package:inventory_tracker/data/dto/signup.dto.dart';
import 'package:inventory_tracker/domain/repository/IAuthRepository.dart';

class AuthController extends GetxController with FormValidationMixin {
  static AuthController get c => Get.find<AuthController>();

  // final sharedPref = SharedPreferences.getInstance();
  final sessionManager =
      Get.find<SessionManager>(tag: AppConstants.GetxTagSessionManager);
  final authRepository = Get.find<IAuthRepository>(tag: 'auth');

  //common fields
  final email = TextEditingController();
  final password = TextEditingController();

  //signup fields
  final fullName = TextEditingController();
  final phoneNumber = TextEditingController();
  final managingToken = TextEditingController();

  //status fields
  final loading = false.obs;
  final isApproved = false.obs;
  final errorMessage = "".obs;
  final isManager = false.obs;
  final countryCode = "+251".obs;

  bool get asManager => isManager.isFalse;

  //sends post request to api [/login] to remote server
  Future<void> submitLogin() async {
    authRepository.login(email.text, password.text).forEach((result) {
      result.when(
          Success: (authResp) async {
            loading.value = false;
            isApproved.value = true;

            await saveUser(authResp);

            clearForm();
            Get.offAllNamed(Routes.HOME);
          },
          Loading: (authResp) => loading.value = true,
          Error: (error, authResp) {
            loading.value = false;
            // errorMessage.value = error;
            Get.snackbar("Login failed", error,
                snackPosition: SnackPosition.BOTTOM);
          });
    });
  }

  //sends post request to api [/register] to remote server
  Future<void> submitRegister() async {
    final signupData = SignupDto(
        fullName: fullName.text,
        email: email.text,
        password: password.text,
        phoneNumber: phoneNumber.text,
        managingToken: managingToken.text,
        isManager: isManager.value ? 1 : 0);

    authRepository.signup(signupData).forEach((result) {
      result.when(
          Success: (authResp) async {
            loading.value = false;
            isApproved.value = true;

            await saveUser(authResp);

            clearForm();
            Get.offAllNamed(Routes.HOME);
          },
          Loading: (authResp) => loading.value = true,
          Error: (error, authResp) {
            loading.value = false;
            // errorMessage.value = error;
            Get.snackbar("Signup failed", error,
                snackPosition: SnackPosition.BOTTOM);
          });
    });
  }

  //clears form
  @override
  void clearForm() {
    loading.value = false;
    fullName.clear();
    email.clear();
    password.clear();
    errorMessage.value = "";
  }

  bool isLoggedIn() => sessionManager.isUserLoggedIn();

  bool get hasError => errorMessage.value.isNotEmpty;

  set setError(String e) => errorMessage.value = e;

  bool isNewUser() => sessionManager.isNew();

  forgetUser() async => await sessionManager.removeNewUser();

  Future<void> saveUser(AuthResponse authResp) async {
    await sessionManager.saveToken(authResp.token);
    await sessionManager.saveUser(authResp.user);
    await sessionManager.saveUserId(authResp.user.id);
    await sessionManager.setIsManager(authResp.user.isManager == 1);
  }

  @override
  void onClose() {
    super.onClose();
    email.dispose();
    password.dispose();
    fullName.dispose();
    phoneNumber.dispose();
    managingToken.dispose();
  }
}
