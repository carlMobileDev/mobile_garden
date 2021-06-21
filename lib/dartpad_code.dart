String dartpadCode = '''
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,),
    title: 'Carl Wills Mini Resume', 
    home: MyApp())
  );


class MyApp extends StatelessWidget {

  final List<ResumeItem> _allItems = [
    ResumeItem(
        timeframe: "March - Present\\n2021",
        employer: "YouMeWho (Contract)",
        description: "Tech Lead"),
    ResumeItem(
        timeframe: "December - Present\\n2020",
        employer: "Surescripts",
        description: "Senior Software Engineer"),
    ResumeItem(
        timeframe: "January - December\\n2015         2020",
        employer: "Surescripts",
        description: "Software Engineer"),
    ResumeItem(
        timeframe: "June\\n2021",
        employer: "Brother Virtual Hackathon 2021",
        description: "Built Flutter app with Brother printer integration"),
    ResumeItem(
        timeframe: "June\\n2021",
        employer: "Presented at Flutter Meetup: ",
        description: "How to simplify your App with Flutter State Management: A deep dive into setState, Provider, and Riverpod"),
    ResumeItem(
        timeframe: "March\\n2020",
        employer: "Released \'New Horizons Travel Companion\' to Google Play Store",
        description: "Reached 20,000 installs in 2020"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
        appBar: AppBar(
          title: Text("Carl Wills Mini Resume"),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            ResumeItem currentResumeItem = _allItems[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.blueGrey),
                child: ListTile(
                  leading: Text(currentResumeItem.timeframe),
                  title: Text(currentResumeItem.employer, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(currentResumeItem.description),
                ),
              ),
            );
          },
          itemCount: _allItems.length,
        ));
  }
}

class ResumeItem {
  String timeframe;
  String employer;
  String description;

  ResumeItem(
      {@required this.timeframe,
       @required this.employer,
       @required this.description});
}
''';
