import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutterdemo/ui/settings_page.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final avatarUrl =
      'https://images.unsplash.com/photo-1654447581006-a114faf7088d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1114&q=80';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300.0,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
              avatarUrl,
            ),
            fit: BoxFit.fill,
          )),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 0.5),
                child: Container(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                        avatarUrl,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      '用户名',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      '用户介绍',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_album),
                title: const Text('相册'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('收藏'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.card_giftcard),
                title: const Text('卡包'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('设置'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                },
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
