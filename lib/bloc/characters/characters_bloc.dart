import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_characters/models/character.dart';
import 'package:marvel_characters/services/webservice.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final Webservice _webservice;

  CharactersBloc({required Webservice webservice})
      : _webservice = webservice,
        super(CharactersInitial()) {
    on<FetchCharactersEvent>((event, emit) async {
      emit(CharactersLoadingState());

      try {
        final List<Character> characters =
            await _webservice.fetchCharacters(event.query);
        emit(CharactersLoadedState(characters: characters));
      } catch (e) {
        emit(const CharactersErrorState(
            errorMessage: 'Failed to load characters'));
      }
    });

    on<ClearCharactersEvent>((event, emit) {
      emit(CharactersInitial());
    });
  }
}
