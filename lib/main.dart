import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final LatoLicense = await rootBundle.loadString("google_fonts/Lato-OFL.txt");
    final PlayfairLicense = await rootBundle.loadString("google_fonts/Playfair-OFL.txt");
    yield LicenseEntryWithLineBreaks(['google_fonts'], LatoLicense);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Time',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.darkBackgroundGray,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
            child: Text(
      "Hello World",
      style: GoogleFonts.playfairDisplay(fontSize: 50, fontWeight: FontWeight.bold),
    )));
  }
}
