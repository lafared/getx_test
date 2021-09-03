import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taegeon_test/sub.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      getPages: [
        GetPage(name: '/', page: () => MyHomePage(title: 'Home')),
        GetPage(name: '/sub', page: () => SubPage(title: 'Sub'), transition: Transition.zoom),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final _counterController = Get.put(CounterController());

  @override
  void initState() {
    super.initState();
    Get.lazyPut<CounterController>(() => CounterController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Obx(() => Text('${_counterController.count}')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("go to sub page");
          // Get.to(SubPage(title: 'SubPage Title',));
          // Get.toNamed('/sub', arguments: "arg1");
          Get.toNamed('/sub?id=123&name=taegeon');
          // Get.offNamed('/sub');
          // Get.offAllNamed('/sub');
          },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CounterController extends GetxController {
  RxInt count = 0.obs;
  void increment() {
    count++;
  }

  @override
  void onInit() {
    super.onInit();
    print("CounterController, onInit");
    ever(count, (_) => print("$_ has been changed"));
    once(count, (_) => print("$_ was changed once"));
    debounce(count, (_) => print("debounce$_"), time: Duration(seconds: 2));
    interval(count, (_) => print("interval $_"), time: Duration(seconds: 1));
  }

  @override
  void onReady() {
    super.onReady();
    print("CounterController, onReady");
  }

  @override
  void onClose() {
    super.onClose();
    print("CounterController, onClose");
  }
}
