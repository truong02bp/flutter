import 'package:equatable/equatable.dart';
import 'package:infinite_list/models/Comment.dart';
class CommentState extends Equatable {



  @override
  // TODO: implement props
  List<Object> get props => [];

  CommentState();
}

class CommentStateSuccess extends CommentState {

  List<Comment> comments;

  bool hasReachedEnd;

  CommentStateSuccess({this.comments, this.hasReachedEnd});

  CommentStateSuccess clone({List<Comment> comments, bool hasReachedEnd}){
    return CommentStateSuccess(comments: comments != null ? comments : this.comments,
        hasReachedEnd: hasReachedEnd != null ? hasReachedEnd : this.hasReachedEnd);
  }

  @override
  List<Object> get props => [comments, hasReachedEnd];
}

class CommentStateInitial extends CommentState {

}

class CommentStateFailure extends CommentState {
  String message;

  CommentStateFailure(this.message);

}

