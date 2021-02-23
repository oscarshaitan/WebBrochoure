import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oscar_web_resume/home/cubit/home_cubit.dart';
import 'package:oscar_web_resume/home/widgets/loading_resume.dart';
import 'package:oscar_web_resume/home/widgets/resposive_widgets/web_resume.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../injector_container.dart';

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
      duration: Duration(milliseconds: 400),
    );
    _controllerRightCover = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
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
      backgroundColor: Colors.black45,
      body: BlocProvider<HomeCubit>(
        create: (context) => sl(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/_core/assets/image/wood_wall.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 450),
                child: state is HomeInitial
                    ? LoadingResume(
                        onFinished: () {
                          context.read<HomeCubit>().loadResume();
                        },
                      )
                    : // Construct and pass in a widget builder per screen type
                    ScreenTypeLayout.builder(
                        mobile: (BuildContext context) =>
                            Container(color: Colors.blue),
                        tablet: (BuildContext context) =>
                            Container(color: Colors.yellow),
                        desktop: (BuildContext context) => WebResume(
                          resumeOwner: state.resumeOwner,
                          onOpenCover: _openCover,
                          controllerRightCover: _controllerRightCover,
                          controllerLeftCover: _controllerLeftCover,
                        ),
                      ),
              ),
            );
          },
        ),
      ),
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
