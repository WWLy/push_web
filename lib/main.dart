import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<List> list_titles = [ ["应用信息"], 
  ["消息推送", "推送数据统计", "推送历史记录", "创建全量推送", "创建指定推送", "测试人员设置"],
  ["AB测试", "AB测试记录"],
  ["用户分群", "分群明细数据"] ];

  Drawer createDrawer(List titles) {
    List<Widget> expansionTiles = [];
    var tempExpansionTile;
    for (List item in titles) {
      if (item.length > 1) {
        final tempItem = item.sublist(1);
        List<Widget> expansionTileChildren = [];
        for (String tempTitle in tempItem) {
          final listTile = ListTile(
            leading: SizedBox(width: 0),
            title: Text(tempTitle),
            trailing:Icon(Icons.arrow_right)
          );
          expansionTileChildren.add(listTile);
        }
        tempExpansionTile = ExpansionTile(
          title: Text(item.first),
          children: expansionTileChildren,
        );
      } else {
        tempExpansionTile = ListTile(
          title: Text(item.first),
          trailing:Icon(Icons.arrow_right),
        );
      }
      expansionTiles.add(tempExpansionTile);
      expansionTiles.add(Divider(height: 1.0));
    }
    return Drawer(
      child: ListView(
        children: expansionTiles,
      ),
    );
  }

  get _drawer => createDrawer(list_titles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      drawer: _drawer,
      body: Center(child: Text("1")),
    );
  }
}
