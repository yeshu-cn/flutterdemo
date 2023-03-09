import 'package:flutter/material.dart';
import 'package:flutterdemo/ui/item_grid_list_page.dart';
import 'package:flutterdemo/ui/item_list_page.dart';
import 'package:flutterdemo/ui/item_list_skeleton_page.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<Map<String, dynamic>> items = [
    {'title': 'item list', 'page': const ItemListPage()},
    {'title': 'item grid list', 'page': const ItemGridListPage()},
    {'title': 'item list skeleton', 'page': const ItemListSkeletonPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Tab'),
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