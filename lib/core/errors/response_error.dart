import 'package:dio/dio.dart';

import '../utils/constants.dart';

class ResponseError {
  String? message;
  Map<String, dynamic>? errors;

  ResponseError({this.message, this.errors});

  ResponseError.fromJson(DioException dioError) {
    Map<String, dynamic>? json = dioError.response?.data;
    message = json?['message'];
    errors = json?['errors'] ?? <String, dynamic>{};
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        errors?[Constants.kBeforeServerConnectionErrorResponseKey] = [
          'Connection timeout with ApiServer'
        ];
        break;
      case DioExceptionType.sendTimeout:
        errors?[Constants.kBeforeServerConnectionErrorResponseKey] = [
          'Send timeout with ApiServer'
        ];
        break;
      case DioExceptionType.receiveTimeout:
        errors?[Constants.kBeforeServerConnectionErrorResponseKey] = [
          'Recieve timeout with ApiServer'
        ];
        break;
      case DioExceptionType.badCertificate:
        errors?[Constants.kBeforeServerConnectionErrorResponseKey] = [
          'Invalid/Incomplete Certificate Chain'
        ];
        break;
      case DioExceptionType.badResponse:
        if (dioError.response!.statusCode == 401) {
          errors?[Constants.kUnauthenticatedErrorResponseKey] = [1];
        } else {
          errors?[Constants.kBeforeServerConnectionErrorResponseKey] = [
            'Invalid/Incomplete Certificate Chain'
          ];
        }
        break;
      case DioExceptionType.cancel:
        errors?[Constants.kBeforeServerConnectionErrorResponseKey] = [
          'Request to the ApiServer was canceld'
        ];
        break;
      case DioExceptionType.connectionError:
        errors?[Constants.kBeforeServerConnectionErrorResponseKey] = [
          'No internet connection'
        ];
        break;
      case DioExceptionType.unknown:
        errors?[Constants.kBeforeServerConnectionErrorResponseKey] = [
          'No internet connection'
        ];
        break;
      default:
        break;
    }
  }

  bool hasErrors() {
    return errors?.isNotEmpty ?? true;
  }

  String? getErrorMesssage(String fieldName) {
    return errors?[fieldName]?[0];
  }
}
