import 'package:flutter/material.dart';
import 'package:infinite_list/models/comment.dart';

class CommentListItem extends StatelessWidget {
  const CommentListItem({Key? key, required this.comment}) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${comment.id}', style: textTheme.caption),
        title: Text(comment.name),
        isThreeLine: true,
        subtitle: Text(comment.body),
        dense: true,
      ),
    );
  }
}
