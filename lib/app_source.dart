import 'package:event_bus/event_bus.dart';

/// A default instance of [EventBus] shared by the app,
/// this is initialised once and serve as a singleton
/// for broadcasting and listening to events.
EventBus eventBus = EventBus();

/// For printing text longer than 800 xters
///
/// By default dart print function can only print 800 xters, but this will print
/// the text on a new line till the text is exhausted.
void printWrapped(String text) {
  final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

/// A top level function to print dio logs
void printDioLogs(Object object) {
  printWrapped(object.toString());
}

/// An extension function on [String] to provide easy to use functionalities
extension StringUtil on String {

  /// validates if a [String] is null or [isEmpty]
  ///
  /// instead of
  /// ```dart
  /// void randomFunction(String text) {
  ///   if(text != null || text.isEmpty) .....
  /// }
  /// ```
  /// just do
  /// ```dart
  /// void randomFunction(String text) {
  ///   if(text.nullOrEmpty) .....
  /// }
  /// ```
  bool get nullOrEmpty => this == null || this.isEmpty;
}