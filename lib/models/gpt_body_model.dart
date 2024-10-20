class GptBodyModel {
  List<Contents>? contents;
  GenerationConfig? generationConfig;

  GptBodyModel({this.contents, this.generationConfig});

  GptBodyModel.fromJson(Map<String, dynamic> json) {
    if (json['contents'] != null) {
      contents = <Contents>[];
      json['contents'].forEach((v) {
        contents!.add(new Contents.fromJson(v));
      });
    }
    generationConfig = json['generationConfig'] != null
        ? new GenerationConfig.fromJson(json['generationConfig'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contents != null) {
      data['contents'] = this.contents!.map((v) => v.toJson()).toList();
    }
    if (this.generationConfig != null) {
      data['generationConfig'] = this.generationConfig!.toJson();
    }
    return data;
  }
}

class Contents {
  String? role;
  List<Parts>? parts;

  Contents({this.role, this.parts});

  Contents.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    if (json['parts'] != null) {
      parts = <Parts>[];
      json['parts'].forEach((v) {
        parts!.add(new Parts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    if (this.parts != null) {
      data['parts'] = this.parts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parts {
  String? text;

  Parts({this.text});

  Parts.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}

class GenerationConfig {
  int? temperature;
  int? topK;
  double? topP;
  int? maxOutputTokens;
  String? responseMimeType;

  GenerationConfig(
      {this.temperature,
      this.topK,
      this.topP,
      this.maxOutputTokens,
      this.responseMimeType});

  GenerationConfig.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    topK = json['topK'];
    topP = json['topP'];
    maxOutputTokens = json['maxOutputTokens'];
    responseMimeType = json['responseMimeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temperature'] = this.temperature;
    data['topK'] = this.topK;
    data['topP'] = this.topP;
    data['maxOutputTokens'] = this.maxOutputTokens;
    data['responseMimeType'] = this.responseMimeType;
    return data;
  }
}
