import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'countercubit.dart';

class RadioGroup extends StatelessWidget {
  const RadioGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page'),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return RadioListTile<int>(
                title: Text('Option ${index + 1}'),
                value: index,
                groupValue: state,
                onChanged: (value) {
                  context.read<CounterCubit>().emit(value!);
                },
              );
            },
          );
        },
      ),
    );
  }
}
