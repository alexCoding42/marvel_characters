part of 'comics_bloc.dart';

abstract class ComicsEvent extends Equatable {
  const ComicsEvent();

  @override
  List<Object> get props => [];
}

class FetchComicsEvent extends ComicsEvent {
  final String query;

  const FetchComicsEvent(this.query);

  @override
  List<Object> get props => [query];
}

class ClearComicsEvent extends ComicsEvent {}
