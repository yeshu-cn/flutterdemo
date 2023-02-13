import 'package:flutter/material.dart';
import 'package:flutterdemo/sliver/sliver_flexible_header.dart';
import 'common_ui_builder.dart';

// 参考：https://book.flutterchina.club/chapter6/sliver.html#_6-11-2-%E8%87%AA%E5%AE%9A%E4%B9%89-sliver-%E4%B8%80-sliverflexibleheader
class CustomSliverPage extends StatefulWidget {
  const CustomSliverPage({Key? key}) : super(key: key);

  @override
  State<CustomSliverPage> createState() => _CustomSliverPageState();
}

class _CustomSliverPageState extends State<CustomSliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flexible header'),
      ),
      body: CustomScrollView(
        //为了能使CustomScrollView拉到顶部时还能继续往下拉，必须让 physics 支持弹性效果
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          //我们需要实现的 SliverFlexibleHeader 组件
          SliverFlexibleHeader(
            visibleExtent: 200, // 初始状态在列表中占用的布局高度
            // 为了能根据下拉状态变化来定制显示的布局，我们通过一个 builder 来动态构建布局。
            builder: (context, availableHeight, direction) {
              return GestureDetector(
                onTap: () => debugPrint('tap'), //测试是否可以响应事件
                child: Image(
                  image: const AssetImage("assets/images/header.jpg"),
                  width: 50.0,
                  height: availableHeight,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          // 构建一个list
          buildSliverList(30),
        ],
      ),
    );
  }
}
