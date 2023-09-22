// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeopleResponse _$$_PeopleResponseFromJson(Map<String, dynamic> json) =>
    _$_PeopleResponse(
      json['name'] as String,
      json['height'] as String,
      json['mass'] as String,
      json['hair_color'] as String,
      json['skin_color'] as String,
      json['eye_color'] as String,
      json['birth_year'] as String,
      json['gender'] as String,
      json['homeworld'] as String,
      (json['films'] as List<dynamic>).map((e) => e as String).toList(),
      (json['species'] as List<dynamic>).map((e) => e as String).toList(),
      (json['vehicles'] as List<dynamic>).map((e) => e as String).toList(),
      (json['starships'] as List<dynamic>).map((e) => e as String).toList(),
      json['created'] as String,
      json['edited'] as String,
      json['url'] as String,
    );
