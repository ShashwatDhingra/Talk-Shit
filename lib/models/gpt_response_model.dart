import 'package:gemini_tut_app/models/gpt_body_model.dart';

class GptResponseModel {
  List<Candidates>? candidates;
  UsageMetadata? usageMetadata;

  GptResponseModel({this.candidates, this.usageMetadata});

  GptResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['candidates'] != null) {
      candidates = <Candidates>[];
      json['candidates'].forEach((v) {
        candidates!.add(new Candidates.fromJson(v));
      });
    }
    usageMetadata = json['usageMetadata'] != null
        ? new UsageMetadata.fromJson(json['usageMetadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.candidates != null) {
      data['candidates'] = this.candidates!.map((v) => v.toJson()).toList();
    }
    if (this.usageMetadata != null) {
      data['usageMetadata'] = this.usageMetadata!.toJson();
    }
    return data;
  }
}

class Candidates {
  Content? content;
  String? finishReason;
  int? index;
  List<SafetyRatings>? safetyRatings;

  Candidates({this.content, this.finishReason, this.index, this.safetyRatings});

  Candidates.fromJson(Map<String, dynamic> json) {
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    finishReason = json['finishReason'];
    index = json['index'];
    if (json['safetyRatings'] != null) {
      safetyRatings = <SafetyRatings>[];
      json['safetyRatings'].forEach((v) {
        safetyRatings!.add(new SafetyRatings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['finishReason'] = this.finishReason;
    data['index'] = this.index;
    if (this.safetyRatings != null) {
      data['safetyRatings'] =
          this.safetyRatings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  List<Parts>? parts;
  String? role;

  Content({this.parts, this.role});

  Content.fromJson(Map<String, dynamic> json) {
    if (json['parts'] != null) {
      parts = <Parts>[];
      json['parts'].forEach((v) {
        parts!.add(new Parts.fromJson(v));
      });
    }
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parts != null) {
      data['parts'] = this.parts!.map((v) => v.toJson()).toList();
    }
    data['role'] = this.role;
    return data;
  }
}

class SafetyRatings {
  String? category;
  String? probability;

  SafetyRatings({this.category, this.probability});

  SafetyRatings.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    probability = json['probability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['probability'] = this.probability;
    return data;
  }
}

class UsageMetadata {
  int? promptTokenCount;
  int? candidatesTokenCount;
  int? totalTokenCount;

  UsageMetadata(
      {this.promptTokenCount, this.candidatesTokenCount, this.totalTokenCount});

  UsageMetadata.fromJson(Map<String, dynamic> json) {
    promptTokenCount = json['promptTokenCount'];
    candidatesTokenCount = json['candidatesTokenCount'];
    totalTokenCount = json['totalTokenCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promptTokenCount'] = this.promptTokenCount;
    data['candidatesTokenCount'] = this.candidatesTokenCount;
    data['totalTokenCount'] = this.totalTokenCount;
    return data;
  }
}
