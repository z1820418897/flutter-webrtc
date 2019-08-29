import 'package:flutter/material.dart';
import 'package:flutter_webrtc_demo/page/index.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("webrtc应用手机客户端"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text("开始体验",style: TextStyle(
                color: Colors.white
              ),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>IndexPage()),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
