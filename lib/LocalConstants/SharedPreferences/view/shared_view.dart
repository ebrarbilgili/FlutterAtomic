import 'package:atomic_widgets/LocalConstants/SharedPreferences/constants/shared_constants.dart';
import 'package:flutter/material.dart';

class SharedPreferencesCounterWidget extends StatefulWidget {
  SharedPreferencesCounterWidget({Key? key}) : super(key: key);

  @override
  _SharedPreferencesCounterWidgetState createState() =>
      _SharedPreferencesCounterWidgetState();
}

class _SharedPreferencesCounterWidgetState
    extends State<SharedPreferencesCounterWidget> {
  int countValue = 0;

  final prefs = SharedPreferencesConstant.instance;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildText,
          buildElevatedButtonIncrement,
          buildElevatedButtonDecrement
        ],
      ),
    );
  }

  Text get buildText =>
      Text('Counting value: ${(prefs.getIntValue('count') ?? countValue)}');

  ElevatedButton get buildElevatedButtonDecrement {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          final countValue = (prefs.getIntValue('count') ?? 0) - 1;

          SharedPreferencesConstant.instance
              .setIntegerValue('count', countValue);
        });
      },
      child: Icon(Icons.remove),
    );
  }

  ElevatedButton get buildElevatedButtonIncrement {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          final countValue = (prefs.getIntValue('count') ?? 0) + 1;

          SharedPreferencesConstant.instance
              .setIntegerValue('count', countValue);
        });
      },
      child: Icon(Icons.add),
    );
  }
}
