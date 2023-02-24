part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchMoviesEvent extends MoviesEvent {
  const FetchMoviesEvent();

  @override
  List<Object> get props => [];
}
