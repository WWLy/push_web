import 'package:flutter/gestures.dart';
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

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<List> list_titles = [ ["应用信息"], 
  ["消息推送", "推送数据统计", "推送历史记录", "创建全量推送", "创建指定推送", "测试人员设置"],
  ["AB测试", "AB测试记录"],
  ["用户分群", "用户分群任务", "分群明细数据"],
  ["整体数据统计", "用户留存", "使用时长/频率", "流量跟踪"],
  ["功能使用统计", "翻译字数统计", "网页翻译阅读数", "传送门阅读数", "看看阅读明细", "阅读时间分布", "图片翻译统计"],
  ["付费数据统计", "整体数据", "会员数据", "补充包数据"],
  ["小译工具箱", "用户/付费详查", "侧边栏活动设置", "弹框活动设置", "开屏广告设置", "激励视频广告设置"],
  ["VIP 兑换码", "兑换码列表", "兑换码生成器"],
  ["小译年度报告", "2019 年度报告", "活动/抽奖统计", "人物/书籍配置"],
  ["用户来信活动", "用户来信活动"],
  ["旧版运营平台活动", "沙雕 AI 故事", "邀请好友安装", "人机翻译大赛"] ];

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
            trailing:Icon(Icons.keyboard_arrow_right),
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
          trailing:Icon(Icons.keyboard_arrow_right),
        );
      }
      final tap = GestureDetector(
        child: tempExpansionTile,
        onTap: (){
          if (tempExpansionTile is ListTile) {
            
          }
        },);
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
