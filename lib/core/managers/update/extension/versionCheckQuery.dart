// ignore_for_file: constant_identifier_names

enum VersionQuery { VERSION, PLATFORM }

extension VersionQueryExtension on VersionQuery {
  MapEntry<String, String> mapper(String value) {
    switch (this) {
      case VersionQuery.PLATFORM:
        return MapEntry('platform', value);
      case VersionQuery.VERSION:
        return MapEntry('version', value);
    }
  }
}
