part of 'comics_bloc.dart';

abstract class ComicsState extends Equatable {
  const ComicsState();

  @override
  List<Object> get props => [];
}

class ComicsInitial extends ComicsState {}

class ComicsLoadingState extends ComicsState {}

class ComicsLoadedState extends ComicsState {
  final List<Comic> comics;

  const ComicsLoadedState({required this.comics});

  @override
  List<Object> get props => [comics];
}

class ComicsErrorState extends ComicsState {
  final String errorMessage;

  const ComicsErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
