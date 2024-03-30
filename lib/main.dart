import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carl Wills - Portfolio',
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.ubuntuCondensed().fontFamily),
      home: HomePage(title: 'My Digital Garden'),
    );
  }
}
