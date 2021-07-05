import 'package:flutter/material.dart';
import 'dart:math' as math;

class BoundingBox extends StatelessWidget {
  final List<dynamic> results;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;
  final String model;

  BoundingBox(this.results, this.previewH, this.previewW, this.screenH,
      this.screenW, this.model);

  @override
  Widget build(BuildContext context) {
    List<Widget> _renderBoxes() {
      return results.map((re) {
        print('***************************' +
            re["detectedClass"].toString() +
            '***************************');

        return Container(
          child: Text(
            "${re["detectedClass"]}",
          ),
        );
      }).toList();
    }

    return Stack(
      children: _renderBoxes(),
    );
  }
}
