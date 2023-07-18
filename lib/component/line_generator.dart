import 'package:flutter/material.dart';
import '../models/colors.dart';

class LineGen extends StatelessWidget {
  final List lines;
  const LineGen({super.key, required this.lines});

  @override
  Widget build(BuildContext context) {
    ColorPallete color = ColorPallete();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        4,
        (index) => Container(
          height: 2,
          width: lines[index],
          color: color.black,
          margin: const EdgeInsets.symmetric(vertical: 14.0),
        ),
      ),
    );
  }
}
