import 'package:flutter/material.dart';
import 'package:todaily/core/config/app.dart';
import 'package:todaily/core/services/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injectDependencies();


  runApp(const App());
}
