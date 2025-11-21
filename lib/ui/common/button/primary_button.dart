import 'package:balmoranews/ui/common/export.dart';
import 'package:flutter/widgets.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    required this.onPressed,
    this.inactive = false,
    super.key,
  });
  final String text;
  final VoidCallback onPressed;
  final bool inactive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: inactive ? null : onPressed,
      child: AdaptiveSizeDecorated(
        width: 300,
        height: 54,
        decoration: BoxDecoration(
          gradient: inactive
              ? inactiveLinearPrimaryGradient
              : linearPrimaryGradient,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          // ignore: avoid_redundant_argument_values
          border: Border.all(color: buttonBorderColor, width: 1),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: poppins20w600.copyWith(color: primary),
          ),
        ),
      ),
    );
  }
}
