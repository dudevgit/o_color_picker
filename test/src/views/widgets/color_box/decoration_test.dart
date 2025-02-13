import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:o_color_picker/o_color_picker.dart';

/// Tests [OColorBoxDecoration]

void main() {
  group('[Views/Widgets/ColorBox] OColorBoxDecoration getBoxDecoration', () {
    testWidgets('Returns default theme background color', (tester) async {
      var boxDecoration = BoxDecoration();
      final bgColor = Colors.blue;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(colorScheme: ColorScheme.light(surface: bgColor)),
          home: Material(
            child: Builder(
              builder: (context) {
                return Center(
                  child: Container(
                    decoration: boxDecoration =
                        OColorBoxDecoration().getBoxDecoration(context),
                  ),
                );
              },
            ),
          ),
        ),
      );

      expect(boxDecoration.color, equals(bgColor));
    });

    testWidgets('Returns given color', (tester) async {
      var boxDecoration = BoxDecoration();
      final bgColor = Colors.blue;
      final givenColor = Colors.red;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(colorScheme: ColorScheme.light(surface: bgColor)),
          home: Material(
            child: Builder(
              builder: (context) {
                return Center(
                  child: Container(
                    decoration: boxDecoration =
                        OColorBoxDecoration(color: givenColor)
                            .getBoxDecoration(context),
                  ),
                );
              },
            ),
          ),
        ),
      );

      expect(boxDecoration.color, equals(givenColor));
    });

    testWidgets('Returns proper border', (tester) async {
      var boxDecoration = BoxDecoration();
      final boxBorder = OColorBoxBorder(color: Colors.green);
      final bgColor = Colors.blue;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(colorScheme: ColorScheme.light(surface: bgColor)),
          home: Material(
            child: Builder(
              builder: (context) {
                return Center(
                  child: Container(
                    decoration: boxDecoration = OColorBoxDecoration(
                      border: boxBorder,
                    ).getBoxDecoration(context),
                  ),
                );
              },
            ),
          ),
        ),
      );

      expect(boxDecoration.border, equals(boxBorder.border));
    });
  });
}
