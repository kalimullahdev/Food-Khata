// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'users_balance_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UsersBalanceEventTearOff {
  const _$UsersBalanceEventTearOff();

  _Started started() {
    return const _Started();
  }
}

/// @nodoc
const $UsersBalanceEvent = _$UsersBalanceEventTearOff();

/// @nodoc
mixin _$UsersBalanceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersBalanceEventCopyWith<$Res> {
  factory $UsersBalanceEventCopyWith(
          UsersBalanceEvent value, $Res Function(UsersBalanceEvent) then) =
      _$UsersBalanceEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UsersBalanceEventCopyWithImpl<$Res>
    implements $UsersBalanceEventCopyWith<$Res> {
  _$UsersBalanceEventCopyWithImpl(this._value, this._then);

  final UsersBalanceEvent _value;
  // ignore: unused_field
  final $Res Function(UsersBalanceEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$UsersBalanceEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'UsersBalanceEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UsersBalanceEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
class _$UsersBalanceStateTearOff {
  const _$UsersBalanceStateTearOff();

  _UsersBalanceState call(
      {required int ikramBalance,
      required int kalimBalance,
      required int nafayBalance,
      required int umairBalance}) {
    return _UsersBalanceState(
      ikramBalance: ikramBalance,
      kalimBalance: kalimBalance,
      nafayBalance: nafayBalance,
      umairBalance: umairBalance,
    );
  }
}

/// @nodoc
const $UsersBalanceState = _$UsersBalanceStateTearOff();

/// @nodoc
mixin _$UsersBalanceState {
  int get ikramBalance => throw _privateConstructorUsedError;
  int get kalimBalance => throw _privateConstructorUsedError;
  int get nafayBalance => throw _privateConstructorUsedError;
  int get umairBalance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsersBalanceStateCopyWith<UsersBalanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersBalanceStateCopyWith<$Res> {
  factory $UsersBalanceStateCopyWith(
          UsersBalanceState value, $Res Function(UsersBalanceState) then) =
      _$UsersBalanceStateCopyWithImpl<$Res>;
  $Res call(
      {int ikramBalance, int kalimBalance, int nafayBalance, int umairBalance});
}

/// @nodoc
class _$UsersBalanceStateCopyWithImpl<$Res>
    implements $UsersBalanceStateCopyWith<$Res> {
  _$UsersBalanceStateCopyWithImpl(this._value, this._then);

  final UsersBalanceState _value;
  // ignore: unused_field
  final $Res Function(UsersBalanceState) _then;

  @override
  $Res call({
    Object? ikramBalance = freezed,
    Object? kalimBalance = freezed,
    Object? nafayBalance = freezed,
    Object? umairBalance = freezed,
  }) {
    return _then(_value.copyWith(
      ikramBalance: ikramBalance == freezed
          ? _value.ikramBalance
          : ikramBalance // ignore: cast_nullable_to_non_nullable
              as int,
      kalimBalance: kalimBalance == freezed
          ? _value.kalimBalance
          : kalimBalance // ignore: cast_nullable_to_non_nullable
              as int,
      nafayBalance: nafayBalance == freezed
          ? _value.nafayBalance
          : nafayBalance // ignore: cast_nullable_to_non_nullable
              as int,
      umairBalance: umairBalance == freezed
          ? _value.umairBalance
          : umairBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UsersBalanceStateCopyWith<$Res>
    implements $UsersBalanceStateCopyWith<$Res> {
  factory _$UsersBalanceStateCopyWith(
          _UsersBalanceState value, $Res Function(_UsersBalanceState) then) =
      __$UsersBalanceStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int ikramBalance, int kalimBalance, int nafayBalance, int umairBalance});
}

/// @nodoc
class __$UsersBalanceStateCopyWithImpl<$Res>
    extends _$UsersBalanceStateCopyWithImpl<$Res>
    implements _$UsersBalanceStateCopyWith<$Res> {
  __$UsersBalanceStateCopyWithImpl(
      _UsersBalanceState _value, $Res Function(_UsersBalanceState) _then)
      : super(_value, (v) => _then(v as _UsersBalanceState));

  @override
  _UsersBalanceState get _value => super._value as _UsersBalanceState;

  @override
  $Res call({
    Object? ikramBalance = freezed,
    Object? kalimBalance = freezed,
    Object? nafayBalance = freezed,
    Object? umairBalance = freezed,
  }) {
    return _then(_UsersBalanceState(
      ikramBalance: ikramBalance == freezed
          ? _value.ikramBalance
          : ikramBalance // ignore: cast_nullable_to_non_nullable
              as int,
      kalimBalance: kalimBalance == freezed
          ? _value.kalimBalance
          : kalimBalance // ignore: cast_nullable_to_non_nullable
              as int,
      nafayBalance: nafayBalance == freezed
          ? _value.nafayBalance
          : nafayBalance // ignore: cast_nullable_to_non_nullable
              as int,
      umairBalance: umairBalance == freezed
          ? _value.umairBalance
          : umairBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UsersBalanceState implements _UsersBalanceState {
  const _$_UsersBalanceState(
      {required this.ikramBalance,
      required this.kalimBalance,
      required this.nafayBalance,
      required this.umairBalance});

  @override
  final int ikramBalance;
  @override
  final int kalimBalance;
  @override
  final int nafayBalance;
  @override
  final int umairBalance;

  @override
  String toString() {
    return 'UsersBalanceState(ikramBalance: $ikramBalance, kalimBalance: $kalimBalance, nafayBalance: $nafayBalance, umairBalance: $umairBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UsersBalanceState &&
            (identical(other.ikramBalance, ikramBalance) ||
                const DeepCollectionEquality()
                    .equals(other.ikramBalance, ikramBalance)) &&
            (identical(other.kalimBalance, kalimBalance) ||
                const DeepCollectionEquality()
                    .equals(other.kalimBalance, kalimBalance)) &&
            (identical(other.nafayBalance, nafayBalance) ||
                const DeepCollectionEquality()
                    .equals(other.nafayBalance, nafayBalance)) &&
            (identical(other.umairBalance, umairBalance) ||
                const DeepCollectionEquality()
                    .equals(other.umairBalance, umairBalance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ikramBalance) ^
      const DeepCollectionEquality().hash(kalimBalance) ^
      const DeepCollectionEquality().hash(nafayBalance) ^
      const DeepCollectionEquality().hash(umairBalance);

  @JsonKey(ignore: true)
  @override
  _$UsersBalanceStateCopyWith<_UsersBalanceState> get copyWith =>
      __$UsersBalanceStateCopyWithImpl<_UsersBalanceState>(this, _$identity);
}

abstract class _UsersBalanceState implements UsersBalanceState {
  const factory _UsersBalanceState(
      {required int ikramBalance,
      required int kalimBalance,
      required int nafayBalance,
      required int umairBalance}) = _$_UsersBalanceState;

  @override
  int get ikramBalance => throw _privateConstructorUsedError;
  @override
  int get kalimBalance => throw _privateConstructorUsedError;
  @override
  int get nafayBalance => throw _privateConstructorUsedError;
  @override
  int get umairBalance => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UsersBalanceStateCopyWith<_UsersBalanceState> get copyWith =>
      throw _privateConstructorUsedError;
}
