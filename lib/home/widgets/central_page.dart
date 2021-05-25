import 'package:flutter/material.dart';
import 'package:oscar_web_resume/_core/functions.dart';

class CentralPage extends StatelessWidget {
  const CentralPage({
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
          'lib/_core/assets/image/center.jpeg',
          height: context.getHeightPage,
          width: context.getWithPage,
        ),
      ),
    );
  }
}
