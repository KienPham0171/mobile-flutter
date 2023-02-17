import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse{
  bool success;
  String message;
  dynamic data;

  BaseResponse(this.success, this.message, this.data);

  @override
  String toString() {
    return 'BaseResponse{success: $success, message: $message, data: $data}';
  }
  factory BaseResponse.fromJson(Map<String,dynamic> json) => _$BaseResponseFromJson(json);
  Map<String,dynamic> toJson() => _$BaseResponseToJson(this);
}