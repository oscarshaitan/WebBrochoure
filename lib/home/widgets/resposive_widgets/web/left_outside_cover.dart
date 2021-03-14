import 'package:flutter/material.dart';
import 'package:oscar_web_resume/_core/models/resume_owner.dart';
import 'package:oscar_web_resume/_core/widgets/bookmark_button.dart';

import 'package:oscar_web_resume/_core/functions.dart';

class LeftOutsideCover extends StatelessWidget {
  final Function() onOpenCover;
  final ResumeOwner resumeOwner;

  const LeftOutsideCover({
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
              margin: EdgeInsets.only(left: 8, right: 8, top: 32),
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      resumeOwner.name.toUpperCase(),
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
            BookMarkButton(
              alignment: Alignment.centerRight,
              onPressed: onOpenCover,
              backGroundColor: Colors.red,
              backGroundColorOnHover: Colors.redAccent,
              dotColor: Colors.black,
              child: Text(
                'Open',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
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
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
