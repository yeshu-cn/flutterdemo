import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Future<String> getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const FlutterLogo(size: 100),
          const SizedBox(height: 16),
          const Text(
            'Flutter 实现关于页面',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 8),
          FutureBuilder(
            future: getVersionNumber(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text('版本号: ${snapshot.data}');
              } else {
                return Container();
              }
            },
          ),
          const SizedBox(height: 16),
          const Text(
            '这是一个演示应用程序，用于展示如何在 Flutter 中实现关于页面。',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const Text(
            '版权所有 © 2023 Flutter 实现关于页面',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
