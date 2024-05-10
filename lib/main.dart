import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musictones3/cubit/cubit.dart';
import 'package:musictones3/home_screen.dart';
import 'package:musictones3/musictones_bloc.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAkSspgS-TjV8hKurrb9ufZLeAVP_3PNBQ",
          appId: "1:380821146521:android:cd3b9b3b5c05105b55e108",
          messagingSenderId: '380821146521',
          projectId: "musictones3-3695a",
          storageBucket: "musictones3-3695a.appspot.com"
      )
  );
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = MusictinesBlocObserver();
  // OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // OneSignal.initialize("3065d6a6-703d-4b2b-9aca-3ec4d9d6d58f");
  // OneSignal.Notifications.requestPermission(true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create:(context)=>MainCubit()..getSections()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash:Image.asset('assets/logo.png',
          height: 300,
          width: 300,
          ) ,
          nextScreen: HomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
          duration: 3000,
        )
      ),
    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
