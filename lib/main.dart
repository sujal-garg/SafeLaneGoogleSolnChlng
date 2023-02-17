import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:safelane/authentication/login.dart';
import 'package:safelane/cards/myContribution.dart';
import 'package:safelane/onBoarding/onbording.dart';
import 'package:safelane/tabs/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:safelane/tabs/home.dart';
import 'firebase_options.dart';

int? isviewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'SafeLane2',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('Onbording');
  runApp(const MyApp());
   FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          )),
      // home: const HomePage(),

      initialRoute: '/',
      routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => isviewed != 0 ? const Onbording():const HomePage(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/second': (context) => const HomePage()
  },
    );
  }
}
