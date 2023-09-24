// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/api/service.dart' as _i7;
import 'data/feature/repository.dart' as _i9;
import 'data/http/api_pre_module.dart' as _i17;
import 'data/http/client.dart' as _i6;
import 'domain/repository/repository.dart' as _i8;
import 'domain/usecase/get_character_by_id.dart' as _i10;
import 'domain/usecase/get_characters.dart' as _i11;
import 'domain/usecase/get_homeworld_by_id.dart' as _i12;
import 'domain/usecase/get_starships_by_ids.dart' as _i13;
import 'domain/usecase/get_vehicles_by_ids.dart' as _i14;
import 'domain/usecase/search_character_by_name.dart' as _i3;
import 'ui/character_detail/vm.dart' as _i15;
import 'ui/characters/vm.dart' as _i16;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final apiPreModule = _$ApiPreModule();
  gh.factory<_i3.SearchCharactersByName>(() => _i3.SearchCharactersByName());
  await gh.factoryAsync<String>(
    () => apiPreModule.getCacheDirectoryPath(),
    instanceName: 'TEMPORARY_DIRECTORY',
    preResolve: true,
  );
  gh.factory<_i4.DioCacheInterceptor>(() => apiPreModule
      .getCacheInterceptor(gh<String>(instanceName: 'TEMPORARY_DIRECTORY')));
  gh.lazySingleton<_i5.Dio>(
      () => apiPreModule.getDio(gh<_i4.DioCacheInterceptor>()));
  gh.factory<_i6.ApiClient>(() => _i6.ApiClient(gh<_i5.Dio>()));
  gh.factory<_i7.ApiService>(() => _i7.ApiService(gh<_i6.ApiClient>()));
  gh.factory<_i8.Repository>(() => _i9.RepositoryImpl(gh<_i7.ApiService>()));
  gh.factory<_i10.GetCharacterByIdUseCase>(
      () => _i10.GetCharacterByIdUseCase(gh<_i8.Repository>()));
  gh.factory<_i11.GetCharactersUseCase>(
      () => _i11.GetCharactersUseCase(gh<_i8.Repository>()));
  gh.factory<_i12.GetHomeworldByIdUseCase>(
      () => _i12.GetHomeworldByIdUseCase(gh<_i8.Repository>()));
  gh.factory<_i13.GetStarshipsByIdsUseCase>(
      () => _i13.GetStarshipsByIdsUseCase(gh<_i8.Repository>()));
  gh.factory<_i14.GetVehiclesByIdsUseCase>(
      () => _i14.GetVehiclesByIdsUseCase(gh<_i8.Repository>()));
  gh.factory<_i15.CharacterDetailViewModel>(() => _i15.CharacterDetailViewModel(
        gh<_i10.GetCharacterByIdUseCase>(),
        gh<_i14.GetVehiclesByIdsUseCase>(),
        gh<_i13.GetStarshipsByIdsUseCase>(),
        gh<_i12.GetHomeworldByIdUseCase>(),
      ));
  gh.factory<_i16.CharactersViewModel>(() => _i16.CharactersViewModel(
        gh<_i11.GetCharactersUseCase>(),
        gh<_i3.SearchCharactersByName>(),
      ));
  return getIt;
}

class _$ApiPreModule extends _i17.ApiPreModule {}
