import 'package:balmoranews/ui/common/export.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
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
        height: 54,
        decoration: BoxDecoration(
          gradient: inactive
              ? inactiveLinearPrimaryGradient
              : linearPrimaryGradient,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          // ignore: avoid_redundant_argument_values
          border: Border.all(color: buttonBorderColor, width: 1),
        ),
        child: Padding(
          padding: adaptiveSymmetricInset(horizontal: 8),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: poppins20w600.copyWith(color: primary),
            ),
          ),
        ),
      ),
    );
  }
}
