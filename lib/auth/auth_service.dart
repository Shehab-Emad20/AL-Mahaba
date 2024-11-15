import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // تسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور
  Future<AuthResponse?> signInWithEmailPassword(
      String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response; // تأكد من أن هذه القيمة ترجع بشكل صحيح
    } catch (e) {
      log('Sign in error: $e');
      return null;
    }
  }

  // تسجيل مستخدم جديد باستخدام البريد الإلكتروني وكلمة المرور
  Future<AuthResponse?> signUpWithEmailPassword(
      String email, String password, String firstName, String lastName) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'first_name': firstName,
          'last_name': lastName,
        },
      );
      return response;
    } catch (e) {
      log('Sign up error: $e');
      return null;
    }
  }
}
