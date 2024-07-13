import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'countercubit.dart';

class CounterFAB extends StatelessWidget {
  final VoidCallback onPressed;
  final String tooltip;
  final IconData icon;

  const CounterFAB({
    Key? key,
    required this.onPressed,
    required this.tooltip,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
    );
  }
}
