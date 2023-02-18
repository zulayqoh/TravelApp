class DataParser {
  /// sets the default config for each [ParserType]
  static Map<ParserType, dynamic> defaultConfig = {
    ParserType.String: "",
    ParserType.Boolean: false,
    ParserType.Number: 0,
    ParserType.Date: DateTime.now(),
  };

  /// parses the [value] based on [type] supplied.
  static dynamic parse(ParserType type, dynamic value, {dynamic defaultValue}) {
    dynamic parsedValue = defaultValue ?? defaultConfig[type];
    if (value == null) return parsedValue;
    try {
      switch (type) {
        case ParserType.String:
          parsedValue = value.toString();
          break;
        case ParserType.Number:
          if (value is num) {
            parsedValue = value;
          } else if (value is String) {
            parsedValue = num.parse(value);
          }
          break;
        case ParserType.Boolean:
          if (value is bool) {
            parsedValue = value;
          } else if (value is num && value == 1) {
            parsedValue = true;
          } else {
            parsedValue = false;
          }
          break;
        case ParserType.Date:
          if (value != null) {
            parsedValue = DateTime.parse(value).toLocal();
          }
          break;
      }
    } catch (error, stackTrace) {}
    return parsedValue;
  }

  DataParser();
}

/// Supported parser types in the platform
enum ParserType {
  String,
  Number,
  Boolean,
  Date,
}
