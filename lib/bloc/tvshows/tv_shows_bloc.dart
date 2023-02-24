import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_characters/models/tvshow.dart';
import 'package:marvel_characters/services/webservice.dart';

part 'tv_shows_event.dart';
part 'tv_shows_state.dart';

class TvShowsBloc extends Bloc<TvShowsEvent, TvShowsState> {
  final Webservice _webservice;

  TvShowsBloc({required Webservice webservice})
      : _webservice = webservice,
        super(TvShowsInitial()) {
    on<FetchTvShowsEvent>((event, emit) async {
      emit(TvShowsLoadingState());

      try {
        final List<TvShow> tvShows = await _webservice.fetchTvShows();
        emit(TvShowsLoadedState(tvShows: tvShows));
      } catch (e) {
        emit(TvShowsErrorState(errorMessage: 'Failed to load TV shows'));
      }
    });
  }
}
