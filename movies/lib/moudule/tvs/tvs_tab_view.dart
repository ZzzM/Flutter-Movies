import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/generated/l10n.dart';
import 'package:movies/model/movie_model.dart';
import 'package:movies/util/constant.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/view/base_view.dart';
import 'package:movies/view/item/list_item_view.dart';
import 'package:movies/view_model/locale_view_model.dart';
import 'package:movies/view_model/tvs_view_model.dart';
import 'package:provider/provider.dart';

class TVsTabView extends BaseRefreshView<TVsViewModel> {

  final String type;
  final List<String> tags;

  TVsTabView(this.type, this.tags)
      : super(
            viewModel: TVsViewModel(tags.first),
            enableAppBar: false,
            enablePullUp: true);



  List<String>  get _tagTitles {
    if (type == 'tv') {
      return [S.current.tv_hot, S.current.tv_domestic, S.current.tv_american, S.current.tv_japanese, S.current.tv_korean, S.current.tv_animation];
    }
    return [S.current.show_hot, S.current.show_domestic, S.current.show_foreign];
  }


  @override
  Widget bodyView(BuildContext context) {
    final list = viewModel.list;

    return ListView.builder(
        key: PageStorageKey(tags.first),
        itemCount: list.subjects.length + 1,
        itemBuilder: (context, index) {


          if (index == 0) {
            return _tagView;
          }

          MovieListItem item = list.subjects[index - 1];

          return SizedBox(
            child: ListItemView(item, () {
              RouterManager.toDetail(
                  context, RouterType.detail, item.path, item.title);
            }),
            height: 150,
          );
        });
  }

  Widget get _tagView {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 15,
        children: tags.asMap().entries.map((entry) {

          final index = entry.key, tag = entry.value,  selected = viewModel.id == tag;

          return ChoiceChip(
              label: Consumer<LocaleViewModel>(
                builder: (context, _, __) {
                  return Text(_tagTitles[index]);
              }),
              labelStyle: selected ? TextStyle(color: ConsColor.theme) : TextStyle(color: ConsColor.border),
              selectedColor: ConsColor.theme.withOpacity(0.3),
              backgroundColor: ConsColor.border.withOpacity(0.1),
              selected: selected,
              onSelected: (_) {
                viewModel.update(tag);
              },
          );
    
        }).toList(),
      ),
    );
  }


}
