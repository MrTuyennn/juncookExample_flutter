import 'package:flutter/material.dart';
import 'package:juncook_example/AppContainer.dart';
import 'package:juncook_example/bloc/themeBloc/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeRepository = ThemeRepository(
    sharedPreferences: await SharedPreferences.getInstance(),
  );
  runApp(AppContainer(themeRepository: themeRepository));
}
