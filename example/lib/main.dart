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
      title: 'Lit Relative Date Time Demo',
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
  AnimationController _animationController;

  DateTime _lastPressed;

  /// Get a relative date using the current [DateTime] and the [DateTime] the
  /// button has been pressed the last.
  RelativeDateTime get relativeDateTime {
    RelativeDateTime _relativeDateTime =
        RelativeDateTime(dateTime: DateTime.now(), other: _lastPressed);
    return _relativeDateTime;
  }

  /// Get a formatted and localized date time in human-readable format.
  RelativeDateFormat get relativeDateFormatter {
    RelativeDateFormat _relativeDateFormatter = RelativeDateFormat(
      Localizations.localeOf(context),
    );
    return _relativeDateFormatter;
  }

  /// Reset the [_lastPressed] date time and start the animation.
  void _onPressed() {
    setState(() {
      _lastPressed = DateTime.now();
    });
    if (!_animationController.isAnimating) {
      _animationController.repeat(reverse: true);
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lit Relative Date Time Demo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        child: Icon(_lastPressed != null ? Icons.restore : Icons.play_arrow),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Column(
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
                  child: Text(
                    _lastPressed != null
                        ? relativeDateFormatter.format(relativeDateTime)
                        : "Not Pressed Yet",
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
