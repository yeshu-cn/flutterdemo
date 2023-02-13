// 构建固定高度的SliverList，count为列表项属相
import 'package:flutter/material.dart';

Widget buildSliverList([int count = 5]) {
  return SliverFixedExtentList(
    itemExtent: 50,
    delegate: SliverChildBuilderDelegate(
          (context, index) {
        return ListTile(title: Text('$index'));
      },
      childCount: count,
    ),
  );
}