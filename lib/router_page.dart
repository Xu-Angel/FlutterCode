import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _FirstPageState();
}


class _FirstPageState extends State<FirstPage> {
  String _msg='';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
      ),
      body: Column(children: <Widget>[
        RaisedButton(
            child: Text('基本路由'),
            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()))
        ),
        RaisedButton(
            child: Text('命名路由'),
            onPressed: ()=> Navigator.pushNamed(context,"second_page")
        ),
        RaisedButton(
            child: Text('命名路由（参数&回调）'),
            onPressed: ()=> Navigator.pushNamed(context, "third_page",arguments: "Hey").then((msg) {
              setState(() {
                _msg = msg;
              });
            }),
        ),
        Text('Message from Second screen: $_msg'),
        RaisedButton(
            child: Text('命名路由异常处理'),
            onPressed: ()=> Navigator.pushNamed(context,"unknown_page")
        )
      ],),
    );
  }
   //当Widget第一次插入到Widget树时会被调用。对于每一个State对象，Flutter只会调用该回调一次
  @override
  void initState() {
    super.initState();
    print("page2 child initState......");
  }


  /*
  *初始化时，在initState之后立刻调用
  *当State的依赖关系发生变化时，会触发此接口被调用
  */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("page2 child didChangeDependencies......");
  }

  //状态改变的时候会调用该方法,比如父类调用了setState
  // @override
  // void didUpdateWidget(Child oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   print("page2 child didUpdateWidget......");
  // }

  //当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    print('page2 child deactivate......');
  }

  //当State对象从树中被永久移除时调用；通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
    print('page2 child dispose......');
  }
}


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second Screen'),
      ),
      body: RaisedButton(
          child: Text('Back to first screen'),
          onPressed: ()=> Navigator.pop(context)
      ),
    );
  }
}




class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Unknown Screen'),
      ),
      body: RaisedButton(
          child: Text('Back'),
          onPressed: ()=> Navigator.pop(context)
      ),
    );
  }
}




class ThirdPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String msg = ModalRoute.of(context).settings.arguments as String;

    return  Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
      ),
      body: Column(
        children: <Widget>[
          Text('Message from first screen: $msg'),
          RaisedButton(
              child: Text('back'),
              onPressed: ()=> Navigator.pop(context,"Hi")
          )
        ],
      ),
    );
  }
}