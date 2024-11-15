import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign in with email and password
  Future<AuthResponse?> signInWithEmailPassword(
      String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      print('Sign in error: $e');
      return null;
    }
  }

  // Sign up with email and password
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
      print('Sign up error: $e');
      return null;
    }
  }

  // Get current user's email
  String? getCurrentUserEmail() {
    final session = _supabase.auth.currentSession;

    // التحقق من وجود الجلسة
    if (session == null) {
      print('No active session found');
      return null;
    }

    // التحقق من انتهاء صلاحية الجلسة إذا كانت expiresAt متوفرة
    if (session.expiresAt != null) {
      final sessionExpiry = session.expiresAt!; // لا حاجة لتحويل
      final currentTime = DateTime.now().millisecondsSinceEpoch;

      if (sessionExpiry < currentTime) {
        print('Session expired');
        return null;
      }
    }

    // إذا كانت الجلسة صالحة
    return session.user?.email;
  }
}
