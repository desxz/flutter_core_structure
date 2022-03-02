import '../managers/network/responseModel.dart';

class BaseError extends IErrorModel {
  final String message;

  BaseError(this.message);
}
