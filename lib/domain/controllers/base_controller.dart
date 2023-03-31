import 'package:get/get.dart';

class BaseController<T> extends GetxController {
  final loading = false.obs;
  final errorMessage = "".obs;
  final RxList<T> dataList = <T>[].obs;

  bool get hasError => errorMessage.value.isNotEmpty;

  set setError(String e) => errorMessage.value = e;
}
