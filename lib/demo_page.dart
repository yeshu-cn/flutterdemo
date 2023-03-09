import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'input text'),
          ),
        ],
      ),
    );
  }
}
