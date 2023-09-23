// Mocks generated by Mockito 5.4.2 from annotations
// in swapiinfo/test/usecase/starship_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:rxdart_ext/rxdart_ext.dart' as _i2;
import 'package:swapiinfo/domain/models/character.dart' as _i4;
import 'package:swapiinfo/domain/models/character_detail.dart' as _i5;
import 'package:swapiinfo/domain/models/homeworld.dart' as _i8;
import 'package:swapiinfo/domain/models/starship.dart' as _i6;
import 'package:swapiinfo/domain/models/vehicle.dart' as _i7;
import 'package:swapiinfo/domain/repository/repository.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSingle_0<T> extends _i1.SmartFake implements _i2.Single<T> {
  _FakeSingle_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Repository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRepository extends _i1.Mock implements _i3.Repository {
  MockRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Single<List<_i4.Character>> getCharacters() => (super.noSuchMethod(
        Invocation.method(
          #getCharacters,
          [],
        ),
        returnValue: _FakeSingle_0<List<_i4.Character>>(
          this,
          Invocation.method(
            #getCharacters,
            [],
          ),
        ),
      ) as _i2.Single<List<_i4.Character>>);
  @override
  _i2.Single<_i5.CharacterDetail> getCharacterById(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCharacterById,
          [id],
        ),
        returnValue: _FakeSingle_0<_i5.CharacterDetail>(
          this,
          Invocation.method(
            #getCharacterById,
            [id],
          ),
        ),
      ) as _i2.Single<_i5.CharacterDetail>);
  @override
  _i2.Single<_i6.Starship> getStarshipById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getStarshipById,
          [id],
        ),
        returnValue: _FakeSingle_0<_i6.Starship>(
          this,
          Invocation.method(
            #getStarshipById,
            [id],
          ),
        ),
      ) as _i2.Single<_i6.Starship>);
  @override
  _i2.Single<_i7.Vehicle> getVehicleById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getVehicleById,
          [id],
        ),
        returnValue: _FakeSingle_0<_i7.Vehicle>(
          this,
          Invocation.method(
            #getVehicleById,
            [id],
          ),
        ),
      ) as _i2.Single<_i7.Vehicle>);
  @override
  _i2.Single<_i8.Homeworld> getHomeworldById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getHomeworldById,
          [id],
        ),
        returnValue: _FakeSingle_0<_i8.Homeworld>(
          this,
          Invocation.method(
            #getHomeworldById,
            [id],
          ),
        ),
      ) as _i2.Single<_i8.Homeworld>);
}
