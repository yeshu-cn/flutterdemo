import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/ui/about_page.dart';
import 'package:flutterdemo/ui/theme_cubit.dart';

import 'font_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _isDarkMode;

  @override
  void initState() {
    setState(() {
      _isDarkMode = context.read<ThemeCubit>().state.themeMode == ThemeMode.dark ? true : false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('通知设置'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('黑夜模式'),
            value: _isDarkMode,
            onChanged: (value) {
              setState(() {
                _isDarkMode = value;
                context.read<ThemeCubit>().toggleDarkMode(_isDarkMode);
              });
            },
          ),
          ExpansionTile(
            title: const Text('主题'),
            children: [
              // 显示materialColors 中的颜色列表
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: Colors.primaries.map((color) {
                    return InkWell(
                      onTap: () {
                        // 点击颜色，设置主题
                        context.read<ThemeCubit>().setThemeColorSeed(color);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        color: color,
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
          ListTile(
            title: const Text('字体'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FontPage()));
            },
          ),
          ListTile(
            title: const Text('语言'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('好评和反馈'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: const Text('帮助'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: const Text('关于'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
            },
          ),
        ],
      ),
    );
  }
}
