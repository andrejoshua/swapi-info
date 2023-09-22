// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlanetResponse _$$_PlanetResponseFromJson(Map<String, dynamic> json) =>
    _$_PlanetResponse(
      json['name'] as String,
      json['rotation_period'] as String,
      json['orbital_period'] as String,
      json['diameter'] as String,
      json['climate'] as String,
      json['gravity'] as String,
      json['terrain'] as String,
      json['surface_water'] as String,
      json['population'] as String,
      (json['residents'] as List<dynamic>).map((e) => e as String).toList(),
      (json['films'] as List<dynamic>).map((e) => e as String).toList(),
      json['created'] as String,
      json['edited'] as String,
      json['url'] as String,
    );
