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

import 'data/api/service.dart' as _i5;
import 'data/feature/repository.dart' as _i7;
import 'data/http/api_pre_module.dart' as _i15;
import 'data/http/client.dart' as _i4;
import 'domain/repository/repository.dart' as _i6;
import 'domain/usecase/get_character_by_id.dart' as _i8;
import 'domain/usecase/get_characters.dart' as _i9;
import 'domain/usecase/get_homeworld_by_id.dart' as _i10;
import 'domain/usecase/get_starships_by_ids.dart' as _i11;
import 'domain/usecase/get_vehicles_by_ids.dart' as _i12;
import 'ui/character_detail/vm.dart' as _i13;
import 'ui/characters/vm.dart' as _i14;

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
  gh.factory<_i4.ApiClient>(() => _i4.ApiClient(gh<_i3.Dio>()));
  gh.factory<_i5.ApiService>(() => _i5.ApiService(gh<_i4.ApiClient>()));
  gh.factory<_i6.Repository>(() => _i7.RepositoryImpl(gh<_i5.ApiService>()));
  gh.factory<_i8.GetCharacterByIdUseCase>(
      () => _i8.GetCharacterByIdUseCase(gh<_i6.Repository>()));
  gh.factory<_i9.GetCharactersUseCase>(
      () => _i9.GetCharactersUseCase(gh<_i6.Repository>()));
  gh.factory<_i10.GetHomeworldByIdUseCase>(
      () => _i10.GetHomeworldByIdUseCase(gh<_i6.Repository>()));
  gh.factory<_i11.GetStarshipsByIdsUseCase>(
      () => _i11.GetStarshipsByIdsUseCase(gh<_i6.Repository>()));
  gh.factory<_i12.GetVehiclesByIdsUseCase>(
      () => _i12.GetVehiclesByIdsUseCase(gh<_i6.Repository>()));
  gh.factory<_i13.CharacterDetailViewModel>(() => _i13.CharacterDetailViewModel(
        gh<_i8.GetCharacterByIdUseCase>(),
        gh<_i12.GetVehiclesByIdsUseCase>(),
        gh<_i11.GetStarshipsByIdsUseCase>(),
        gh<_i10.GetHomeworldByIdUseCase>(),
      ));
  gh.factory<_i14.CharactersViewModel>(
      () => _i14.CharactersViewModel(gh<_i9.GetCharactersUseCase>()));
  return getIt;
}

class _$ApiPreModule extends _i15.ApiPreModule {}
