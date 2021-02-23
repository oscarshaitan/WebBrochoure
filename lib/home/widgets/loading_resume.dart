import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LoadingResume extends StatelessWidget {
  final Function onFinished;

  const LoadingResume({
    Key key,
    this.onFinished,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotateAnimatedTextKit(
          onFinished: onFinished,
          text: ["FETCHING THE RESUME", "BUILDING THE AWESOMENESS",],
          isRepeatingAnimation: false,
          textStyle: Theme.of(context).textTheme.headline3,
          textAlign: TextAlign.start),
    );
  }
}
