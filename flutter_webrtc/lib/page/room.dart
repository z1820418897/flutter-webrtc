import 'package:flutter/material.dart';

class RoomPage extends StatefulWidget {
  @override
  _room_pageState createState() => _room_pageState();
}

class _room_pageState extends State<RoomPage> {
  TextEditingController _roomCodeController = TextEditingController();

  Widget _easyLog(title,msg){
    return AlertDialog(
      title:Text(title) ,
      content: SingleChildScrollView(
        child: Text(msg),
      ),
    );
  }

  void _onJoinRoom() {
    if(_roomCodeController.text.isEmpty){
      showDialog(context: context, builder: (BuildContext context) {
        return _easyLog('提示','你还没有输入房间号');
      });
    }else{
      showDialog(context: context, builder: (BuildContext context) {
        return _easyLog('提示','你输入了'+_roomCodeController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加入房间"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              controller: _roomCodeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.home,
                  color: Theme.of(context).primaryColor,
                ),
                labelText: '请输入要加入的房间号',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: OutlineButton(
              onPressed: _onJoinRoom,
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              child: Text('进入房间'),
            ),
          ),
        ],
      ),
    );
  }
}
