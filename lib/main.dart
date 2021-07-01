import 'package:flutter/material.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:todo/src/app/app.dart';

void main() {
  SimpleLogger logger = SimpleLogger();
  String FLAVOR = String.fromEnvironment('FLAVOR', defaultValue: "production");
  logger.info(FLAVOR);
  runApp(App());
}
