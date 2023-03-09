import 'package:ayur_app/signIn.dart';
import 'package:flutter/material.dart';
import 'package:ayur_app/splash_screen.dart';
import 'package:ayur_app/navigatebar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    _checkIfSignedIn();
  }

  Future<void> _checkIfSignedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSignedIn = prefs.getBool('isSignedIn') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            _isSignedIn ? const NavigationBarScreen() : const SplashScreen(),
        '/signIn': (context) => SignInPage(),
        '/logout': (context) => _buildLogoutDialog(context),
      },
    );
  }

  Widget _buildLogoutDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to log out?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setBool('isSignedIn', false);
            Navigator.pushNamedAndRemoveUntil(
                context, '/signIn', (route) => false);
          },
          child: const Text('Log out'),
        ),
      ],
    );
  }
}
