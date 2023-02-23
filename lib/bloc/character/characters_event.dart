part of 'characters_bloc.dart';

abstract class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class FetchCharactersEvent extends CharactersEvent {
  final String query;

  const FetchCharactersEvent(this.query);

  @override
  List<Object> get props => [query];
}

class ClearCharactersEvent extends CharactersEvent {}
