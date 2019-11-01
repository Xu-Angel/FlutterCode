import 'package:flutter/material.dart';
import 'count_container.dart';
import 'notification_widget.dart';
import 'event_bus_page.dart';
import 'router_page.dart' as R;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        // 声明路由
        "second_page": (context) => R.SecondPage(),
        "third_page": (context) => R.ThirdPage(),
        "unknown_page": (context) => R.UnknownPage()
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            CounterPage(),
            NotificationWidget(),
            FirstPage(),
            R.FirstPage()
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "InheritedWidget",
            ),
            Tab(
              icon: Icon(Icons.rss_feed),
              text: "Notification",
            ),
            Tab(
              icon: Icon(Icons.perm_identity),
              text: "EventBus",
            ),
            Tab(
              icon: Icon(Icons.access_alarms),
              text: "Routers",
            )
          ],
          unselectedLabelColor: Colors.blueGrey,
          labelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
        ),
      ),
    );
  }
}
