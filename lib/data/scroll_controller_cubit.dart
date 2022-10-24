import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollControllerCubit extends Cubit<ScrollController> {
  ScrollControllerCubit() : super(ScrollController());

  void updateScrollPosition() {
    state.animateTo(state.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}
