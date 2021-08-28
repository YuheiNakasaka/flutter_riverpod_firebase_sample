import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firebase_sample/app/auth_widget.dart';
import 'package:riverpod_firebase_sample/app/home/home_page.dart';
import 'package:riverpod_firebase_sample/app/sign_in/sign_in_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthWidget(
        notSignedInBuilder: (_) => Consumer(
          builder: (context, watch, _) {
            return const SignInPage();
          },
        ),
        signedInBuilder: (_) => const HomePage(),
      ),
    );
  }
}
