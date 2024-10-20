part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ChatGenerateNewTextMessageEvent extends HomeEvent {
  final String inputMessage;

  ChatGenerateNewTextMessageEvent({
    required this.inputMessage
  }){}
}
