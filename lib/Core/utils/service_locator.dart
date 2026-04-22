import 'package:bookly_app/Core/utils/api_service.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton(
    ApiService(
      Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
        ),
      ),
    ),
  );
  getIt.registerSingleton( HomeRepoImpl(
        getIt.get<ApiService>(),
      ),
      );
}
