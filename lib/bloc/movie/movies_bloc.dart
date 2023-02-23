import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_characters/models/movie.dart';
import 'package:marvel_characters/services/webservice.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final Webservice _webservice;

  MoviesBloc({required Webservice webservice})
      : _webservice = webservice,
        super(MoviesInitial()) {
    on<FetchMoviesEvent>((event, emit) async {
      emit(MoviesLoadingState());

      try {
        final List<Movie> movies = await _webservice.fetchMovies();
        emit(MoviesLoadedState(movies: movies));
      } catch (e) {
        emit(MoviesErrorState(errorMessage: 'Failed to load movies'));
      }
    });
  }
}
