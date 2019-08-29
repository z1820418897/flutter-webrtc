import 'package:flutter/material.dart';
import 'package:flutter_webrtc/webrtc.dart';
import 'dart:core';

class LocalPage extends StatefulWidget {
  ///定义日志名
  static String TAG='LocalPage';

  @override
  _LocalPageState createState() => _LocalPageState();
}

class _LocalPageState extends State<LocalPage> {
  ///定义本地视频流
  MediaStream _localStream;
  ///定义一个rtc的视频渲染 用于对视频流的加载控制
  final _localRenderer=RTCVideoRenderer();
  ///定义一个开关 控制播放
  bool _sw=false;

  ///界面创建的时候的初始化
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //界面初始化调用渲染器也初始化
    initRenderer();
  }

  ///界面销毁时初始化
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    //界面关闭时 开启状态要进行关闭
    if(_sw){
      _hangUp();
    }
    //销毁渲染器
    _localRenderer.dispose();
  }

  ///初始化视频渲染器  要异步执行
  initRenderer() async{
    await _localRenderer.initialize();
  }

  ///关闭
  _hangUp() async{
    try {
      await _localStream.dispose();
      _localRenderer.srcObject=null;
    }catch(e){
      print(e);
    }
    setState(() {
      _sw=false;
    });
  }
  ///开启
  _makeCall() async{
    //定义一个参数map 配置音视频获取
    final Map<String,dynamic> mediaConstrains={
      'audio':true,
      'video':{
        'mandatory':{
          'minWidth':'640',
          'minHeight':'480',
          'minFrameRate':'30',
        },
        'facingMode':'user',
        'optional':[]
      }
    };

    try{
      ///调用插件获取流 传入参数
      navigator.getUserMedia(mediaConstrains).then((stream){
        _localStream=stream;
        _localRenderer.srcObject=_localStream;
      });
    }catch(e){
      print(e);
    }

    //一个程序运行的挂载状态  还不太清楚
    if(!mounted){return;}
    //刷新状态
    setState(() {
      _sw=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('调用摄像头'),),
      body: OrientationBuilder(//在方向上的适应加载
        builder: (context,orientation){
            return Center(
              child: Container(
                margin: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: RTCVideoView(_localRenderer),
                decoration: BoxDecoration(color: Colors.black54),
              ),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sw ? _hangUp : _makeCall,
        tooltip: _sw?'点击关闭':'点击开启',  //长按显示
        child: Icon(_sw?Icons.call_end:Icons.call),
      ),
    );
  }
}
