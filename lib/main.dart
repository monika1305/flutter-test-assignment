import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/theme/app_themes.dart';
import 'package:movie_app/features/homepage/presentation/bloc/movie/remote/remote_movie_bloc.dart';
import 'package:movie_app/features/homepage/presentation/bloc/movie/remote/remote_movie_events.dart';
import 'package:movie_app/features/homepage/presentation/views/home_page.dart';
import 'package:movie_app/injector_container.dart';

void main() async {

/*  WidgetsFlutterBinding.ensureInitialized() is required in Flutter v1.9.4+
 *  before using any plugins if the code is executed before runApp.
 */
  WidgetsFlutterBinding.ensureInitialized();


// Configure injecction
  await initializedDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteMovieBloc>(
      create: (context) => sl()
        ..add(GetLatestEvent())
        ..add(GetTopRatingEvent())
        ..add(GetPopularEvent())
        ..add(GetUpCommingEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: themeData(),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
