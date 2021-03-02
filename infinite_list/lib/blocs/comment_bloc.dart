import 'package:infinite_list/events/comment_event.dart';
import 'package:infinite_list/service/comment_service.dart';
import 'package:infinite_list/states/comment_state.dart';
import 'package:bloc/bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  static const int SIZE_PAGE = 20;

  CommentBloc() : super(CommentStateInitial());

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    try {
      final hasReachedEndOfPage = (state is CommentStateSuccess) &&
          (state as CommentStateSuccess).hasReachedEnd;
      if (event is CommentFetchedEvent && !hasReachedEndOfPage) {
        if (state is CommentStateInitial) {
          final comments = await getComments(0, SIZE_PAGE);
          yield CommentStateSuccess(comments: comments, hasReachedEnd: false);
        } else
          if (state is CommentStateSuccess) {
          final currentPage = state as CommentStateSuccess;
          final indexOfPage = currentPage.comments.length;
          final nextPage = await getComments(indexOfPage, SIZE_PAGE);
          if (nextPage.isEmpty)
            yield currentPage.clone(hasReachedEnd: true);
          else {
            yield CommentStateSuccess(
                comments: currentPage.comments + nextPage,
                hasReachedEnd: false);
          }
        }
      }
    } catch (exception) {
      yield CommentStateFailure(exception.toString());
    }
  }
}
