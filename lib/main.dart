import 'package:exploreo_app/screens/changepassword.dart';
import 'package:exploreo_app/screens/feed_screen.dart';
import 'package:exploreo_app/screens/helppage.dart';
import 'package:exploreo_app/screens/signup_screen.dart';
import 'package:exploreo_app/screens/splash/splashDetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'responsive/mobile_screen_layout.dart';
import 'responsive/responsivelayout.dart';
import 'responsive/web_screen_layout.dart';
import 'screens/forgotpassword.dart';
import 'screens/profile_screen.dart';
import 'screens/splash/onboarding1.dart';
import 'screens/verifynumber.dart';
import 'utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCy-s4DwLX8yluRtvCdcNFqGxVryJvODFY",
          appId: "1:631491089566:web:7a043fff9ea64084c6578f",
          messagingSenderId: "631491089566",
          projectId: "exploreo-f78f8",
          storageBucket: 'exploreo-f78f8.appspot.com'),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'exploreo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: const VerifyNumberScreen()
        //     StreamBuilder(
        //       stream: FirebaseAuth.instance.authStateChanges(),
        //       builder: (context, snapshot) {
        //         if (snapshot.connectionState == ConnectionState.active) {
        //           // Checking if the snapshot has any data or not
        //           if (snapshot.hasData) {
        //             // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
        //             return const ResponsiveLayout(
        //               mobileScreenLayout: MobileScreenLayout(),
        //               webScreenLayout: WebScreenLayout(),
        //             );
        //           } else if (snapshot.hasError) {
        //             return Center(
        //               child: Text('${snapshot.error}'),
        //             );
        //           }
        //         }

        //         // means connection to future hasnt been made yet
        //         if (snapshot.connectionState == ConnectionState.waiting) {
        //           return const Center(
        //             child: CircularProgressIndicator(),
        //           );
        //         }

        //         return SizedBox();
        //       },
        // ),

        );
  }
}
