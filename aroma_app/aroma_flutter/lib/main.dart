import 'package:aroma_flutter/features/app/splash_screen/splash_screen.dart';
import 'package:aroma_flutter/features/user_auth/presentation/pages/home_page.dart';
import 'package:aroma_flutter/features/user_auth/presentation/pages/login_page.dart';
import 'package:aroma_flutter/features/user_auth/presentation/pages/report_page.dart';
import 'package:aroma_flutter/features/user_auth/presentation/pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyD5Qizoen23Hz_p1Z12h6aEH98Dsy0oGBw",
        appId: "1:88827827665:web:a9a3a21290535ed75bfcf0",
        messagingSenderId: "88827827665",
        projectId: "aroma-backend",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              // TODO: Change this back to login when done working
              child: HomePage(),
            ),
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
        '/newreport': (context) => const ReportPage(),
      },
    );
  }
}
