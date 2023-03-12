import 'package:bloc/bloc.dart';
import 'package:cleanapp/src/domain/usecases/get_joke_usecase.dart';
import 'package:cleanapp/src/presentation/bloc/jokebloc/joke_state.dart';
import 'package:cleanapp/src/presentation/bloc/jokebloc/joke_event.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final GetJoke _getJoke;

  JokeBloc(this._getJoke) : super(JokeEmpty()) {
    on<OnGetJoke>((event, emit) async {
      emit(JokeLoading());

      final result = await _getJoke.execute();
      result.fold(
        (failure) => emit(JokeError(failure.message)),
        (data) => emit(
          JokeHasData(data),
        ),
      );
    });
  }
}
