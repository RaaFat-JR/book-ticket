import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/red_rounded_action_button.dart';
import 'package:movie_ticket_app/const.dart';
import 'package:movie_ticket_app/screens/buy_ticket.dart';
import 'components/dark_borderless_button.dart';
import 'components/movie_app_bar.dart';
import 'components/primary_rounder_button.dart';
import 'model.dart';
import 'film_lists.dart';
import 'welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Ticket app ',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: LogoStack(),
    );
  }
}
