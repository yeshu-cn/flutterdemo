import 'package:flutter/material.dart';
import 'package:flutterdemo/nested/nested_scroll_page.dart';
import 'package:flutterdemo/nested/nested_tab_page.dart';
import 'package:flutterdemo/nested/snap_appbar_page.dart';
import 'package:flutterdemo/sliver/flexible_header_page.dart';
import 'package:flutterdemo/sliver/persistent_header_page.dart';
import 'package:flutterdemo/sliver/persistent_header_to_box_page.dart';
import 'package:flutterdemo/sliver/sliver_demo_page.dart';
import 'package:flutterdemo/sliver/sliver_persistent_header_to_box.dart';
import 'package:flutterdemo/sliver/sticky_header_page.dart';
import 'package:flutterdemo/widget/keys/swap_color_1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SwapColorDemo1(),
            ));
          },
          title: const Text('SwapColorDemo1'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FlexibleHeaderPage(),
            ));
          },
          title: const Text('slivers'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PersistentHeaderPage(),
            ));
          },
          title: const Text('persistent header page'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CustomSliverPage(),
            ));
          },
          title: const Text('custom sliver: flexible header'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PersistentHeaderToBoxPage(),
            ));
          },
          title: const Text('custom sliver: persistent header'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NestedScrollPage(),
            ));
          },
          title: const Text('nested scroll'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SnapAppBarPage(),
            ));
          },
          title: const Text('snap app bar'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NestedTabPage(),
            ));
          },
          title: const Text('nested tab page'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const StickyHeaderPage(),
            ));
          },
          title: const Text('list with stick header'),
        ),
      ],
    );
  }
}
