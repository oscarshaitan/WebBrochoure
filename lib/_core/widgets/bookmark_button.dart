import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../transforms/bookmark_clipper.dart';

class BookMarkButton extends StatefulWidget {
  final Widget child;
  final AlignmentGeometry alignment;
  final bool rotated;
  final Function onPressed;
  final Color dotColor;
  final Color backGroundColor;
  final Color backGroundColorOnHover;

  // You can also pass the translation in here if you want to
  BookMarkButton({
    Key key,
    @required this.child,
    @required this.onPressed,
    @required this.alignment,
    this.rotated = false,
    @required this.dotColor,
    @required this.backGroundColor,
    @required this.backGroundColorOnHover,
  }) : super(key: key);

  @override
  _BookMarkButtonState createState() => _BookMarkButtonState();
}

class _BookMarkButtonState extends State<BookMarkButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(widget.rotated ? -100 : 0, 0),
      child: Transform.rotate(
        alignment: widget.alignment,
        angle: widget.rotated ? -pi / 2 : 0,
        child: Align(
          alignment: widget.alignment,
          child: MouseRegion(
            onEnter: (e) => _mouseEnter(true),
            onExit: (e) => _mouseEnter(false),
            child: ClipPath(
              clipper: BookMarkClipper(),
              child: RawMaterialButton(
                onPressed: widget.onPressed,
                fillColor: widget.backGroundColor,
                hoverColor: widget.backGroundColorOnHover,
                child: DottedBorder(
                  dashPattern: [4, 2],
                  strokeWidth: 0.5,
                  color: widget.dotColor,
                  customPath: (size) {
                    return Path()
                      ..moveTo(0, 60)
                      ..lineTo(size.width, 60);
                  },
                  child: DottedBorder(
                    dashPattern: [4, 2],
                    strokeWidth: 0.5,
                    color: widget.dotColor,
                    customPath: (size) {
                      return Path()
                        ..moveTo(0, 8)
                        ..lineTo(size.width, 8);
                    },
                    child: AnimatedContainer(
                      width: _hovering ? 150 : 100,
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        padding: EdgeInsets.only(left: 32),
                        child: widget.child,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
