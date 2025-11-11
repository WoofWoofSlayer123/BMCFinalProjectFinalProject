import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/screens/auth_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kWineBlack = Color(0xFF1A0D0A);
const Color kCrimson = Color(0xFF7B1E26);
const Color kAmberGlow = Color(0xFFD67D3E);
const Color kGoldenTan = Color(0xFFF2C57C);
const Color kWarmOffWhite = Color(0xFFFAF3E0);

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  final cartProvider = CartProvider();
  cartProvider.initializeAuthListener();
  runApp(
    ChangeNotifierProvider.value(
      value: cartProvider,
      child: const MyApp(),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FireMug Liquor',
      theme: ThemeData(
        scaffoldBackgroundColor: kWarmOffWhite,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kCrimson,
          primary: kCrimson,
          secondary: kAmberGlow,
          surface: kWarmOffWhite,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: kWineBlack,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: kWineBlack,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Poppins',
          bodyColor: kWineBlack,
          displayColor: kWineBlack,
        ),
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
    );
  }
}
