import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Core/utils/service_locator.dart';
import 'package:bookly_app/Core/utils/simple_bloc_observer.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
      Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
            BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
    
        ),
            BlocProvider(
                create: (context) => NewestBooksCubit(
              getIt.get<HomeRepoImpl>(),
                )..fetchNewestBooks(),
            ),
        ],
              child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Bookly App',
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
              textTheme: GoogleFonts.montserratTextTheme(
                ThemeData.dark().textTheme,
              ),
            ),
            routerConfig: AppRouter.router,
          ),
    );
  }
}
