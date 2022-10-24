import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dialogflow_service.dart';
import '../models/chat.dart';

class MessageCubit extends Cubit<List<ChatMessage>> {
  MessageCubit({required this.dialogFlowService}) : super([]);
  final DialogFlowService dialogFlowService;

  sendMessage(String text) {
    if (text.isNotEmpty) {
      final newMessage = ChatMessage(text: text, isSender: true);
      emit(List.from(state)..add(newMessage));
    }
  }

  getResponse(String text) async {
    final newMessage = await dialogFlowService.getResponse(text);
    for (var i in state) {
      log(i.text);
    }
    if (newMessage != null) {
      emit(List.from(state)..add(newMessage));
    }
  }
}
