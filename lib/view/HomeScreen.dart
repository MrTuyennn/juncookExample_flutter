import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juncook_example/bloc/themeBloc/theme_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  onPressed() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Change Theme', style: Theme.of(context).textTheme.bodyLarge),
            ElevatedButton(
                onPressed: () => context.read<ThemeCubit>().switchTheme(),
                child: const Text('Click'))
          ],
        ),
      ),
    );
  }
}
