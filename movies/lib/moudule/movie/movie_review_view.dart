import 'package:movies/model/comment_model.dart';
import 'package:movies/util/localization_manager.dart';
import 'package:movies/view/base_view.dart';
import 'package:movies/view/item/comment_item_view.dart';
import 'package:movies/view/webpage_view.dart';
import 'package:movies/view_model/movie_view_model.dart';
import 'package:flutter/material.dart';


class MovieReviewView extends BaseRefreshView<MovieReviewViewModel> {

  MovieReviewView(id)
      : super(
      title: 'movie.review',
      viewModel: MovieReviewViewModel(id),
      enablePullUp: true);

  @override
  Widget get bodyView {

    final list = viewModel.list;

    return ListView.builder(
        itemCount: list.subjects.length ?? 0,
        itemBuilder: (context, index) {

          CommentListItem item =  list.subjects[index];

          return CommentItemView(item, onTap: (){
            if (item.url.isNotEmpty) {
              WebpageView.open(context, item.url, title:  LocalizationManger.i18n(context, title));
            }
          });

        });
  }

}
