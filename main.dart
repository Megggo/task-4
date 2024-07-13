import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geomtrics_app/setstate.dart';
import 'countercubit.dart';
import 'password_visibility_cubit.dart'; // Import the cubit file
import 'RadioGroup.dart'; // Import the RadioGroup widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fast Filter Bar Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const FastFilterBar(),
            const Spacer(),
            const PasswordField(),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return BlocProvider(
                    create: (context) => CounterCubit(),
                    child: const RadioGroup(), // Navigate to RadioGroup widget
                  );
                }));
              },
              child: const Text('Go to Radio Group'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return BlocProvider(
                    create: (context) => CounterCubit(),
                    child: const CounterPage(),
                  );
                }));
              },
              child: const Text('Go to Set State'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late PasswordVisibilityCubit _passwordVisibilityCubit;

  @override
  void initState() {
    super.initState();
    _passwordVisibilityCubit = PasswordVisibilityCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _passwordVisibilityCubit,
      child: BlocBuilder<PasswordVisibilityCubit, bool>(
        bloc: _passwordVisibilityCubit,
        builder: (context, isPasswordVisible) {
          return TextField(
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  _passwordVisibilityCubit.toggleVisibility();
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _passwordVisibilityCubit.close();
    super.dispose();
  }
}

enum FilterBarItem {
  item1,
  item2,
  item3,
  item4,
  item5,
  item6,
  item7,
  item8,
  item9,
  item10,
  item11,
  item12,
  item13,
  item14,
  item15,
  item16,
  item17,
  item18,
  item19,
  item20,
}

class FilterBarCubit extends Cubit<FilterBarItem> {
  FilterBarCubit() : super(FilterBarItem.item1);

  void selectItem(FilterBarItem item) {
    emit(item);
  }
}

class FastFilterBar extends StatefulWidget {
  const FastFilterBar({super.key});

  @override
  _FastFilterBarState createState() => _FastFilterBarState();
}

class _FastFilterBarState extends State<FastFilterBar> {
  late FilterBarCubit _filterBarCubit;

  @override
  void initState() {
    super.initState();
    _filterBarCubit = FilterBarCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _filterBarCubit,
      child: BlocBuilder<FilterBarCubit, FilterBarItem>(
        builder: (context, selectedItem) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: List.generate(
                FilterBarItem.values.length,
                (index) => FilterItem(
                  label: 'Item ${index + 1}',
                  item: FilterBarItem.values[index],
                  isSelected: selectedItem == FilterBarItem.values[index],
                  onTap: () => context
                      .read<FilterBarCubit>()
                      .selectItem(FilterBarItem.values[index]),
                ),
              ).toList(),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _filterBarCubit.close();
    super.dispose();
  }
}

class FilterItem extends StatelessWidget {
  final String label;
  final FilterBarItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterItem({
    super.key,
    required this.label,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.grey,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
