import 'package:atomic_widgets/Containers/random_color_container.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({Key? key}) : super(key: key);

  String get asset => 'assets/lotties/ball-spinner.json';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RandomColorContainer(
        child: Lottie.asset(asset),
      ),
    );
  }
}
