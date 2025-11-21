import 'package:balmoranews/ui/common/color.dart';
import 'package:balmoranews/ui/common/text_style.dart';
import 'package:flutter/widgets.dart';

class NetworkImageLoader extends StatelessWidget {
  const NetworkImageLoader({required this.url, super.key});
  final String? url;

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      return ColoredBox(
        color: const Color(0x33000000),
        child: Center(
          child: Text(
            'no image',
            style: poppins16w500.copyWith(
              color: primary,
            ),
          ),
        ),
      );
    }

    return Image.network(
      url!,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => ColoredBox(
        color: const Color(0x33000000),
        child: Center(
          child: Text(
            'broken',
            style: poppins16w500.copyWith(
              color: primary,
            ),
          ),
        ),
      ),
      loadingBuilder: (_, child, loading) {
        if (loading == null) return child;
        return ColoredBox(
          color: const Color(0x33000000),
          child: Center(
            child: Text(
              'loading',
              style: poppins16w500.copyWith(
                color: primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
