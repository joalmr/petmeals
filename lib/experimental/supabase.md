### supabase_flutter: ^2.5.2

```dart
class HomeTest extends StatefulWidget {
  const HomeTest({super.key});

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  String? _userId;

  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();

    supabase.auth.onAuthStateChange.listen((data) {
      log(data.session?.user.id ?? 'Not signed in');
      setState(() {
        _userId = data.session?.user.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_userId ?? 'Not signed in'),
            ElevatedButton(
              onPressed: () async => await signInWithGoogle(),
              child: const Text('Sign in with Google'),
            ),
            ElevatedButton(
              onPressed: () async => signOut(),
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      /// Web Client ID that you registered with Google Cloud.
      const webClientId =
          '1085650349965-0m4kta0dgm7r9smep82msruno8a593a2.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: webClientId,
      );

      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  Future<dynamic> signOut() async {
    await GoogleSignIn().signOut();
    await supabase.auth.signOut();
  }
}
```