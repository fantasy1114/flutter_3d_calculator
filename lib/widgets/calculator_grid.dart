import 'package:calculator_3d/utils/calculator_config.dart';
import 'package:calculator_3d/utils/calculator_key_data.dart';
import 'package:flutter/material.dart';

typedef KeyBuilder = Widget Function(
  BuildContext context,
  CalculatorKeyData key,
);

class CalculatorGrid extends StatelessWidget {
  const CalculatorGrid({
    super.key,
    required this.keyBuilder,
    required this.config,
  });

  final KeyBuilder keyBuilder;
  final CalculatorConfig config;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: config.calculatorWidth,
      height: config.calculatorHeight,
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                width: 300 + config.keysGap * 2,
                height: 300 + config.keysGap * 2,
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: config.keysGap,
                  mainAxisSpacing: config.keysGap,
                  children: List.generate(
                    9,
                    (index) {
                      int itemsPerRow = 3;
                      int colIndex = index % itemsPerRow;
                      int reverseColIndex = itemsPerRow - colIndex - 1;

                      return keyBuilder(
                        context,
                        CalculatorKeyData(
                          type: CalculatorKeyType.fromNumber(
                            (9 - index) + colIndex - reverseColIndex,
                          ),
                          color: config.baseColor,
                          size: Size(config.keySideMin, config.keySideMin),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: config.keysGap),
              Row(
                children: [
                  keyBuilder(
                    context,
                    CalculatorKeyData(
                      type: CalculatorKeyType.zero,
                      color: config.baseColor,
                      size: Size(config.keySideMin * 2 + config.keysGap,
                          config.keySideMin),
                    ),
                  ),
                  SizedBox(width: config.keysGap),
                  keyBuilder(
                    context,
                    CalculatorKeyData(
                      type: CalculatorKeyType.dot,
                      color: config.baseColor,
                      size: Size(config.keySideMin, config.keySideMin),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: config.keysGap),
          Column(
            children: [
              keyBuilder(
                context,
                CalculatorKeyData(
                  type: CalculatorKeyType.plus,
                  color: Colors.orange,
                  size: Size(
                    config.keySideMin,
                    config.keySideMin * 2 + config.keysGap,
                  ),
                ),
              ),
              SizedBox(height: config.keysGap),
              keyBuilder(
                context,
                CalculatorKeyData(
                  type: CalculatorKeyType.minus,
                  color: Colors.orange,
                  size: Size(
                    config.keySideMin,
                    config.keySideMin * 2 + config.keysGap,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
