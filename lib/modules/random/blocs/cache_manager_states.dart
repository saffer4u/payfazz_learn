import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class CacheManagerState extends Equatable {
  const CacheManagerState();
  @override
  List<Object?> get props => [];
}

class CacheManagerInitialState extends CacheManagerState {}

class CacheManagerLoadingState extends CacheManagerState {}

class CacheManagerSuccess extends CacheManagerState {
  final File file;
  const CacheManagerSuccess({required this.file});
}
