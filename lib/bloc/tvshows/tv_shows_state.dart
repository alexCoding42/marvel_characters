part of 'tv_shows_bloc.dart';

abstract class TvShowsState extends Equatable {
  const TvShowsState();

  @override
  List<Object> get props => [];
}

class TvShowsInitial extends TvShowsState {}

class TvShowsLoadingState extends TvShowsState {}

class TvShowsLoadedState extends TvShowsState {
  final List<TvShow> tvShows;

  const TvShowsLoadedState({required this.tvShows});

  @override
  List<Object> get props => [tvShows];
}

class TvShowsErrorState extends TvShowsState {
  final String errorMessage;

  const TvShowsErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
