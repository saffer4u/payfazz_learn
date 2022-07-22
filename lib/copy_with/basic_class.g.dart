// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_class.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BasicClassCWProxy {
  BasicClass id(String id);

  BasicClass text(String? text);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BasicClass(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BasicClass(...).copyWith(id: 12, name: "My name")
  /// ````
  BasicClass call({
    String? id,
    String? text,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBasicClass.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBasicClass.copyWith.fieldName(...)`
class _$BasicClassCWProxyImpl implements _$BasicClassCWProxy {
  final BasicClass _value;

  const _$BasicClassCWProxyImpl(this._value);

  @override
  BasicClass id(String id) => this(id: id);

  @override
  BasicClass text(String? text) => this(text: text);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BasicClass(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BasicClass(...).copyWith(id: 12, name: "My name")
  /// ````
  BasicClass call({
    Object? id = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
  }) {
    return BasicClass(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String?,
    );
  }
}

extension $BasicClassCopyWith on BasicClass {
  /// Returns a callable class that can be used as follows: `instanceOfBasicClass.copyWith(...)` or like so:`instanceOfBasicClass.copyWith.fieldName(...)`.
  _$BasicClassCWProxy get copyWith => _$BasicClassCWProxyImpl(this);
}
