import 'package:flutter/cupertino.dart';

extension PageSize on BuildContext {
  double get getHeightPage => MediaQuery.of(this).size.height - 300;

  double get getWithPage => (MediaQuery.of(this).size.width - 100) / 3;
}
