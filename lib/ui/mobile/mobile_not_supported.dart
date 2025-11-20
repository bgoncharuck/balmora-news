import 'package:flutter/widgets.dart';

class MobileAlbumNotSupported extends StatelessWidget {
  const MobileAlbumNotSupported({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Mobile Album Not Supported',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

class MobilePortraitNotSupported extends StatelessWidget {
  const MobilePortraitNotSupported({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Mobile Portrait Not Supported',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
