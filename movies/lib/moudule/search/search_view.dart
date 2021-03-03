import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/generated/l10n.dart';
import 'package:movies/moudule/search/search_results_view.dart';
import 'package:movies/moudule/search/search_suggestions_view.dart';
import 'package:movies/util/constant.dart';
import 'package:movies/util/util.dart';


class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  bool _isSearching = false;

  final _duration = const Duration(milliseconds: 300);
  final _suggestionsView = SearchSuggestionsView();
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Stack(
          alignment: Alignment.center,
          children: [
            Row(children: [_leftView]),
            _titleView,
            Row(
                children: [_rightView],
                mainAxisAlignment: MainAxisAlignment.end),
          ],
        ),
      ),
      body: _suggestionsView,
    );
  }

  Widget get _titleView {
    return AnimatedOpacity(
        duration: _duration, opacity: _isSearching ? 0 : 1, child: Text(S.of(context).search_recommended));
  }

  Widget get _leftView {
    return AnimatedCrossFade(
      duration: _duration,
      firstChild: ActionChip(
          elevation: 1,
          backgroundColor: themeData(context).scaffoldBackgroundColor,
          avatar: Icon(Icons.search),
          label: Text(S.of(context).search_title),
          onPressed: () {
            setState(() {
              FocusScope.of(context).requestFocus(_focusNode);
              _isSearching = true;
            });
          }),
      secondChild: Container(
        child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            cursorColor: ConsColor.theme,
            textInputAction: TextInputAction.search,
            maxLines: 1,
            onSubmitted: showResults,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: S.of(context).search_find,
            )),
        width: screenWidth(context) * 3 / 4,
      ),
      crossFadeState:
          _isSearching ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }

  Widget get _rightView {

    return _isSearching ? InkWell(
      child: Icon(Icons.close, size: 30),
      onTap: () {
        setState(() {
          _controller.clear();
          _focusNode.unfocus();
          _isSearching = false;
        });
      },
    ): SizedBox();

  }

  showResults(String text) {
    if (text.isEmpty) {
      showSnackBar(context, S.of(context).search_hint);
    } else {
      showModalContent(context, S.of(context).search_results, SearchResultsView(text));
    }
  }

}
