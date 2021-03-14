import 'package:flutter/material.dart';
import 'package:recipe_app/config/palette.dart' as palette;
import 'package:recipe_app/components/tags.dart';
import 'package:recipe_app/models/tag.dart';

class Recipe extends StatelessWidget {
  Recipe({Key key}) : super(key: key);

  final List<Tag> tags = [
    Tag(name: 'Tea leaves', image: AssetImage('assets/images/leaves.png')),
    Tag(name: 'Ice cubes', image: AssetImage('assets/images/ice.png')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191722),
      extendBodyBehindAppBar: true,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(10),
          padding: EdgeInsets.only(left: 5.0),
          decoration: BoxDecoration(
            color: palette.background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            color: palette.textLight,
            iconSize: 16,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: palette.background,
            child: ClipPath(
              clipper: CurvedClipper(),
              child: Container(
                decoration: BoxDecoration(
                  color: palette.background,
                  image: DecorationImage(
                    image: AssetImage('assets/images/tea.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * .42,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.25),
                        Colors.black.withOpacity(0.7),
                      ],
                      stops: [0.1, 1.0],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ClipPath(
              clipper: CurvedClipper(),
              child: Container(
                color: palette.background,
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thai tea',
                      style: TextStyle(color: palette.textLight, fontSize: 24),
                    ),
                    Text(
                      'by michael nicholas',
                      style: TextStyle(color: Colors.white.withOpacity(.5)),
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      'Thai tea is usually known as a Thai drink made from Ceylon tea, milk and sugar, and served hot or cold. It is popular in Southeast Asia and is served in many restaurants that serve Thai food.',
                      style: TextStyle(
                          color: Colors.white.withOpacity(.9), fontSize: 14),
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      'Ingredients',
                      style: TextStyle(color: palette.textLight, fontSize: 16),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 42,
                      child: Tags(
                        tags: tags,
                        selectedTagIndex: -1,
                        activeBorderColor: Colors.white,
                        inactiveBorderColor: palette.background,
                        activeTextColor: palette.textLight,
                        inactiveTextColor: palette.textLight,
                        borderRadius: BorderRadius.circular(8),
                        backgroundColor: palette.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Let\'s cook this',
                style: TextStyle(color: palette.textLight, fontSize: 15),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Colors.white.withOpacity(.7),
              )
            ],
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60);

    path.quadraticBezierTo(0, size.height - 40, 40, size.height - 30);

    path.lineTo(size.width - 40, size.height);

    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 30);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
