// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VehicleResponse _$$_VehicleResponseFromJson(Map<String, dynamic> json) =>
    _$_VehicleResponse(
      json['name'] as String,
      json['model'] as String,
      json['manufacturer'] as String,
      json['cost_in_credits'] as String,
      json['length'] as String,
      json['max_atmosphering_speed'] as String,
      json['crew'] as String,
      json['passengers'] as String,
      json['cargo_capacity'] as String,
      json['consumables'] as String,
      json['vehicle_class'] as String,
      (json['pilots'] as List<dynamic>).map((e) => e as String).toList(),
      (json['films'] as List<dynamic>).map((e) => e as String).toList(),
      json['created'] as String,
      json['edited'] as String,
      json['url'] as String,
    );
