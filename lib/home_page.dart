import 'package:dart_pad_widget/dart_pad_widget.dart';
import 'package:digital_garden/dartpad_code.dart';
import 'package:digital_garden/pages/projects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

//TODO: Future 2.0
// import 'pages/about_me.dart';
// import 'pages/blog_posts.dart';
// import 'pages/presentations.dart';
// import 'pages/projects.dart';
// import 'pages/videos.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _personalDescriptionHeader = '''
  Software Engineer with a variety of skills ranging from mobile app development to backend data processing
  ''';
  String _personalDescriptionBody = '''
  *  Adaptable
      -  Learned multiple langauages and technologies on the job, including: Java, Clojure, Python, Scala, 
         Groovy, Kafka, Hadoop, Jenkins 2.0, Ansible and Consul
      -  Facilitated Agile rituals and processes with team as Agile Scrum Master

  *  Passionate
      -  Earned Android Developer Nanodegree from Udacity through the Grow with Google Challenge Scholarship (2017-2018)
      -  Fell in love with Flutter/Dart and published two apps to the Google Play Store
      -  Participated in Brother Virtual Hackathon 2021. Created Flutter app to print product labels and scan QR codes (see YouTube)
  
  *  Knowledge Sharing
      -  Presented at local Flutter/Dart interest group about state management solutions
      -  Contribute to the development community by writing blog articles about general programming and Flutter concepts
  ''';

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool condenseIcons = screenWidth < 1500;

    double widthDivider = screenWidth / 20;
    double heightDivider = screenWidth / 15;
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 10,
            ),
            Text(
              "Carl Wills",
              style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: heightDivider / 20,
            ),
            Text(
              "Senior Software Engineer",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 250),
              child: Divider(
                color: Colors.white70,
                thickness: 4,
              ),
            ),
            SizedBox(
              height: heightDivider,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.white70),
                    borderRadius: BorderRadius.circular(4.0)),
                child: Image.asset(
                  'assets/images/carl_photo.jpg',
                  scale: 6,
                )),
            SizedBox(
              height: heightDivider,
            ),
            Text("Check out my links below!"),
            SizedBox(
              height: heightDivider / 10,
            ),
            Row(
              key: Key("iconRow"),
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _customSignInButton(
                    "GitHub\n(for this site)",
                    FontAwesomeIcons.github,
                    'https://github.com/carlMobileDev/mobile_garden',
                    Colors.black,
                    widthDivider,
                    condenseIcons),
                _customSignInButton(
                    "GitHub",
                    FontAwesomeIcons.github,
                    'https://github.com/carlMobileDev',
                    Colors.black,
                    widthDivider,
                    condenseIcons),
                _customSignInButton(
                    "YouTube",
                    FontAwesomeIcons.youtube,
                    'https://www.youtube.com/channel/UCBoRv9tiB9dTJvf7ugnYrBA',
                    Colors.red,
                    widthDivider,
                    condenseIcons),
                _customSignInButton(
                    "Dev.To",
                    FontAwesomeIcons.dev,
                    'https://dev.to/carlmobiledev',
                    Colors.black,
                    widthDivider,
                    condenseIcons),
                _customSignInButton(
                    "Google Play Store",
                    FontAwesomeIcons.googlePlay,
                    'https://play.google.com/store/apps/developer?id=Carl.Mobile.Dev',
                    Colors.black,
                    widthDivider,
                    condenseIcons),
                _customSignInButton(
                    "LinkedIn",
                    FontAwesomeIcons.linkedin,
                    'www.linkedin.com/in/carl-wills',
                    Colors.blue[700]!,
                    widthDivider,
                    condenseIcons)
              ],
            ),
            SizedBox(
              height: heightDivider,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70, width: 4),
                    borderRadius: BorderRadius.circular(4)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(_personalDescriptionHeader,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(_personalDescriptionBody,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ])),
            SizedBox(
              height: heightDivider,
            ),
            Text(
                "Play around with Flutter/Dart while you're here! Click run to see what I wrote!"),
            SizedBox(
              height: heightDivider / 10,
            ),
            DartPad(
              width: screenWidth / 1.25,
              flutter: true,
              darkMode: true,
              split: true,
              code: dartpadCode,
              key: Key('dartPad'),
            ),
            SizedBox(
              height: heightDivider,
            )
          ],
        ),
      ),
    );
  }

  Widget _customSignInButton(String label, IconData icon, String url,
      Color backgroundColor, double widthDivider, bool condenseIcons) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthDivider / 2),
      child: SignInButtonBuilder(
          height: 50,
          width: condenseIcons ? 50 : 157,
          icon: icon,
          mini: condenseIcons,
          textColor: Colors.white,
          onPressed: () {
            _launchURL(url);
          },
          text: label,
          backgroundColor: backgroundColor),
    );
  }
}
