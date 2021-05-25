import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oscar_web_resume/home/widgets/resposive_widgets/web/right_inside_cover.dart';

import '../../animated_page.dart';
import '../../central_page.dart';
import 'left_outside_cover.dart';

class WebResume extends StatefulWidget {

  @override
  _WebResumeState createState() => _WebResumeState();
}

class _WebResumeState extends State<WebResume> with TickerProviderStateMixin {
  AnimationController _controllerLeftCover;

  AnimationController _controllerRightCover;

  bool isClosed = true;
  int showInside = 0;

  @override
  void initState() {
    setControllers();

    super.initState();
  }

  void setControllers() {
    setState(() {
      _controllerLeftCover = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 650),
      );
      _controllerRightCover = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 650),
      );
    });
  }

  @override
  void dispose() {
    _controllerLeftCover.dispose();
    _controllerRightCover.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      alignment: Alignment.center,
      index: showInside,
      children: [
        _AnimatedResume(
          controllerRightCover: _controllerRightCover,
          controllerLeftCover: _controllerLeftCover,
          onOpenCover: _openCover,
        ),
        _OpenResumed(
          onOpenCover: _openCover,
        ),
      ],
    );
  }

  _openCover() async {
    if (isClosed) {
      //opens
      _controllerLeftCover.forward();
      await Future.delayed(Duration(milliseconds: 200));
      _controllerRightCover.forward()
        ..whenComplete(() {
          setState(() {
            showInside = 1;
          });
        });
    } else {
      //close
      setState(() {
        showInside = 0;
      });
      _controllerRightCover.reverse();
      await Future.delayed(Duration(milliseconds: 300));
      _controllerLeftCover.reverse();
    }
    setState(() {
      isClosed = !isClosed;
    });
  }
}

class _OpenResumed extends StatelessWidget {
  final Function() onOpenCover;

  const _OpenResumed({
    Key key,
    this.onOpenCover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50),
      child: Row(
        children: [
          ImageScreen(),
          CentralPage(),
          RightInsideCover(
            onOpenCover: onOpenCover,
          ),
        ],
      ),
    );
  }
}

class _AnimatedResume extends StatelessWidget {
  const _AnimatedResume({
    Key key,
    @required this.controllerRightCover,
    @required this.controllerLeftCover,
    this.onOpenCover,
  }) : super(key: key);

  final AnimationController controllerRightCover;
  final AnimationController controllerLeftCover;
  final Function() onOpenCover;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CentralPage(),
        AnimatedScreen(
          controller: controllerRightCover,
          inverseAnimation: true,
          inside: RightInsideCover(),
          cover: ImageScreen(),
        ),
        AnimatedScreen(
          controller: controllerLeftCover,
          inverseAnimation: false,
          cover: LeftOutsideCover(
            onOpenCover: onOpenCover,
          ),
          inside: ImageScreen(),
        ),
      ],
    );
  }
}
