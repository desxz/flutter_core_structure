import 'package:dio/dio.dart';

import 'customDio/customDio.dart';

abstract class INetworkManager {
  final String baseURL;

  INetworkManager(this.baseURL);
}

class NetworkManager {
  final String baseURL;

  CustomDio? client;

  NetworkManager(this.baseURL) {
    final _baseOptions = BaseOptions(
      baseUrl: baseURL,
    );

    client = CustomDio(_baseOptions);
  }
}
