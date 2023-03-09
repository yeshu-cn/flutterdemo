import 'package:flutter/material.dart';

class DiscoverTab extends StatelessWidget {
  const DiscoverTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Tab'),
      ),
      body: const Center(
        child: Text('Discover Tab'),
      ),
    );
  }
}