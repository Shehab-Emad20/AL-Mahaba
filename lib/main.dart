import 'package:almahaba/screen/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlucmFjc25xanh2bXdydGVkeGlpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE2MjIyOTMsImV4cCI6MjA0NzE5ODI5M30.J3A4oWj34OAlKIrB_kpFUCnfM6B1PmJl6eKD2S5Rsss',
      url: 'https://inracsnqjxvmwrtedxii.supabase.co');
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
