// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class AuthSupabase {
//   final supabase = Supabase.instance.client;

//   Future<AuthResponse> googleSignIn() async {
//     /// iOS Client ID that you registered with Google Cloud.
//     const iosClientId = 'my-ios.apps.googleusercontent.com';

//     final GoogleSignIn googleSignIn = GoogleSignIn(clientId: iosClientId);
//     final googleUser = await googleSignIn.signIn();
//     final googleAuth = await googleUser!.authentication;
//     final accessToken = googleAuth.accessToken;
//     final idToken = googleAuth.idToken;

//     if (accessToken == null) {
//       throw 'No Access Token found.';
//     }
//     if (idToken == null) {
//       throw 'No ID Token found.';
//     }

//     return supabase.auth.signInWithIdToken(
//       provider: OAuthProvider.google,
//       idToken: idToken,
//       accessToken: accessToken,
//     );
//   }
// }
