import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quotes_app/screen/home.screen.dart';
import 'package:quotes_app/screen/all_quotes.screen.dart';
import 'package:quotes_app/provider/quotes.provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Providers are above [MyApp] instead of inside it, so that tests
  /// can use [MyApp] while mocking the providers
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => QuotesProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes HQ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        ///Using default theme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (_) => const LandingScreen(),
        AllQuotes.routeName: (_) => const AllQuotes()
      },
    );
  }
}
