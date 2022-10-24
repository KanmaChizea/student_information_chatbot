// ignore: import_of_legacy_library_into_null_safe
import 'dart:developer';

import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:student_information_chatbot/models/chat.dart';

class DialogFlowService {
  Future<ChatMessage?> getResponse(String query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "credentials.json").build();

    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);

    AIResponse response = await dialogflow.detectIntent(query);

    ChatMessage message = ChatMessage(
      text: response.getMessage() ??
          CardDialogflow(response.getListMessage()[0]).title,
      isSender: false,
    );
    return message;
  }
}
