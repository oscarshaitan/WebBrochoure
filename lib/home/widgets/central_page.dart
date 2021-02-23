import 'package:flutter/material.dart';
import 'package:oscar_web_resume/_core/constants.dart';

import 'package:oscar_web_resume/_core/functions.dart';

class CentralPage extends StatelessWidget {
  const CentralPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeightPage,
      width: context.getWithPage,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: pageDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'CenterPage',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
