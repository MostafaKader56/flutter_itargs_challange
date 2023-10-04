import 'package:flutter/material.dart';
import 'package:flutter_itargs_challange/features/main/data/model/favorite_item_model.dart';
import 'package:flutter_itargs_challange/features/main/presentation/views/widgets/favorite_item_widget.dart';

import '../../../../../core/repo/local_database_helper.dart';
import '../../../../../generated/l10n.dart';

class TopLikesSection extends StatefulWidget {
  const TopLikesSection({super.key});

  @override
  State<TopLikesSection> createState() => _TopLikesSectionState();
}

class _TopLikesSectionState extends State<TopLikesSection> {
/*
  Note: 
  This can be done with sharedpreference but it's not the best solution for this case.
  Local database is better.
  And if it linked with the user account then it should be saved server-side.
*/
  List<FavoriteItemModel> _items = [];

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    await LocalDatabaseHelper.initDatabase();
    List<Map<String, dynamic>> itemMaps =
        await LocalDatabaseHelper.getFavorites();

    setState(() {
      _items = itemMaps.map((itemMap) {
        return FavoriteItemModel.fromJson(itemMap);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.current.top_likes,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            return FavoriteItemWidget(favoriteItem: _items[index]);
          },
        ),
      ],
    );
  }
}
