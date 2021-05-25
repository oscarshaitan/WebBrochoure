import 'package:flutter/material.dart';
import 'package:oscar_web_resume/_core/functions.dart';
import 'package:oscar_web_resume/_core/widgets/bookmark_button.dart';

class LeftOutsideCover extends StatelessWidget {
  final Function() onOpenCover;

  const LeftOutsideCover({
    Key key,
    @required this.onOpenCover,
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
            Positioned.fill(
                child: Container(
              height: context.getHeightPage,
              width: context.getWithPage,
              margin: EdgeInsets.only(left: 8, right: 8, top: 32),
              child: ListView(
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text('BROCHURE TITLE',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('Brochure subtitle',
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
                              title: 'News example 1',
                              value: 'SHORT DESCRIPTION OF NEWS 1',
                            ),
                            CoverLabel(
                              title: 'News example 2',
                              value: 'SHORT DESCRIPTION OF NEWS 2',
                            ),
                            CoverLabel(
                              title: 'News example 3',
                              value: 'SHORT DESCRIPTION OF NEWS 3',
                            ),
                            CoverLabel(
                              title: 'News example 4',
                              value: 'SHORT DESCRIPTION OF NEWS 4',
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
                        'Brochure animation example.',
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
            )),
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
