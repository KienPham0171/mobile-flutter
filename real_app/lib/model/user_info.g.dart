// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      isLogin: json['isLogin'] as bool? ?? false,
      userName: json['userName'] as String? ?? "Guest",
      age: json['age'] as String? ?? "-999",
      role: json['role'] as String? ?? "guest",
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'isLogin': instance.isLogin,
      'userName': instance.userName,
      'age': instance.age,
      'role': instance.role,
    };
