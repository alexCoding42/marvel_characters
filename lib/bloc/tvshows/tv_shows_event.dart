part of 'tv_shows_bloc.dart';

abstract class TvShowsEvent extends Equatable {
  const TvShowsEvent();

  @override
  List<Object> get props => [];
}

class FetchTvShowsEvent extends TvShowsEvent {
  const FetchTvShowsEvent();

  @override
  List<Object> get props => [];
}
