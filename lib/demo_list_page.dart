import 'package:flutter/material.dart';
import 'package:flutterdemo/demo_page.dart';
import 'package:flutterdemo/nested/nested_scroll_page.dart';
import 'package:flutterdemo/nested/nested_tab_page.dart';
import 'package:flutterdemo/nested/snap_appbar_page.dart';
import 'package:flutterdemo/sliver/flexible_header_page.dart';
import 'package:flutterdemo/sliver/persistent_header_page.dart';
import 'package:flutterdemo/sliver/persistent_header_to_box_page.dart';
import 'package:flutterdemo/sliver/sliver_demo_page.dart';
import 'package:flutterdemo/sliver/sticky_header_page.dart';
import 'package:flutterdemo/ui/splash_page.dart';
import 'package:flutterdemo/widget/keys/swap_color_1.dart';

class DemoList extends StatefulWidget {
  const DemoList({Key? key}) : super(key: key);

  @override
  State<DemoList> createState() => _DemoListState();
}

class _DemoListState extends State<DemoList> {
  final List<Map<String, dynamic>> items = [
    {'title': 'App', 'page': const SplashPage()},
    {'title': 'demo', 'page': const DemoPage()},
    {'title': 'SwapColorDemo1', 'page': const SwapColorDemo1()},
    {'title': 'FlexibleHeaderPage', 'page': const FlexibleHeaderPage()},
    {'title': 'PersistentHeaderPage', 'page': const PersistentHeaderPage()},
    {'title': 'CustomSliverPage', 'page': const CustomSliverPage()},
    {'title': 'PersistentHeaderToBoxPage', 'page': const PersistentHeaderToBoxPage()},
    {'title': 'NestedScrollPage', 'page': const NestedScrollPage()},
    {'title': 'SnapAppBarPage', 'page': const SnapAppBarPage()},
    {'title': 'NestedTabPage', 'page': const NestedTabPage()},
    {'title': 'StickyHeaderPage', 'page': const StickyHeaderPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo List Page'),
      ),
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]['title']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => items[index]['page']),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
