import 'package:flutter/material.dart';
import 'package:notes/app/injector.dart';

import 'app/app_widget.dart';

void main() async {
  registerInstances();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
