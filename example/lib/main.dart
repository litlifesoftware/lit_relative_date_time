import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lit_relative_date_time/lit_relative_date_time.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LitRelativeDateTime',
      // Set the localization delegates you want to use.
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Set the supported locales according to the localizations you have
      // implmented on your application.
      supportedLocales: [
        const Locale('en'), // English, no country code
        const Locale('de'), // German, no country code
        const Locale('ru'), // Russian, no country code
      ],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  DateTime? _lastPressed;

  /// Reset the [_lastPressed] date time and start the animation.
  void _onPressed() {
    setState(() {
      _lastPressed = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("LitRelativeDateTime"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        child: Icon(_lastPressed != null ? Icons.restore : Icons.play_arrow),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Last pressed:",
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _lastPressed != null
                  ? AnimatedRelativeDateTimeBuilder(
                      date: _lastPressed!,
                      builder: (relDateTime, formatted) {
                        return Text(
                          formatted,
                        );
                      },
                    )
                  : Text(
                      "Not Pressed Yet",
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
