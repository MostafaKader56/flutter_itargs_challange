import 'package:flutter/material.dart';
import 'package:flutter_itargs_challange/core/functions/functions.dart';
import 'package:flutter_itargs_challange/core/repo/local_database_helper.dart';
import 'package:flutter_itargs_challange/features/main/data/model/favorite_item_model.dart';

class FavoriteItemWidget extends StatefulWidget {
  const FavoriteItemWidget({super.key, required this.favoriteItem});
  final FavoriteItemModel favoriteItem;

  @override
  State<FavoriteItemWidget> createState() => _FavoriteItemWidgetState();
}

class _FavoriteItemWidgetState extends State<FavoriteItemWidget> {
  @override
  Widget build(BuildContext context) {
    final title = Functions.isArabic()
        ? widget.favoriteItem.nameAr
        : widget.favoriteItem.nameEn;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          IconButton(
            onPressed: () {
              widget.favoriteItem.isFavorite = !widget.favoriteItem.isFavorite;
              LocalDatabaseHelper.toggleFavorite(
                  widget.favoriteItem.id, widget.favoriteItem.isFavorite);

              setState(() {});
            },
            icon: Icon(
              widget.favoriteItem.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_outline,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
