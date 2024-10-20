import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gemini_tut_app/models/gpt_body_model.dart';
import 'package:gemini_tut_app/repository/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(ChatSuccessState([], false)) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }

  GptBodyModel chat = GptBodyModel(
      contents: [],
      generationConfig: GenerationConfig(
          temperature: 1,
          topK: 67,
          topP: 0.97,
          maxOutputTokens: 8192,
          responseMimeType: 'text/plain'));

  FutureOr<void> chatGenerateNewTextMessageEvent(
      ChatGenerateNewTextMessageEvent event, Emitter<HomeState> emit) async {
    chat.contents
        ?.add(Contents(role: 'user', parts: [Parts(text: event.inputMessage)]));

    emit(ChatSuccessState(chat.contents!, true));

    final responseText = await HomeRepo(Dio()).chatTextGeneration(chat);

    chat.contents
        ?.add(Contents(role: 'model', parts: [Parts(text: responseText)]));

    emit(ChatSuccessState(chat.contents!, false));
  }
}
