import 'package:movies/generated/l10n.dart';
import 'package:movies/model/comment_model.dart';
import 'package:movies/view/base_view.dart';
import 'package:movies/view/item/comment_item_view.dart';
import 'package:movies/view_model/movie_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MovieCommentView extends BaseRefreshView<MovieCommentViewModel> {


  MovieCommentView(id)
      : super(
      title: S.current.movie_comments,
      viewModel: MovieCommentViewModel(id),
      enablePullUp: true);

  @override
  Widget bodyView(BuildContext context) {


    final list = viewModel.list;

    return ListView.builder(
        itemCount: list.subjects.length ?? 0,
        itemBuilder: (context, index) {

          CommentListItem item =  list.subjects[index];
          return CommentItemView(item);

        });
  }

}
