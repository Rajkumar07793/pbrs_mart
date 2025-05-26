import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/user_model.dart';

class ApiService {
  final Dio _dio = Dio();

  static const String _baseUrl = 'https://pbrsmart.com/api/users';
  final String _baseUrlPublic = 'https://pbrsmart.com/public';
  static const String _authToken =
      'ZhhcZ7U4XqDgcp9QEPhmFts4gzNmBIK2ivdplCYshPeRLFYbgJgD6I7pQaz3Ik7e2MrQKV8VzMmsWZHB7UKLvoBObrJarLt5jjTs';
  static const String _cookieSession = '2e613f2feec5241ffea1785d6d34e5bc';

  final Map<String, String> _headers = {
    'Authorization': 'Bearer $_authToken',
    'Content-Type': 'application/json',
    'Cookie': 'PHPSESSID=$_cookieSession',
  };

  Future<Response?> signUp(UserModel user) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/sign-up',
        data: user.toJson(),
        options: Options(headers: _headers),
      );
      return response;
    } catch (e) {
      print('Signup error: $e');
      return null;
    }
  }

  Future<Response?> loginUser({
    required String mobile,
    required String password,
  }) async {
    final data = {"mobile": mobile, "password": password};

    try {
      final response = await _dio.post(
        '$_baseUrl/sign-in',
        data: data,
        options: Options(headers: _headers),
      );
      return response;
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }

  Future<Response?> verifyOtp({
    required String mobile,
    required String otp,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/verify-otp',
        data: jsonEncode({"mobile": mobile, "otp": otp}),
        options: Options(headers: _headers),
      );
      return response;
    } catch (e) {
      print('OTP Verification Error: $e');
      return null;
    }
  }

  Future<Response?> resendOtp({required String mobile}) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/resend-otp',
        data: jsonEncode({"mobile": mobile}),
        options: Options(headers: _headers),
      );
      return response;
    } catch (e) {
      print('Resend OTP Error: $e');
      return null;
    }
  }

  Future<Response?> sendResetPasswordOtp({required String mobile}) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/reset-password-send-otp',
        data: jsonEncode({"mobile": mobile}),
        options: Options(headers: _headers),
      );
      return response;
    } catch (e) {
      print('Reset Password OTP Error: $e');
      return null;
    }
  }

  Future<Response?> resetPassword({
    required String mobile,
    required String password,
    required String confirmPassword,
    required String otp,
  }) async {
    final data = jsonEncode({
      "mobile": mobile,
      "password": password,
      "confirmPassword": confirmPassword,
      "otp": otp,
    });

    try {
      final response = await _dio.post(
        '$_baseUrl/reset-password',
        data: data,
        options: Options(headers: _headers),
      );
      return response;
    } catch (e) {
      print('Reset Password Error: $e');
      return null;
    }
  }
}
