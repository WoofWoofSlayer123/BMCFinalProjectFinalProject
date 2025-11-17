import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:ecommerce_app/screens/auth_wrapper.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

/// --- NEW COLOR PALETTE (YOUR COLORS) ---
const Color kWineBlack = Color(0xFF1A0D0A);
const Color kCrimson = Color(0xFF7B1E26);
const Color kAmberGlow = Color(0xFFD67D3E);
const Color kGoldenTan = Color(0xFFF2C57C);
const Color kWarmOffWhite = Color(0xFFFAF3E0);
/// --- END OF COLOR PALETTE ---

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: kCrimson,
          brightness: Brightness.light,
          primary: kCrimson,
          onPrimary: Colors.white,
          secondary: kAmberGlow,
          background: kWarmOffWhite,
        ),
        useMaterial3: true,

        scaffoldBackgroundColor: kWarmOffWhite,

        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kCrimson,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: kAmberGlow.withOpacity(0.8)),
          ),
          labelStyle: TextStyle(color: kCrimson.withOpacity(0.8)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: kCrimson, width: 2.0),
          ),
        ),

        cardTheme: CardThemeData(
          elevation: 1,
          color: kGoldenTan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: kWineBlack,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
      ),

      home: const AuthWrapper(),
    );
  }
}