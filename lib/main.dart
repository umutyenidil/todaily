import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todaily/core/config/app.dart';
import 'package:todaily/core/services/dependency_injection.dart';

import 'core/config/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await injectDependencies();

  runApp(const App());
}
