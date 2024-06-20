import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todaily/core/config/app.dart';
import 'package:todaily/core/services/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://pfjupangqcovrybatucb.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBmanVwYW5ncWNvdnJ5YmF0dWNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg4MDQxMjAsImV4cCI6MjAzNDM4MDEyMH0.vzC2-Lx2FW6ebvlcgMMxIrZkKk--qvXqzwH2k8mB9ho');

  await injectDependencies();

  runApp(const App());
}
