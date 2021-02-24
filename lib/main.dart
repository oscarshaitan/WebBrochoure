import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/home_page.dart';
import 'injector_container.dart' as injection;

void main() {
  injection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: TextTheme(
          headline1: GoogleFonts.robotoSlab(
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(-8, 8),
                blurRadius: 1.0,
                color: Colors.deepOrangeAccent,
              ),
              Shadow(
                offset: Offset(-4.0, 4.0),
                blurRadius: 1.0,
                color: Colors.black45,
              ),
            ],
          ),
          subtitle1: GoogleFonts.robotoSlab(
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 1.0,
                color: Colors.black45,
              ),
            ],
          ),
          subtitle2: GoogleFonts.robotoSlab(
            color: Colors.orangeAccent,
            fontWeight: FontWeight.bold,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 1.0,
                color: Colors.black45,
              ),
            ],
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
