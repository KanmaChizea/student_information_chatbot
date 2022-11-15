import 'package:flutter_bloc/flutter_bloc.dart';
import 'dialogflow_service.dart';
import '../models/chat.dart';

class MessageCubit extends Cubit<List<ChatMessage>> {
  MessageCubit({required this.dialogFlowService})
      : super([
          ChatMessage(text: 'Hello! How can I help you today?', isSender: false)
        ]);
  final DialogFlowService dialogFlowService;

  bool isTyping = false;

  sendMessage(String text) {
    if (text.isNotEmpty) {
      emit([...state, ChatMessage(text: text, isSender: true)]);

      isTyping = true;
    }
  }

  getResponse(String text) async {
    final newMessage = await dialogFlowService.getResponse(text);

    if (newMessage != null) {
      emit([...state, newMessage]);
      isTyping = false;
    }
  }
}
