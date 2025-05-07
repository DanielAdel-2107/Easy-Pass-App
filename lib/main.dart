import 'package:device_preview/device_preview.dart';
import 'package:easy_pass/app/my_app.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://bmzqbbupaejrmcipurrc.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJtenFiYnVwYWVqcm1jaXB1cnJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMzNTIxMTIsImV4cCI6MjA1ODkyODExMn0.1o9ADR0kQKCeZsXhZWHOCs77FdQZDfIBoJEUnqJ8Ngg",
  );
  setupDI();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}
