import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project2/movie/list.dart';
import 'package:project2/function/search/search.dart';
import 'package:project2/movie/douban.dart';
import 'package:project2/movie/movie_card//more_home.dart';

import 'package:project2/ads/logining_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:project2/movie/shouye.dart';
import 'package:project2/function/video_play_history.dart';
import 'package:project2/test/net_image_test.dart';
import 'package:project2/movie/high_move/recomd.dart';

class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome>
    with AutomaticKeepAliveClientMixin
{
  @override
  Brightness brightness = Brightness.light;
  @override
  void initState() {
    // TODO: implement initState
    // play_video();
    Future.delayed(Duration.zero, () {
      this.play_video();
    });
    super.initState();
  }



  Widget build(BuildContext context) {
    // throw UnimplementedError();
    return MaterialApp(
      theme: ThemeData(
        brightness: brightness,
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("i movie"),
              centerTitle: true,
              actions: <Widget>[
                InkWell(
                  child: Icon(Icons.search),
                  onTap: () {
                    showSearch(context: context, delegate: SearchBarDelegate());
                  },
                )
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text("code by better"),
                    accountEmail: Text("better57.top"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://profile.csdnimg.cn/7/C/D/1_hello__bug'),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fv."
                                "seloger.com%2Fs%2Fwidth%2F800%2Fvisuels%2F1%2F1%2Fn%2Fw%2F11nwkb4gg3xveun515v8k9tvu7tqvu0u7eki31728.jpg&refer=http%3A%2F%2Fv.seloger.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632290503&t=4bfcd4cd73c4d8a5fcfb419f23c3f650"))),
                  ),
                  ListTile(
                    title: Text("??????"),
                    trailing: Icon(Icons.feedback),
                    onTap: _showMySimpleDialog,
                  ),
                  Divider(),
                  ListTile(
                    title: Text("????????????"),
                    trailing: Icon(Icons.settings),
                    onTap: () {
                      _onClick();
                      setState(() {
                        if (brightness == Brightness.dark) {
                          brightness = Brightness.light;
                        } else {
                          brightness = Brightness.dark;
                        }
                      });
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text("????????????"),
                    trailing: Icon(Icons.history_outlined),
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return play_History();
                      }));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text("??????"),
                    onTap: _showMySimpleDialog1,
                    trailing: Icon(Icons.movie),
                  ),
                  Divider(),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(color: Colors.black),
              height: 50,
              child: TabBar(
                labelStyle: TextStyle(height: 0),
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.movie),
                    text: "????????????",
                  ),
                  Tab(
                    icon: Icon(Icons.movie),
                    text: "????????????",
                  ),
                  Tab(
                    icon: Icon(Icons.movie),
                    text: "????????????",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                homebody(),
                // mote_home(),
                Secondpage(),
                // MyApp3(),
                //   TabBarControllerPage()
                FirstPage()
              ],
            ),




          )),
    );


  }

  _onClick() {
    setState() {
      if (brightness == Brightness.dark) {
        brightness = Brightness.light;
      } else {
        brightness = Brightness.dark;
      }
    }
  }




  void play_video() {
    print("ok");
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            insetPadding: EdgeInsets.only(left: 18, right: 18,bottom: 20),
            // backgroundColor: Colors.white70,
            children: [
                Container(
                  height: 760,
                  width: 1000,

                  child:
                  mote_home(),
                )
                ,

            ],
          );
        });
  }

  void _showMySimpleDialog1() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.lightBlueAccent,
          title: const Text(
            '??????',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          children: [
            Text(
              "?????????1.1",
              style: TextStyle(),
              textAlign: TextAlign.center,
            ),
            Text(
              "????????????",
              style: TextStyle(color: Colors.amber, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              "1.?????????????????????????????????????????????????????????????????????",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.left,
            ),
            Text(
              "2.??????????????????????????????????????????????????????????????????????????????????????????",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.left,
            ),
            Text(
              "3.????????????????????????",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.left,
            ),
          ],
        );
      },
    );
  }

  void _showMySimpleDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.lightBlueAccent,
          title: const Text(
            '????????????',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          children: [
            SimpleDialogOption(
              onPressed: () {
                print('qq:1203162819');
                Navigator.pop(context);
              },
              child: const Text('qq:1203162819', textAlign: TextAlign.center),
            ),
            SimpleDialogOption(
              onPressed: () {
                print('??????');
                Navigator.pop(context);
              },
              child: const Text('??????:w1203162819', textAlign: TextAlign.center),
            ),
            SimpleDialogOption(
              onPressed: () {
                print('??????');
                Navigator.pop(context);
              },
              child: const Text('??????:better57@126.com',
                  textAlign: TextAlign.center),
            )
          ],
        );
      },
    );
  }




  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
