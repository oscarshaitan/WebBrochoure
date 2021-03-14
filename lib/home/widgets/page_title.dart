import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;

  const PageTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Divider(
            color: Colors.black,
            height: 16,
            thickness: 0.5,
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: Color(0XFF333333),
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: Colors.white,
                    fontSize: 30,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
