import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomEvent {
  String msg;
  CustomEvent(this.msg);
}

EventBus eventBus = new EventBus();

class FirstPage extends StatefulWidget {
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String msg = "号外";
  StreamSubscription subscription;
  void initState() {
        //监听CustomEvent事件，刷新UI
    subscription = eventBus.on<CustomEvent>().listen((event) {
      print(event);
      setState(() {
        msg += event.msg;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription.cancel();//State销毁时，清理注册
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text(msg),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondPage())),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("second page")),
      body: RaisedButton(
          // 触发CustomEvent事件
        onPressed: () => eventBus.fire(CustomEvent("hello")),
        child: Text("Fire Event"),
      ),
    );
  }
}
