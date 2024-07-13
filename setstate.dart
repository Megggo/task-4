import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geomtrics_app/countergroup.dart';

import 'package:geomtrics_app/fab.dart';
import 'countercubit.dart';

// Import the custom FAB widget

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: MyWidget(),
    );
  }
}
