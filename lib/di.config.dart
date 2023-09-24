// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/api/service.dart' as _i6;
import 'data/feature/repository.dart' as _i8;
import 'data/http/api_pre_module.dart' as _i16;
import 'data/http/client.dart' as _i5;
import 'domain/repository/repository.dart' as _i7;
import 'domain/usecase/get_character_by_id.dart' as _i9;
import 'domain/usecase/get_characters.dart' as _i10;
import 'domain/usecase/get_homeworld_by_id.dart' as _i11;
import 'domain/usecase/get_starships_by_ids.dart' as _i12;
import 'domain/usecase/get_vehicles_by_ids.dart' as _i13;
import 'domain/usecase/search_character_by_name.dart' as _i4;
import 'ui/character_detail/vm.dart' as _i14;
import 'ui/characters/vm.dart' as _i15;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final apiPreModule = _$ApiPreModule();
  gh.factory<_i3.Dio>(() => apiPreModule.getDio());
  gh.factory<_i4.SearchCharactersByName>(() => _i4.SearchCharactersByName());
  gh.factory<_i5.ApiClient>(() => _i5.ApiClient(gh<_i3.Dio>()));
  gh.factory<_i6.ApiService>(() => _i6.ApiService(gh<_i5.ApiClient>()));
  gh.factory<_i7.Repository>(() => _i8.RepositoryImpl(gh<_i6.ApiService>()));
  gh.factory<_i9.GetCharacterByIdUseCase>(
      () => _i9.GetCharacterByIdUseCase(gh<_i7.Repository>()));
  gh.factory<_i10.GetCharactersUseCase>(
      () => _i10.GetCharactersUseCase(gh<_i7.Repository>()));
  gh.factory<_i11.GetHomeworldByIdUseCase>(
      () => _i11.GetHomeworldByIdUseCase(gh<_i7.Repository>()));
  gh.factory<_i12.GetStarshipsByIdsUseCase>(
      () => _i12.GetStarshipsByIdsUseCase(gh<_i7.Repository>()));
  gh.factory<_i13.GetVehiclesByIdsUseCase>(
      () => _i13.GetVehiclesByIdsUseCase(gh<_i7.Repository>()));
  gh.factory<_i14.CharacterDetailViewModel>(() => _i14.CharacterDetailViewModel(
        gh<_i9.GetCharacterByIdUseCase>(),
        gh<_i13.GetVehiclesByIdsUseCase>(),
        gh<_i12.GetStarshipsByIdsUseCase>(),
        gh<_i11.GetHomeworldByIdUseCase>(),
      ));
  gh.factory<_i15.CharactersViewModel>(() => _i15.CharactersViewModel(
        gh<_i10.GetCharactersUseCase>(),
        gh<_i4.SearchCharactersByName>(),
      ));
  return getIt;
}

class _$ApiPreModule extends _i16.ApiPreModule {}
