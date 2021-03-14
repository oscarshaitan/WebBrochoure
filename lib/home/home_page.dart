import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oscar_web_resume/home/cubit/home_cubit.dart';
import 'package:oscar_web_resume/home/widgets/loading_resume.dart';
import 'package:oscar_web_resume/home/widgets/resposive_widgets/web/web_resume.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../injector_container.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: BlocProvider<HomeCubit>(
        create: (context) => sl(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Center(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 450),
                child: state is HomeInitial
                    ? LoadingResume()
                    : // Construct and pass in a widget builder per screen type
                    ScreenTypeLayout.builder(
                        mobile: (BuildContext context) =>
                            Container(color: Colors.blue),
                        tablet: (BuildContext context) =>
                            Container(color: Colors.yellow),
                        desktop: (BuildContext context) => WebResume(
                          resumeOwner: state.resumeOwner,
                        ),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
