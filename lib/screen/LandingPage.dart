import 'package:flutter/material.dart';
import 'package:inmobiliaria/custom/BorderIcon.dart';
import 'package:inmobiliaria/custom/OptionButton.dart';
import 'package:inmobiliaria/sample_data.dart';
import 'package:inmobiliaria/screen/DetailPage.dart';
import 'package:inmobiliaria/utils/constants.dart';
import 'package:inmobiliaria/utils/custom_functions.dart';
import 'package:inmobiliaria/utils/widget_functions.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double defaultPadding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: defaultPadding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(defaultPadding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderIcon(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.menu,
                            color: COLOR_BLACK,
                          ),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(20),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "San francisco",
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: 25,
                      color: COLOR_GREY,
                    ),
                  ),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children:
                          ["<\$220,000", "For Sale", "3-4 Beds", ">1000 sqft"]
                              .map((e) => ChoiceOption(
                                    text: e,
                                  ))
                              .toList(),
                    ),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: sidePadding,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: RE_DATA.length,
                        itemBuilder: (context, index) {
                          return RealEstateItem(
                            itemData: RE_DATA[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                width: size.width,
                child: Center(
                  child: OptionButton(
                    text: "Ver mapa",
                    icon: Icons.map_rounded,
                    width: size.width * 0.35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  RealEstateItem({Key? key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              itemData: itemData,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    itemData["image"],
                  ),
                ),
                Positioned(
                    child: BorderIcon(
                  padding: EdgeInsets.all(8),
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.favorite_border,
                    color: COLOR_BLACK,
                  ),
                ))
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text(
                  "${formatCurrency(itemData["amount"])}",
                  style: themeData.textTheme.headline1,
                ),
                addHorizontalSpace(10),
                Text(
                  "${itemData["address"]}",
                  style: themeData.textTheme.headline5,
                )
              ],
            ),
            addVerticalSpace(10),
            Text(
              '${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft',
              style: themeData.textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  ChoiceOption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: COLOR_GREY.withAlpha(25),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}
