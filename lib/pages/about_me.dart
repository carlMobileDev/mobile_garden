import 'package:flutter/material.dart';

//NOT USED, POTENTIAL FOR 2.0

class AboutMePage extends StatelessWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 20),
        Text(
          "Carl Wills",
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
            "Software Engineer with skills stretching from Mobile App Design using Flutter, to backend data processing using Python/Scala/Groovy"),
        Spacer(),
        Image.asset('assets/images/carl_photo.jpg', scale: 6),
        Spacer(flex: 5),
        Row(
          children: [
            TextButton(
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)))),
              onPressed: () {},
              child: Text(
                "YouTube",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
        Spacer(flex: 20)
      ],
    );
  }
}
