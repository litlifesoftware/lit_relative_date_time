# Lit Relative Date Time

A Flutter package to generate localized relative dates to show differences in time in human-readible format.

## Screenshots

| Difference in seconds (eng. locale)                                                        | Difference in seconds (ger. locale)                                                        |
| ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| ![Difference in seconds (eng. locale)](assets/img/Lit_Relative_Date_Time_Screenshot_1.jpg) | ![Difference in seconds (ger. locale)](assets/img/Lit_Relative_Date_Time_Screenshot_2.jpg) |

## How it works

## How to use

To display localized and formatted dates relative to another date in human-readible format, first there has to be a `RelativeDateTime` object created:

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
argument, which contains a list of localization objects:

```dart
RelativeDateFormat _relativeDateFormatter = RelativeDateFormat(
      Localizations.localeOf(context),
      localizations: [
        RelativeDateLocalization(
          languageCode: 'en',
          timeUnitsSingular: ['second', 'minute', 'hour', 'day', 'year'],
          timeUnitsPlural: ['seconds', 'minutes', 'hours', 'days', 'years'],
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
        )
      ],
    );
```

Now the `RelativeDateFormat`'s `format()` method can be called, which takes the `RelativeDateTime` as
an argument in order to format the `RelativeDateTime` to display the string on e.g. a `Text` widget:

```dart
Text(relativeDateFormatter.format(relativeDateTime))
```

The Example app can provided further details on implementing relative dates.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Example

The `example` folder contains an example app demonstrating the most basic implementation using a local JSON asset file.

## License

The source code of this repository is distributed under the
**BSD 3-Clause** license as specified in the `LICENSE` file.
