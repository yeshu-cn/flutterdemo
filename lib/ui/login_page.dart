import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterdemo/demo_list_page.dart';
import 'package:flutterdemo/ui/home_page.dart';
import 'package:flutterdemo/ui/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController()..text = 'admin';
  final _passwordController = TextEditingController()..text = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/login.svg',
                  height: 100,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _usernameController,
                  validator: (value) {
                    if (null == value || value.isEmpty) {
                      return '请输入用户名';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: '用户名',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (null == value || value.isEmpty) {
                      return '请输入密码';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: '密码',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  },
                  child: const Text('登录'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text('没有账号？点击注册'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
