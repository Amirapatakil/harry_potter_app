import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  MaterialPageRoute get route => MaterialPageRoute(builder: (context) => this);
}
