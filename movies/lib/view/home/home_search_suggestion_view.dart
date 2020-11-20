import 'package:flutter/material.dart';
import 'package:movies/util/constant.dart';
import 'package:movies/util/localization_manager.dart';

class HomeSearchSuggestionView  extends StatelessWidget {

  final void Function(String tag, String type) onPressed;

  HomeSearchSuggestionView(this.onPressed);

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          children: [
            Center(
                child: Text(LocalizationManger.i18n(context, 'home.tag'),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                )
            ),
            SizedBox(height: 30),
            _itemView(context, isTV: true),
            SizedBox(height: 30),
            _itemView(context),
          ],
        )
    );

  }

  Widget _itemView(BuildContext context, {bool isTV = false}) {

    const tv = [
      '美剧', '英剧', '韩剧',
      '日剧', '国产剧', '港剧',
      '日本动画', '综艺', '纪录片'],
        movie = [
          '经典','冷门佳片','华语','欧美',
          '韩国','日本','动作','喜剧',
          '爱情','科幻', '悬疑',
          '恐怖','治愈', '动画'];

    final tags = isTV ? tv: movie,
          title = isTV ? 'home.movie':'home.tv',
          type = isTV ? 'tv':'';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocalizationManger.i18n(context, title), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        SizedBox(height: 15),
        Wrap(
          spacing: 15,
          children: tags.map((tag) {
            return ActionChip(
              label: Text(tag, style: TextStyle(color: Colors.white)),
              backgroundColor: ConsColor.theme,
              onPressed: () {
                onPressed(tag, type);
              },
            );
          }).toList(),
        )
      ],
    );
  }
}
