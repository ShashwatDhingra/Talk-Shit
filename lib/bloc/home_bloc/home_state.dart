part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class ChatSuccessState extends HomeState {
  final List<Contents> content;
  final isLoading;
  ChatSuccessState(this.content, this.isLoading) {}
}
