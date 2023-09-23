// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:swapiinfo/ui/character_detail/view.dart' as _i1;
import 'package:swapiinfo/ui/characters/view.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CharacterDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterDetailRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CharacterDetailPage(
          id: args.id,
          key: args.key,
        ),
      );
    },
    CharactersRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CharactersPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CharacterDetailPage]
class CharacterDetailRoute extends _i3.PageRouteInfo<CharacterDetailRouteArgs> {
  CharacterDetailRoute({
    required String id,
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          CharacterDetailRoute.name,
          args: CharacterDetailRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterDetailRoute';

  static const _i3.PageInfo<CharacterDetailRouteArgs> page =
      _i3.PageInfo<CharacterDetailRouteArgs>(name);
}

class CharacterDetailRouteArgs {
  const CharacterDetailRouteArgs({
    required this.id,
    this.key,
  });

  final String id;

  final _i4.Key? key;

  @override
  String toString() {
    return 'CharacterDetailRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i2.CharactersPage]
class CharactersRoute extends _i3.PageRouteInfo<void> {
  const CharactersRoute({List<_i3.PageRouteInfo>? children})
      : super(
          CharactersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharactersRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
