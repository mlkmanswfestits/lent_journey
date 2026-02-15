import 'dart:ui';
import 'package:flutter/material.dart';
import '../utils/theme.dart';

class HolyCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final bool showCross;
  final bool isGlass;

  const HolyCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.backgroundColor,
    this.showCross = false,
    this.isGlass = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color:
                CatholicTheme.lentenIndigo.withValues(alpha: isGlass ? 0.08 : 0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: isGlass
              ? Colors.white.withValues(alpha: 0.2)
              : Colors.black.withValues(alpha: 0.02),
          width: 1.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: isGlass ? 15.0 : 0.0,
            sigmaY: isGlass ? 15.0 : 0.0,
          ),
          child: Material(
            color: isGlass
                ? (backgroundColor?.withValues(alpha: 0.1) ??
                    Colors.white.withValues(alpha: 0.1))
                : (backgroundColor ?? CatholicTheme.pureWhite),
            child: InkWell(
              onTap: onTap,
              child: Stack(
                children: [
                  if (showCross)
                    Positioned(
                      right: -10,
                      top: -10,
                      child: Opacity(
                        opacity: isGlass ? 0.1 : 0.05,
                        child: Transform.rotate(
                          angle: 0.2,
                          child: const Icon(
                            Icons.add,
                            size: 80,
                            color: CatholicTheme.lentenIndigo,
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: padding ?? const EdgeInsets.all(24),
                    child: child,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
