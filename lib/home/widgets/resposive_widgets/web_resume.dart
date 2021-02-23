
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oscar_web_resume/_core/functions.dart';
import 'package:oscar_web_resume/_core/models/resume_owner.dart';

import '../animated_page.dart';
import '../central_page.dart';

class WebResume extends StatelessWidget {
  final Function onOpenCover;
  final AnimationController controllerRightCover;
  final AnimationController controllerLeftCover;
  final ResumeOwner resumeOwner;

  const WebResume({
    Key key,
    @required this.onOpenCover,
    @required this.controllerRightCover,
    @required this.controllerLeftCover,
    @required this.resumeOwner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 150, horizontal: 50),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CentralPage(),
              AnimatedScreen(
                controller: controllerRightCover,
                inverseAnimation: true,
                inside: _LeftCover(
                  onOpenCover: onOpenCover,
                  resumeOwner: resumeOwner,
                ),
                cover: ImageScreen(),
              ),
              AnimatedScreen(
                controller: controllerLeftCover,
                inverseAnimation: false,
                cover: _LeftCover(
                  onOpenCover: onOpenCover,
                  resumeOwner: resumeOwner,
                ),
                inside: ImageScreen(),
              ),
            ],
          ),
        ),
      ),
    );
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
    return Container(
      color: Colors.white,
      child: Container(
        height: context.getHeightPage,
        width: context.getWithPage,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.teal, Colors.teal.withOpacity(0.5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal),
        ),
        child: Column(
          children: [
            Text(
              resumeOwner.name.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              resumeOwner.subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox.fromSize(
              size: Size(0, 32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('lib/_core/assets/image/profile_pic.png'),
                )
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: onOpenCover,
                child: Text('Flip!'),
              ),
            )
          ],
        ),
      ),
    );
  }
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
          Text(
            title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            value,
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
