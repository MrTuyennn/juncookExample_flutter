import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juncook_example/bloc/themeBloc/theme_cubit.dart';
import 'package:juncook_example/bloc/themeBloc/theme_repository.dart';
import 'package:juncook_example/bloc/themeBloc/theme_state.dart';
import 'package:juncook_example/themes/themes.dart';
import 'package:juncook_example/view/HomeScreen.dart';

class AppContainer extends StatelessWidget {
  final ThemeRepository themeRepository;

  const AppContainer({required this.themeRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: themeRepository,
      child: BlocProvider(
        create: (context) => ThemeCubit(
          themeRepository: context.read<ThemeRepository>(),
        )..getCurrentTheme(),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.themeMode,
          home: const HomeScreen(),
        );
      },
    );
  }
}
