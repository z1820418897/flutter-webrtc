import 'package:flutter/material.dart';
import 'package:flutter_webrtc_demo/page/local.dart';
import 'package:flutter_webrtc_demo/page/room.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LocalPage()));
              },
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              child: Text('本地视频'),
            ),
            OutlineButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RoomPage()));
              },
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              child: Text('视频房间'),
            ),
          ],
        ),
      ),
    );
  }
}
