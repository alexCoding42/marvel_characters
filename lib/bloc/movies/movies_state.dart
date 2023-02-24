part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoadingState extends MoviesState {}

class MoviesLoadedState extends MoviesState {
  final List<Movie> movies;

  const MoviesLoadedState({required this.movies});

  @override
  List<Object> get props => [movies];
}

class MoviesErrorState extends MoviesState {
  final String errorMessage;

  const MoviesErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
