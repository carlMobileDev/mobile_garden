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
  Software Engineer with skills stretching from Mobile app UI to backend data processing using hadoop

  ''';
  String _personalDescriptionBody = '''
  *  Fast Learner
      -  Has learned multiple langauages and technologies on the job, including: Java, Clojure, Python, Scala, 
         Groovy, Kafka, Hadoop, Jenkins 2.0, Ansible and Consul

  *  Loves to build things away from work
      -  Earned Android Developer Nanodegree from Udacity and with the Grow with Google Challenge Scholarship (2017-2018).
      -  Fell in love with Flutter/Dart and has published two apps to the Google Play Store
  
  *  An active presense in the developer community
      -  Gave a presentation at local Flutter/Dart interest group about state management solutions
      -  Written blog articles about general programming and Flutter concepts
  ''';

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double widthDivider = screenWidth / 20;
    double heightDivider = screenWidth / 15;
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 10,
            ),
            Text(
              "Carl Wills",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: heightDivider,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/carl_photo.jpg',
                  scale: 6,
                )),
            SizedBox(
              height: heightDivider,
            ),
            Text(_personalDescriptionHeader,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(
              height: heightDivider / 5,
            ),
            Text(_personalDescriptionBody,
                style: TextStyle(
                  fontSize: 20,
                )),
            SizedBox(
              height: heightDivider,
            ),
            Text("Check out my links below!"),
            SizedBox(
              height: heightDivider / 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _customSignInButton(
                    FontAwesomeIcons.github,
                    'https://github.com/carlMobileDev',
                    Colors.black,
                    widthDivider),
                _customSignInButton(
                    FontAwesomeIcons.youtube,
                    'https://www.youtube.com/channel/UCBoRv9tiB9dTJvf7ugnYrBA',
                    Colors.red,
                    widthDivider),
                _customSignInButton(FontAwesomeIcons.dev,
                    'https://dev.to/carlmobiledev', Colors.black, widthDivider),
                _customSignInButton(
                    FontAwesomeIcons.googlePlay,
                    'https://play.google.com/store/apps/developer?id=Carl.Mobile.Dev',
                    Colors.black,
                    widthDivider),
              ],
            ),
            SizedBox(
              height: heightDivider,
            )
          ],
        ),
      ),
    );
  }

  Widget _customSignInButton(
      IconData icon, String url, Color backgroundColor, double widthDivider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthDivider / 2),
      child: SignInButtonBuilder(
          width: 50,
          height: 50,
          mini: true,
          icon: icon,
          onPressed: () {
            _launchURL(url);
          },
          text: '',
          backgroundColor: backgroundColor),
    );
  }
}
