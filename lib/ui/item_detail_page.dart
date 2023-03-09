import 'package:flutter/material.dart';

class ItemDetailPage extends StatefulWidget {
  final String item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Detail"),
      ),
      body: Center(
        child: Text(widget.item),
      ),
    );
  }
}
