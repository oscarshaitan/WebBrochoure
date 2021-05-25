import 'package:flutter/material.dart';
import 'package:oscar_web_resume/_core/functions.dart';
import 'package:oscar_web_resume/_core/widgets/bookmark_button.dart';

import '../../page_title.dart';

class RightInsideCover extends StatelessWidget {
  final Function() onOpenCover;

  const RightInsideCover({Key key, this.onOpenCover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(0),
      color: Colors.white,
      child: Container(
        height: context.getHeightPage,
        width: context.getWithPage,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: context.getHeightPage,
                width: context.getWithPage,
                color: Colors.white,
                child: Image.asset(
                  'lib/_core/assets/image/cover_2.jpeg',
                  height: context.getHeightPage,
                  width: context.getWithPage,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 64,
                ),
                child: PageTitle(
                  title: 'CONTACT',
                ),
              ),
              BookMarkButton(
                rotated: true,
                onPressed: onOpenCover,
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                backGroundColor: Colors.black,
                backGroundColorOnHover: Color(0XFF333333),
                dotColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
