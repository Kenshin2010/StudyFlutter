import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:infinite_list/models/comment.dart';

part 'comment_event.dart';
part 'comment_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CommentBloc extends Bloc<CommentEvent, CommentState> {

  CommentBloc({required this.httpClient}) : super(const CommentState()) {
    on<CommentFetched>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;

  Future<void> _onPostFetched(
    CommentFetched event,
    Emitter<CommentState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == CommentStatus.initial) {
        final comments = await _fetchComments();
        return emit(state.copyWith(
          status: CommentStatus.success,
          comments: comments,
          hasReachedMax: false,
        ));
      }
      final comments = await _fetchComments(state.comments.length);
      comments.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: CommentStatus.success,
                comments: List.of(state.comments)..addAll(comments),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: CommentStatus.failure));
    }
  }

  Future<List<Comment>> _fetchComments([int startIndex = 0]) async {
    final url =
        "https://jsonplaceholder.typicode.com/comments?_start=$startIndex&_limit=$_postLimit";
    print(url);
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return Comment(
            id: json['id'],
            name: json['name'],
            body: json['body'],
            email: json['email']
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}
