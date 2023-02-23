part of 'characters_bloc.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class CharactersInitial extends CharactersState {}

class CharactersLoadingState extends CharactersState {}

class CharactersLoadedState extends CharactersState {
  final List<Character> characters;

  const CharactersLoadedState({required this.characters});

  @override
  List<Object> get props => [characters];
}

class CharactersErrorState extends CharactersState {
  final String errorMessage;

  const CharactersErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
