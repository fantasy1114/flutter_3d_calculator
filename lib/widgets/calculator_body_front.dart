import 'package:calculator_3d/drawing/calculator_body_clipper.dart';
import 'package:calculator_3d/drawing/calculator_body_painter.dart';
import 'package:calculator_3d/utils/calculator_config.dart';
import 'package:flutter/material.dart';

class CalculatorBodyFront extends StatelessWidget {
  const CalculatorBodyFront({
    super.key,
    required this.config,
    required this.animationController,
    required this.rimSide,
    required this.glowOffsetAnimation,
  });

  final CalculatorConfig config;
  final AnimationController animationController;
  final Animation<Offset> glowOffsetAnimation;
  final double rimSide;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CalculatorBodyClipper(config: config),
      child: CustomPaint(
        painter: CalculatorBodyPainter(
          config: config,
          animationController: animationController,
        ),
        child: Center(
          child: Container(
            width: rimSide,
            height: rimSide,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                config.keyBorderRadius,
              ),
              gradient: LinearGradient(
                colors: [
                  config.baseColor.shade300,
                  config.baseColor.shade200,
                  config.baseColor.shade100,
                  config.baseColor.shade50,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: const [0.01, 0.49, 0.52, 0.7],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  offset: glowOffsetAnimation.value,
                  blurRadius: 6,
                  blurStyle: BlurStyle.solid,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
