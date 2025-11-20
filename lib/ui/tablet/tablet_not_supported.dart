import 'package:flutter/widgets.dart';

class TabletAlbumNotSupported extends StatelessWidget {
  const TabletAlbumNotSupported({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tablet Album Not Supported',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

class TabletPortraitNotSupported extends StatelessWidget {
  const TabletPortraitNotSupported({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tablet Portrait Not Supported',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
