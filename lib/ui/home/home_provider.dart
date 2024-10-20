import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  ScrollController scrollController = ScrollController();
  TextEditingController textController = TextEditingController();

  // Future<void> addResponse() async {
  //   // Show loading
  //   loadBotChat();
  //   await Future.delayed(Duration(milliseconds: 200));
  //   scrollToBottom();
  //   await Future.delayed(const Duration(seconds: 2));
  //   cancelLoadBotChat();

  //   chat.add({"role": "bot", "message": "I got it"});
  //   await Future.delayed(Duration(milliseconds: 200));
  //   scrollToBottom();
  //   notifyListeners();
  // }

  // Future<void> loadBotChat() async {
  //   chat.add({"status": "loading"});
  //   notifyListeners();
  // }

  // Future<void> cancelLoadBotChat() async {
  //   chat.removeLast();
  //   notifyListeners();
  // }

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
