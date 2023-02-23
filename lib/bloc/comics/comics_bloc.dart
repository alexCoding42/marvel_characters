import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_characters/models/comic.dart';
import 'package:marvel_characters/services/webservice.dart';

part 'comics_event.dart';
part 'comics_state.dart';

class ComicsBloc extends Bloc<ComicsEvent, ComicsState> {
  final Webservice _webservice;

  ComicsBloc({required Webservice webservice})
      : _webservice = webservice,
        super(ComicsInitial()) {
    on<FetchComicsEvent>((event, emit) async {
      emit(ComicsLoadingState());

      try {
        final List<Comic> comics = await _webservice.fetchComics(event.query);
        emit(ComicsLoadedState(comics: comics));
      } catch (e) {
        emit(const ComicsErrorState(errorMessage: 'Failed to load comics'));
      }
    });

    on<ClearComicsEvent>((event, emit) {
      emit(ComicsInitial());
    });
  }
}
