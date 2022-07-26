import 'package:equatable/equatable.dart';
import 'package:payfazz_learn/retrofit/models/post.dart';

abstract class NetworkingState extends Equatable {
  const NetworkingState();

  @override
  List<Object?> get props => [];
}

class NetworkingLoadingState extends NetworkingState {}

class NetworkingInitialState extends NetworkingState {}

class NetworkingSuccessState extends NetworkingState {
  final List<Post> posts;
  const NetworkingSuccessState({required this.posts});
}

class NetworkingErrorState extends NetworkingState {
  final String message;
  const NetworkingErrorState({required this.message});
}
