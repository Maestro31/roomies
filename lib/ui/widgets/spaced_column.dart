import 'package:flutter/material.dart';

class SpacedColumn extends StatelessWidget {
  final List<Widget> children;
  final double columnGap;

  const SpacedColumn({Key? key, required this.children, this.columnGap = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children
          .map(
            (child) => Padding(
              padding: EdgeInsets.only(bottom: columnGap),
              child: child,
            ),
          )
          .toList(),
    );
  }
}
