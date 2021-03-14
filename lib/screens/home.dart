import 'package:flutter/material.dart';
import 'package:recipe_app/config/palette.dart' as palette;
import 'package:recipe_app/components/tags.dart';
import 'package:recipe_app/components/recipe_card.dart';
import 'package:recipe_app/components/search.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:recipe_app/models/tag.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTagIndex = 0;

  final List<Widget> recipeCards = [
    RecipeCard(
      image: AssetImage('assets/images/cocktail.jpg'),
      title: "Best cocktails \nof the day",
      isNew: true,
    ),
    RecipeCard(
      image: AssetImage('assets/images/cocktail_2.jpg'),
      title: "Best cocktails \nof the day",
      isNew: true,
    ),
    RecipeCard(
      image: AssetImage('assets/images/charlotte.jpg'),
      title: "Best cocktails \nof the day",
      isNew: true,
    ),
  ];

  final List<Tag> tags = [
    Tag(name: 'All', image: null),
    Tag(name: 'Beverages', image: null),
    Tag(name: 'Pizza', image: null),
    Tag(name: 'Soup', image: null)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: palette.background,
      appBar: new AppBar(
        backgroundColor: palette.background,
        elevation: 0,
        leading: Icon(
          Icons.short_text,
          size: 28,
          color: palette.textLight,
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CircleAvatar(
              backgroundColor: palette.secondary,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDhVoqZVRdPWcuTCEHaphmign8QVLxGeyCXQ&usqp=CAU'),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Let\'s cook \nsomething new',
                      style: TextStyle(
                          color: palette.textLight, fontSize: 26, height: 1.3)),
                  SizedBox(height: 25),
                  Search(),
                  SizedBox(height: 20),
                  Container(
                    height: 42,
                    child: Tags(
                      tags: tags,
                      selectedTagIndex: selectedTagIndex,
                      activeBorderColor: palette.textLight,
                      inactiveBorderColor: palette.background,
                      activeTextColor: palette.textLight,
                      inactiveTextColor: Colors.white.withOpacity(.5),
                      borderRadius: BorderRadius.circular(90),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StackedCardCarousel(
                items: recipeCards,
                spaceBetweenItems: 280,
                initialOffset: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
