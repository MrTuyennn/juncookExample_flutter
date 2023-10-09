import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juncook_example/bloc/counter/counter_bloc.dart';
import 'package:juncook_example/bloc/counter/counter_event.dart';
import 'package:juncook_example/bloc/counter/counter_state.dart';
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
    return BlocBuilder<CounterBloc, CounterState>(builder: ((context, state) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Count ${state.count}',
                  style: Theme.of(context).textTheme.bodyLarge),
              Text('Count ${state.text}',
                  style: Theme.of(context).textTheme.bodyLarge),
              // ignore: unrelated_type_equality_checks
              if (context.read<ThemeCubit>().state.themeMode == ThemeMode.light)
                Text('Light', style: Theme.of(context).textTheme.bodyLarge)
              else
                Text('Dark', style: Theme.of(context).textTheme.bodyLarge),
              Text('Change Theme',
                  style: Theme.of(context).textTheme.bodyLarge),
              ElevatedButton(
                  onPressed: () => {
                        context.read<ThemeCubit>().switchTheme(),
                        context.read<CounterBloc>().add(IncreaseEvent(6))
                      },
                  child: const Text('Click'))
            ],
          ),
        ),
      );
    }));
  }
}
