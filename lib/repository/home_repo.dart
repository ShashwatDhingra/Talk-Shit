import 'package:dio/dio.dart';
import 'package:gemini_tut_app/models/gpt_response_model.dart';
import 'package:gemini_tut_app/utils/api_paths.dart';
import 'package:gemini_tut_app/models/gpt_body_model.dart';

class HomeRepo {
  // Dependency Injection
  Dio _dio;

  HomeRepo(this._dio);

  // Function for getting resopse from Gemini Model
  Future<String> chatTextGeneration(GptBodyModel previousMessage) async {
    final response = await _dio.post(
      chatUrl,
      data: previousMessage.toJson(),
    );

    final gptResponse = GptResponseModel.fromJson(response.data);

    return gptResponse.candidates!.first.content!.parts!.first.text ?? '';
  }
}
