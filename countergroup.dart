import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geomtrics_app/countercubit.dart';
import 'package:geomtrics_app/fab.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterCubit, int>(
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
         floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
           CounterFAB(
            onPressed: () => context.read<CounterCubit>().increment(),
            tooltip: 'Increment',
            icon: Icons.add,
          ),
          const SizedBox(height: 8),
          CounterFAB(
            onPressed: () => context.read<CounterCubit>().decrement(),
            tooltip: 'Decrement',
            icon: Icons.remove,
          ),
        ],
      ),
    );
  }
}