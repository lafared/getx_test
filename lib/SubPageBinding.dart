import 'package:get/get.dart';

import 'CounterControllerForBinding.dart';

class SubPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CounterControllerForBinding());
  }
}