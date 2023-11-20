import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/app.dart';
import 'core/utils/favourite_movie_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async
{
  await Hive.initFlutter();
  Hive.registerAdapter(FavouriteMovieModelAdapter());
  await Hive.openBox<FavouriteMovieModel>("moviesWatchList");
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Movies());
}


