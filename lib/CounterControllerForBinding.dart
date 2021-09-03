import 'package:get/get.dart';

class CounterControllerForBinding extends GetxController {
  RxInt count = 0.obs;
  void increment() {
    count++;
  }

  @override
  void onInit() {
    super.onInit();
    print("CounterControllerForBinding, onInit");
    ever(count, (_) => print("$_ has been changed"));
    once(count, (_) => print("$_ was changed once"));
    debounce(count, (_) => print("debounce$_"), time: Duration(seconds: 2));
    interval(count, (_) => print("interval $_"), time: Duration(seconds: 1));
  }

  @override
  void onReady() {
    super.onReady();
    print("CounterControllerForBinding, onReady");
  }

  @override
  void onClose() {
    super.onClose();
    print("CounterControllerForBinding, onClose");
  }
}