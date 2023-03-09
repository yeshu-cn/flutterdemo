import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class BlurryImage extends StatelessWidget {
  final String imageUrl;
  final double blur;

  const BlurryImage({Key? key, required this.imageUrl, this.blur = 5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: getImage(imageUrl),
      builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(
                color: Colors.white.withOpacity(0),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<ui.Image> getImage(String imageUrl) async {
    final completer = Completer<ui.Image>();
    final image = NetworkImage(imageUrl);
    image.resolve(const ImageConfiguration()).addListener(
          ImageStreamListener(
            (ImageInfo info, bool _) => completer.complete(info.image),
          ),
        );
    return completer.future;
  }
}
