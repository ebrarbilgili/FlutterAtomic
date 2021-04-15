import 'dart:math';

import 'package:flutter/material.dart';

class RandomColorContainer extends StatelessWidget {
  const RandomColorContainer({Key? key, required this.child}) : super(key: key);
  final Widget? child;

  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: randomColor,
      height: MediaQuery.of(context).size.height,
      child: child,
    );
  }
}
