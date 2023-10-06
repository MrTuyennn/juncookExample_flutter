import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juncook_example/bloc/counter/counter_bloc.dart';
import 'package:provider/provider.dart'; // Add this line
import 'package:juncook_example/bloc/themeBloc/theme_cubit.dart';
import 'package:juncook_example/bloc/themeBloc/theme_repository.dart';
import 'package:juncook_example/bloc/themeBloc/theme_state.dart';
import 'package:juncook_example/themes/themes.dart';
import 'package:juncook_example/view/HomeScreen.dart';

class AppContainer extends StatelessWidget {
  final ThemeRepository themeRepository;

  const AppContainer({required this.themeRepository, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ThemeRepository>(
          create: (context) => themeRepository,
        ),
        RepositoryProvider<ThemeCubit>(
          create: (context) => ThemeCubit(
            themeRepository: context.read<ThemeRepository>(),
          )..getCurrentTheme(),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => CounterBloc(),
        ),
      ], child: const AppView()),
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
