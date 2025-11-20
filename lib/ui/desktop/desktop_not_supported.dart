import 'package:flutter/widgets.dart';

class DesktopNotSupported extends StatelessWidget {
  const DesktopNotSupported({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Desktop Not Supported', textDirection: TextDirection.ltr),
    );
  }
}
