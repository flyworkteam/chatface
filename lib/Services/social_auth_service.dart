import 'dart:convert';
import 'dart:math';

import 'package:chatface/utils/print.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final socialAuthServiceProvider = Provider<SocialAuthService>((ref) {
  return SocialAuthService();
});

class SocialAuthService {
  Future<String?> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();

      final GoogleSignInAccount account = await googleSignIn.authenticate();

      final GoogleSignInAuthentication auth = account.authentication;

      if (auth.idToken == null) {
        Print.error('Failed to get ID token from Google');
        throw Exception('Failed to get ID token from Google');
      }

      Print.info('Google sign-in successful for: ${account.email}');
      return auth.idToken;
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        Print.info('User cancelled Google Sign-In $e');
        return null;
      }
      Print.error('Error signing in with Google: $e');
      rethrow;
    } catch (e) {
      Print.error('Error signing in with Google: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> signInWithApple() async {
    try {
      final isAvailable = await SignInWithApple.isAvailable();

      if (!isAvailable) {
        Print.error('Apple Sign-In is not available on this device');
        throw UnsupportedError('Apple Sign-In is not available on this device');
      }

      final rawNonce = generateNonce();
      final hashedNonce = sha256ofString(rawNonce);

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: hashedNonce,
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'com.flywork.chatface.android.sid',
          redirectUri: Uri.parse(
            'https://chatface-af028.firebaseapp.com/__/auth/handler',
          ),
        ),
      );

      if (credential.identityToken == null) {
        Print.error('Failed to get identity token from Apple');
        throw Exception('Failed to get identity token from Apple');
      }

      final result = <String, dynamic>{
        'identityToken': credential.identityToken!,
      };

      if (credential.givenName != null || credential.familyName != null) {
        result['user'] = {
          'name': {
            'firstName': credential.givenName,
            'lastName': credential.familyName,
          },
        };
      }

      if (credential.email != null) {
        result['email'] = credential.email;
      }

      Print.info('Apple Sign-In successful');
      return result;
    } on SignInWithAppleAuthorizationException catch (e) {
      Print.error(
        'Apple Sign-In authorization error: ${e.code} - ${e.message}',
      );

      if (e.code == AuthorizationErrorCode.canceled) {
        Print.info('User cancelled Apple Sign-In');
        return null;
      }

      rethrow;
    } catch (e) {
      Print.error('Error signing in with Apple: $e');
      rethrow;
    }
  }

  Future<void> signOutGoogle() async {
    try {
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.signOut();
      Print.info('Google sign-out successful');
    } catch (e) {
      Print.error('Error signing out from Google: $e');
    }
  }

  Future<void> signOutFacebook() async {
    try {
      Print.info('Facebook sign-out not implemented');
    } catch (e) {
      Print.error('Error signing out from Facebook: $e');
    }
  }
}

// helpers (generateNonce and sha256)
String generateNonce([int length = 32]) {
  final charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final rand = Random.secure();
  return Iterable.generate(
    length,
    (_) => charset[rand.nextInt(charset.length)],
  ).join();
}

String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}
