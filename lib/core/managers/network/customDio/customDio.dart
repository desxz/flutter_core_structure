import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../base/baseError.dart';
import '../../../base/baseModel.dart';
import '../responseModel.dart';
import 'requestTypeEnum.dart';

abstract class ICustomDio {
  Future<IResponseModel<R>> sendRequest<R, T extends BaseModel>(String path,
      {required RequestType type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});

  Future<void> _checkConnectivity();
  Future<bool> _checkNetwork();
}

class CustomDio<R> extends ChangeNotifier
    with DioMixin
    implements Dio, ICustomDio {
  @override
  final BaseOptions options;

  static bool networkConnectionStatus = true;

  CustomDio(this.options);

  @override
  Future<IResponseModel<R>> sendRequest<R, T extends BaseModel>(String path,
      {required RequestType type,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onReceiveProgress}) async {
    final response =
        await request(path, data: data, options: Options(method: type.value));

    switch (response.statusCode) {
      case HttpStatus.ok:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        await _checkConnectivity();
        return ResponseModel(error: BaseError('message'));
    }
  }

  R? _responseParser<R, T>(BaseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, Object>) as R;
    }
    return data as R?;
  }

  @override
  Future<void> _checkConnectivity() async {
    // Check This
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      networkConnectionStatus = false;
    } else {
      var _connection = await _checkNetwork();
      if (_connection) {
        networkConnectionStatus = true;
      } else {
        networkConnectionStatus = false;
      }
    }
    notifyListeners();
  }

  @override
  Future<bool> _checkNetwork() async {
    try {
      final result = await InternetAddress.lookup('https://8.8.8.8');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
