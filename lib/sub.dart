import 'package:flutter/material.dart';
import 'package:taegeon_test/main.dart';
import 'package:get/get.dart';

import 'CounterControllerForBinding.dart';

class SubPage extends StatefulWidget {
  SubPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  // final CounterController _counterController = Get.find();

  @override
  void initState() {
    super.initState();
    // print("arg : ${Get.arguments}");
    print("id : ${Get.parameters['id']}");
    print("name : ${Get.parameters['name']}");
    print("pw : ${Get.parameters['pw']}");
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
              'SubPage',
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
