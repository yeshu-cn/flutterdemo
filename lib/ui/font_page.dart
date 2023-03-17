import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/ui/theme_cubit.dart';
import 'package:google_fonts/google_fonts.dart';


class FontPage extends StatefulWidget {
  const FontPage({Key? key}) : super(key: key);

  @override
  State<FontPage> createState() => _FontPageState();
}

class _FontPageState extends State<FontPage> {
  String _font = 'Roboto';

  @override
  Widget build(BuildContext context) {
    // 显示google font列表, style显示对应的字体， 点击列表项，设置字体
    return Scaffold(
      appBar: AppBar(
        title: const Text('字体'),
      ),
      body: Scrollbar(
        child: ListView(
          children: GoogleFonts.asMap().entries.map((entry) {
            return ListTile(
              title: Text(entry.key, style: GoogleFonts.getFont(entry.key)),
              onTap: () {
                // 改变整个主题的字体
                context.read<ThemeCubit>().setFont(GoogleFonts.getFont(entry.key).fontFamily!);
                setState(() {
                  _font = entry.key;
                });
              },
              trailing: _font == entry.key ? const Icon(Icons.check, color: Colors.black,) : null,
            );
          }).toList(),
        ),
      ),
    );
  }
}
