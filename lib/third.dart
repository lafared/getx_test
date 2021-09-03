import 'package:flutter/material.dart';
import 'package:taegeon_test/main.dart';
import 'package:get/get.dart';

import 'CounterControllerForBinding.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  // final CounterController _counterController = Get.find();

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
              'ThirdPage',
            ),
            Obx(() => Text('${Get.find<CounterControllerForBinding>().count}')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CounterControllerForBinding>().increment();
          //Get.deleteAll();
          },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
