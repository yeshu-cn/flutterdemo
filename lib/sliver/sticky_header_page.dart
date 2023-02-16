import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class StickyHeaderPage extends StatefulWidget {
  const StickyHeaderPage({Key? key}) : super(key: key);

  @override
  State<StickyHeaderPage> createState() => _StickyHeaderPageState();
}

class _StickyHeaderPageState extends State<StickyHeaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CustomScrollView(
        slivers: [
          _StickyHeaderList(index: 0),
          _StickyHeaderList(index: 1),
          _StickyHeaderList(index: 2),
          _StickyHeaderList(index: 3),
        ],
      ),
    );
  }
}

class _StickyHeaderList extends StatelessWidget {
  const _StickyHeaderList({
    Key? key,
    this.index,
  }) : super(key: key);

  final int? index;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('index $index'),
        ),
        color: Colors.green,
      ),
      sticky: true,
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => ListTile(
            onTap: () {
              debugPrint('tile $i');
            },
            leading: CircleAvatar(
              child: Text('$index'),
            ),
            title: Text('List tile #$i'),
          ),
          childCount: 6,
        ),
      ),
    );
  }
}
