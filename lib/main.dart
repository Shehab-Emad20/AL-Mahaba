import 'package:almahaba/screen/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJjZW91Z3F3aXRvc3p5YnFoZWNhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE2ODY4NDIsImV4cCI6MjA0NzI2Mjg0Mn0.RaROGcTqiaU7Ba9D244tB1xJVQFd44I4a3zJLwUUC3o',
      url: 'https://bceougqwitoszybqheca.supabase.co');
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
