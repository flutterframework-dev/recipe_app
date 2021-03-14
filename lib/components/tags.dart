import 'package:flutter/material.dart';
import 'package:recipe_app/models/tag.dart';

class Tags extends StatelessWidget {
  final List<Tag> tags;
  final int selectedTagIndex;
  final Color activeBorderColor;
  final Color inactiveBorderColor;
  final Color activeTextColor;
  final Color inactiveTextColor;
  final BorderRadius borderRadius;
  final Color backgroundColor;

  const Tags({
    Key key,
    @required this.tags,
    @required this.selectedTagIndex,
    this.activeBorderColor,
    this.inactiveBorderColor,
    this.activeTextColor,
    this.inactiveTextColor,
    @required this.borderRadius,
    @required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tags.length,
      itemBuilder: (context, index) {
        return Container(
          padding: index == selectedTagIndex
              ? EdgeInsets.symmetric(horizontal: 26, vertical: 6)
              : EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              width: 1.0,
              color: index == selectedTagIndex
                  ? activeBorderColor
                  : inactiveBorderColor,
            ),
            borderRadius: borderRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (tags[index].image != null) Image(image: tags[index].image),
              if (tags[index].image != null) SizedBox(width: 5.0),
              Text(
                tags[index].name,
                style: TextStyle(
                  fontSize: 13,
                  color: index == selectedTagIndex
                      ? activeTextColor
                      : inactiveTextColor,
                ),
              ),
            ],
          ),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
