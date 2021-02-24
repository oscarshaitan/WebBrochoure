import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oscar_web_resume/_core/functions.dart';
import 'package:oscar_web_resume/_core/models/resume_owner.dart';

import '../animated_page.dart';
import '../central_page.dart';

class WebResume extends StatefulWidget {
  /*
  final Function onOpenCover;*/
  /*final AnimationController controllerRightCover;
  final AnimationController controllerLeftCover;*/
  final ResumeOwner resumeOwner;

  const WebResume({
    Key key,
    /*
    @required this.onOpenCover,
    @required this.controllerRightCover,
    @required this.controllerLeftCover,*/
    @required this.resumeOwner,
  }) : super(key: key);

  @override
  _WebResumeState createState() => _WebResumeState();
}

class _WebResumeState extends State<WebResume> with TickerProviderStateMixin {
  AnimationController _controllerLeftCover;

  AnimationController _controllerRightCover;

  bool isClosed = true;

  @override
  void initState() {
    _controllerLeftCover = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 650),
    );
    _controllerRightCover = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 650),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controllerLeftCover.dispose();
    _controllerRightCover.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CentralPage(),
        AnimatedScreen(
          controller: _controllerRightCover,
          inverseAnimation: true,
          inside: _LeftCover(
            onOpenCover: _openCover,
            resumeOwner: widget.resumeOwner,
          ),
          cover: ImageScreen(),
        ),
        AnimatedScreen(
          controller: _controllerLeftCover,
          inverseAnimation: false,
          cover: _LeftCover(
            onOpenCover: _openCover,
            resumeOwner: widget.resumeOwner,
          ),
          inside: ImageScreen(),
        ),
      ],
    );
  }

  _openCover() async {
    if (isClosed) {
      //opens
      _controllerLeftCover.forward();
      await Future.delayed(Duration(milliseconds: 200));

      _controllerRightCover.forward();
    } else {
      //close
      _controllerRightCover.reverse();
      await Future.delayed(Duration(milliseconds: 200));
      _controllerLeftCover.reverse();
    }
    setState(() {
      isClosed = !isClosed;
    });
  }
}

class _LeftCover extends StatelessWidget {
  final Function() onOpenCover;
  final ResumeOwner resumeOwner;

  const _LeftCover({
    Key key,
    @required this.onOpenCover,
    @required this.resumeOwner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(0),
      color: Colors.white,
      child: Container(
        height: context.getHeightPage,
        width: context.getWithPage,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0XFF207E7D), Color(0XFF86B297)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal),
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 32),
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      resumeOwner.name.toUpperCase().replaceFirst(' ', '\n'),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    resumeOwner.subtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: 23),
                  ),
                  SizedBox.fromSize(
                    size: Size(0, 32),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CoverLabel(
                              title: 'I AM FROM',
                              value: resumeOwner.from.toUpperCase(),
                            ),
                            CoverLabel(
                              title: 'I CREATE',
                              value: resumeOwner.create.join('\n'),
                            ),
                            CoverLabel(
                              title: 'I Like',
                              value: resumeOwner.like.join('\n'),
                            ),
                            CoverLabel(
                              title: 'SEARCHING JOB',
                              value: resumeOwner.searchingJobs,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: ClipOval(
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.asset(
                                'lib/_core/assets/image/profile_pic.png',
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'A Flutter Web version of my resume.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 23),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ClipPath(
                clipper: MyCustomClipper(),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: onOpenCover,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Text('Open'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width * .25, size.height * .5)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CoverLabel extends StatelessWidget {
  final String title;
  final String value;

  const CoverLabel({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style:
                  Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 22),
            ),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
