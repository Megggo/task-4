import 'package:flutter_bloc/flutter_bloc.dart';

// Define Cubit and State
enum RadioItem {
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

class RadioCubit extends Cubit<RadioItem> {
  RadioCubit() : super(RadioItem.item1);

  void selectItem(RadioItem item) {
    emit(item);
  }
}
