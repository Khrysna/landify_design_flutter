import 'package:flutter/material.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/gen/colors.gen.dart';

class TextLinkButton extends StatelessWidget {
  const TextLinkButton.light(this.text, {super.key}) : this.color = ColorName.neutral900;

  const TextLinkButton.dark(this.text, {super.key}) : this.color = Colors.white;

  final String text;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          minimumSize: null,
          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 12)),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return ColorName.primary600;
              }

              return color;
            },
          ),
        ),
        child: Text(text, style: AppTextStyles.bodySmallSemiBold),
      ),
    );
  }
}
