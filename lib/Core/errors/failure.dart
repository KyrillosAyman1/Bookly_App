
import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
   final String errorMessage;
  Failure(this.errorMessage);
   
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  
  factory ServerFailure.fromDioError( DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        if (dioException.error is SocketException) {
          return ServerFailure("No Internet Connection, Please check your connection!");
        }
        return ServerFailure("Connection timeout with ApiServer,check your internet connection!");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServer was cancelled");
      case DioExceptionType.unknown:
          return ServerFailure("No Internet Connection, Please check your connection!");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificate");
      case DioExceptionType.connectionError:
         if (dioException.error is SocketException) {
          return ServerFailure("No Internet Connection, Please check your connection!");
        }
          return ServerFailure("Connection error, Please check your connection!");
      // default:
      //   return ServerFailure("Something went wrong, Please try again!");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found, Please try later!");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server error, Please try later!");
    } else {
      return ServerFailure("Something went wrong, Please try again!");
    }
  }
}