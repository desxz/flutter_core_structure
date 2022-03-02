enum RequestType { GET, POST, PUT, DELETE }

extension RequestTypeValueExtension on RequestType {
  String get value {
    switch (this) {
      case RequestType.GET:
        return 'GET';
      case RequestType.POST:
        return 'POST';
      case RequestType.PUT:
        return 'PUT';
      case RequestType.DELETE:
        return 'DELETE';
      default:
        return 'GET';
    }
  }
}
