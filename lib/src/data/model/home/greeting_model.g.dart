// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greeting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GreetingModel _$GreetingModelFromJson(Map<String, dynamic> json) =>
    _GreetingModel(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$GreetingModelToJson(_GreetingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'created_at': instance.createdAt,
    };
