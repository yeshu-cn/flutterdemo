import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/demo_list_page.dart';
import 'package:flutterdemo/ui/theme_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, MyTheme>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: theme.theme,
            themeMode: theme.themeMode,
            // darkTheme: ThemeData(useMaterial3: true, colorScheme: defaultDarkColorScheme,),
            darkTheme: theme.darkTheme,
            // 不能用copy,构造函数会根据brightness自动设置onPrimary,onSecondary,onTertiary,onPrimaryContainer,onSecondaryContainer,onTertiaryContainer,而copy不会,它仅仅是改变字段值
            // darkTheme: theme.theme.copyWith(colorScheme: theme.theme.colorScheme.copyWith(brightness: Brightness.dark,)),
            home: const DemoList(),
          );
        },
      ),
    );
  }
}
