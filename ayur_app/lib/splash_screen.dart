import 'package:ayur_app/signIn.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DurationSplash(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: SpinKitSpinningLines(
            color: Color.fromARGB(255, 8, 107, 3),
            size: 100.0,
          ),
        ),
      ),
    );
  }

  void DurationSplash(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInPage()));
    });
  }
}
