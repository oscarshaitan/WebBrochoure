import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oscar_web_resume/home/widgets/resposive_widgets/web/web_resume.dart';
import 'package:responsive_builder/responsive_builder.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 450),
          child: // Construct and pass in a widget builder per screen type
              ScreenTypeLayout.builder(
            mobile: (BuildContext context) => Container(color: Colors.blue),
            tablet: (BuildContext context) => Container(color: Colors.yellow),
            desktop: (BuildContext context) => WebResume(),
          ),
        ),
      ),
    );
  }
}
