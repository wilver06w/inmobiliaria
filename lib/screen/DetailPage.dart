import 'package:flutter/material.dart';
import 'package:inmobiliaria/custom/BorderIcon.dart';
import 'package:inmobiliaria/utils/constants.dart';
import 'package:inmobiliaria/utils/custom_functions.dart';
import 'package:inmobiliaria/utils/widget_functions.dart';

class DetailPage extends StatelessWidget {
  final dynamic itemData;

  DetailPage({Key? key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        backgroundColor: COLOR_WHITE,
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          itemData["image"],
                        ),
                        Positioned(
                          width: size.width,
                          top: padding,
                          child: Padding(
                            padding: sidePadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: BorderIcon(
                                    height: 50,
                                    width: 50,
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.keyboard_backspace,
                                      color: COLOR_BLACK,
                                    ),
                                  ),
                                ),
                                BorderIcon(
                                  padding: EdgeInsets.all(8),
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: COLOR_BLACK,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${formatCurrency(itemData["amount"])}",
                                style: themeData.textTheme.headline1,
                              ),
                              addVerticalSpace(5),
                              Text(
                                "\ ${itemData["address"]}",
                                style: themeData.textTheme.subtitle2,
                              ),
                            ],
                          ),
                          BorderIcon(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            width: 100,
                            height: 100,
                            child: Text(
                              "20 Hours ago",
                              style: themeData.textTheme.headline5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        "Informacion casa",
                        style: themeData.textTheme.headline4,
                      ),
                    ),
                    addVerticalSpace(padding),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InformationTile(
                            content: '${itemData['area']}',
                            name: "Square Foot",
                          ),
                          InformationTile(
                            content: '${itemData['bedrooms']}',
                            name: "Bedrooms",
                          ),
                          InformationTile(
                            content: '${itemData['bathrooms']}',
                            name: "bathrooms",
                          ),
                          InformationTile(
                            content: '${itemData['garage']}',
                            name: "garage",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationTile extends StatelessWidget {
  final String content;
  final String name;

  InformationTile({Key? key, required this.content, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final double tileSize = size.width * 0.20;
    return Container(
      margin: EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BorderIcon(
            padding: EdgeInsets.all(8),
            width: tileSize,
            height: tileSize,
            child: Text(
              content,
              style: themeData.textTheme.headline3,
            ),
          ),
          addVerticalSpace(15),
          Text(
            name,
            style: themeData.textTheme.headline6,
          )
        ],
      ),
    );
  }
}
