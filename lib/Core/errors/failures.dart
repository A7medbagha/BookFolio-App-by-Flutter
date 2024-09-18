// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

abstract class Failures {
  Failures(this.errMessage);
  final String errMessage;
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioEorror) {
    switch (dioEorror.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout With ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout With ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Reccive timeout With ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate With ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioEorror.response!.statusCode, dioEorror.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error with ApiServer');
      case DioExceptionType.unknown:
        if (dioEorror.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected error, Please try later!');
      default:
        return ServerFailure('Opps there was an error, Please try later!');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later!');
    } else {
      return ServerFailure('Opps there was an error, Please try later!');
    }
  }
}
