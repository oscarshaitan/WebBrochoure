import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oscar_web_resume/_core/functions.dart';

import 'widgets/animated_page.dart';
import 'widgets/central_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controllerLeftCover;
  AnimationController _controllerRightCover;
  bool isClosed = true;

  @override
  void initState() {
    _controllerLeftCover = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _controllerRightCover = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 150, horizontal: 50),
        child: Column(
          children: [
            Center(
              child: Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CentralPage(),
                    AnimatedScreen(
                      controller: _controllerRightCover,
                      inverseAnimation: true,
                      cover: CoverScreen(
                          text: 'Cover',
                          color: Colors.blue,
                          onPressed: _openCover),
                      inside: ImageScreen(),
                    ),
                    AnimatedScreen(
                      controller: _controllerLeftCover,
                      inverseAnimation: false,
                      cover: _LeftCover(
                        onOpenCover: _openCover,
                      ),
                      inside: ImageScreen(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _openCover() async {
    if (isClosed) {
      //opens
      _controllerLeftCover.forward();
      await Future.delayed(Duration(milliseconds: 400));

      _controllerRightCover.forward();
    } else {
      //close
      _controllerRightCover.reverse();
      await Future.delayed(Duration(milliseconds: 400));
      _controllerLeftCover.reverse();
    }
    setState(() {
      isClosed = !isClosed;
    });
  }
}

class _LeftCover extends StatelessWidget {
  final Function() onOpenCover;

  const _LeftCover({
    Key key,
    @required this.onOpenCover,
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
              'OSCAR TIGREROS',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'Flutter & Android Developer',
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
                      value: 'COLOMBIA',
                    ),
                    CoverLabel(
                      title: 'I CREATE',
                      value: 'Flutter Apps\nAndroid Apps',
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
