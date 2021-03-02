import 'package:flutter/material.dart';
import 'package:infinite_list/blocs/comment_bloc.dart';
import 'package:infinite_list/service/comment_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/states/comment_state.dart';

import 'events/comment_event.dart';

class InfiniteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfiniteListState();
  }
}

class InfiniteListState extends State<InfiniteList> {
  ScrollController _scrollController = ScrollController();

  CommentBloc _commentBloc;

  final _scrollThreadhold = 250.0;

  @override
  void initState() {
    _commentBloc = BlocProvider.of(context);
    _scrollController.addListener(() {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if (maxScrollExtent - currentScroll < _scrollThreadhold)
        _commentBloc.add(CommentFetchedEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    getComments(0, 20);
    return Scaffold(
        appBar: AppBar(
          title: Text('This is a infinite list'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: SafeArea(
          child:
              BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
            if (state is CommentStateInitial)
              return Center(
                child: CircularProgressIndicator(),
              );
            if (state is CommentStateFailure)
              return Center(
                child: Text('Errors'),
              );
            if (state is CommentStateSuccess) {
              final comments = state.comments;
              if (comments.isEmpty)
                return Center(
                  child: Text('Empty!'),
                );
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Column(children: [
                      Text(
                        '${index + 1}',
                        style: TextStyle(fontSize: 15),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Icon(
                        Icons.face,
                        size: 35,
                      )
                    ]),
                    title: Text('Name : ${comments[index].name}'),
                    subtitle: Text('${comments[index].body}'),
                  );
                },
                itemCount: comments.length,
                controller: _scrollController,
              );
            }
            return Text('Another state');
          }),
        ));
  }
}
