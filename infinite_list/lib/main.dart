import 'package:flutter/material.dart';
import 'package:infinite_list/blocs/comment_bloc.dart';
import 'package:infinite_list/events/comment_event.dart';
import 'infinite_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: BlocProvider(
          create: (context) => CommentBloc()..add(CommentFetchedEvent()),
          child: InfiniteList(),
        )
      ),
    );
  }
}
