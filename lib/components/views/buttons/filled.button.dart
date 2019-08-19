import 'package:flutter/material.dart';
import 'package:pingis/utils/theme.dart';

class FilledButton extends StatelessWidget {
  final double height, width;
  final Widget child;
  final Function onPressed;
  final List<Color> colors;
  final BorderRadius borderRadius;
  final double boxShadow;

  FilledButton({
    @required
    this.height,
    @required
    this.width,
    @required
    this.child,
    @required
    this.onPressed,
    @optionalTypeArgs
    List<Color> colors,
    BorderRadius borderRadius,
    this.boxShadow = 8,
  })
  : assert(height != null),
    assert(width != null),
    assert(child != null),
    assert(onPressed != null),
    colors = colors ?? GRADIENT_COLORS,
    borderRadius = borderRadius ?? BorderRadius.circular(6);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
        ),
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: colors.last.withOpacity(0.3),
            offset: Offset(0, boxShadow),
            blurRadius: boxShadow,
          )
        ]
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}