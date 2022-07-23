import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/bloc/comment_bloc.dart';
import 'package:infinite_list/widget/comment_list_item.dart';
import 'package:infinite_list/widget/bottom_loader.dart';

class InfiniteList extends StatefulWidget {
  const InfiniteList({Key? key}) : super(key: key);

  @override
  _CommentsListState createState() => _CommentsListState();
}

class _CommentsListState extends State<InfiniteList> {

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) context.read<CommentBloc>().add(CommentFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          switch (state.status) {
            case CommentStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case CommentStatus.success:
              if (state.comments.isEmpty) {
                return const Center(child: Text('no posts'));
              }
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.comments.length
                      ? const BottomLoader()
                      : CommentListItem(comment: state.comments[index]);
                },
                itemCount: state.hasReachedMax
                    ? state.comments.length
                    : state.comments.length + 1,
                controller: _scrollController,
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}


