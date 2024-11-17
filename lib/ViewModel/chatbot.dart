class ChatModel {
  String message;
  static String? searchMessage;

  ChatModel(this.message);


  static String formatMessage(String message) {
    return message.replaceAll(' ', '+');
  }
}
