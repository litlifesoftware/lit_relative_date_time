# LitRelativeDateTime

> [![leitmotif][leitmotif_badge_pub]][leitmotif] [![pub points][leitmotif_badge_pub_points]][leitmotif_pub_points]

by [LitLifeSoftware](https://github.com/litlifesoftware)

## What is LitRelativeDateTime?

LitRelativeDateTime is a Flutter package to generate relative dates to show differences in time. Theses dates are formatted in a localized and human-readable format.

## Screenshots

| English Locale     | German Locale      |
| ------------------ | ------------------ |
| ![1][screenshot_1] | ![2][screenshot_2] |

## How it works

The `RelativeDateTime` takes two `DateTime` objects and calculates the difference in time of both dates. This relative time difference is
then used for localizing and formatting the expression in human-readable format.

## How to use

First the delegates and supported locales should be declared on your `MaterialApp` to enable localization for your app:

```dart
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
```

To display localized and formatted dates relative to another date in human-readable format, first a `RelativeDateTime` object should be created:

```dart
    RelativeDateTime _relativeDateTime =
        RelativeDateTime(dateTime: DateTime.now(), other: _otherDateTime);
```

Next the `RelativeDateFormat` object can be initialized. It will enable formatting the previously
created `RelativeDateTime`:

```dart
RelativeDateFormat _relativeDateFormatter = RelativeDateFormat(
    Localizations.localeOf(context),
);
```

If you want to provide your own Localizations, you can do so by passing the optional `localizations`
argument, which contains a list of `RelativeDateLocalization` objects:

```dart
RelativeDateLocalization(
  languageCode: 'en',
  timeUnitsSingular: [
    'second',
    'minute',
    'hour',
    'day',
    'week',
    'month',
    'year',
  ],
  timeUnitsPlural: [
    'seconds',
    'minutes',
    'hours',
    'days',
    'weeks',
    'months',
    'years',
  ],
  prepositionPast: 'ago',
  prepositionFuture: 'in',
  atTheMoment: 'now',
  formatOrderPast: [
    FormatComponent.value,
    FormatComponent.unit,
    FormatComponent.preposition
  ],
  formatOrderFuture: [
    FormatComponent.preposition,
    FormatComponent.value,
    FormatComponent.unit,
  ],
);
```

Now the `RelativeDateFormat`'s `format()` method can be called, which takes the `RelativeDateTime` as
an argument in order to format the `RelativeDateTime` to display the string on e.g. a `Text` widget:

```dart
Text(relativeDateFormatter.format(relativeDateTime))
```

There is an `AnimatedBuilder` implementation (`AnimatedRelativeDateTimeBuilder`) available to display `RelativeDateTime` values relative
to the current timestamp. The animation renders every second to allow updating the builder
every past second.

```dart
AnimatedRelativeDateTimeBuilder(
    date: _lastPressed!,
    builder: (relDateTime, formatted) {
      return Text(
        formatted,
      );
    },
  );
```

The Example app can provide further details on implementing relative dates.

## Getting Started with Flutter

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Example

The `example` folder contains an example app demonstrating how LitRelativeDateTime could implemented.

## License

The source code of this repository is distributed under the
**BSD 3-Clause** license as specified in the `LICENSE` file.

[screenshot_1]: assets/img/Screenshot_1.png
[screenshot_2]: assets/img/Screenshot_2.png
[leitmotif]: https://pub.dev/packages/lit_relative_date_time
[leitmotif_pub_points]: https://pub.dev/packages/lit_relative_date_time/score
[leitmotif_badge_pub]: https://img.shields.io/pub/v/lit_relative_date_time.svg
[leitmotif_badge_pub_points]: https://badges.bar/lit_relative_date_time/pub%20points
