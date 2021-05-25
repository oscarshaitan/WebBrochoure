import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oscar_web_resume/_core/functions.dart';

class AnimatedScreen extends StatefulWidget {
  final AnimationController controller;
  final bool inverseAnimation;
  final Widget cover;
  final Widget inside;

  AnimatedScreen({
    this.controller,
    this.inverseAnimation,
    this.cover,
    this.inside,
  });

  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  Widget visibleScreen = Container();

  Widget getScreen() {
    if (widget.inverseAnimation) {
      if (_animation.value > -0.5) {
        visibleScreen = widget.cover;
      } else {
        visibleScreen = Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: widget.inside,
        );
      }
    } else {
      if (_animation.value < 0.5) {
        visibleScreen = widget.cover;
      } else {
        visibleScreen = Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: widget.inside,
        );
      }
    }
    return visibleScreen;
  }

  @override
  void initState() {
    _animation = widget.inverseAnimation
        ? Tween(begin: 0.0, end: -1.0).animate(widget.controller)
        : Tween(begin: 0.0, end: 1.0).animate(widget.controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: widget.inverseAnimation
          ? FractionalOffset.centerRight
          : FractionalOffset.centerLeft,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.0001)
        ..rotateY(pi * _animation.value),
      child: getScreen(),
    );
  }
}

class ImageScreen extends StatelessWidget {
  const ImageScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(0),
      child: Container(
        height: context.getHeightPage,
        width: context.getWithPage,
        color: Colors.black,
        child: Image.asset(
          'lib/_core/assets/image/cover_1.jpg',
          height: context.getHeightPage,
          width: context.getWithPage,
        ),
      ),
    );
  }
}
