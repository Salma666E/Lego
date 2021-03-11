import 'package:LegoApp/features/themes/categoryAvatar.dart';
import 'package:LegoApp/features/themes/categoryCard.dart';
import 'package:LegoApp/features/themes/staticCarousel.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CategoryCard(
          containerColor: Color(0xFF00051B),
          imgURL:
              "https://www.lego.com/cdn/cs/set/assets/bltf7be226735a5d446/Marvel_-_SpidersMan_-_Intro_-_Sidekick-Standard.jpg?fit=crop&format=jpg&quality=80&width=800&height=426&dpr=1",
          title: translator.translate('LegoSpiderManTitle'),
          description: translator.translate('LegoSpiderManDescription'),
          showBtn: false,
        ),
        SizedBox(
          height: 20,
        ),
        Wrap(
          alignment: WrapAlignment.spaceAround,
          children: [
            CategoryAvatar(
              imgURL:
                  'https://www.lego.com/cdn/cs/set/assets/blt3ac76cef4c1e5604/marvel-spider-man-icon.jpg?fit=crop&format=jpg&quality=80&width=80&height=65&dpr=1',
              name: translator.translate('Spider'),
            ),
            CategoryAvatar(
              imgURL:
                  'https://www.lego.com/cdn/cs/set/assets/bltb92ef962613e63b5/marvel-avengers-icon.jpg?fit=crop&format=jpg&quality=80&width=80&height=65&dpr=1',
              name: translator.translate('Avengers'),
            ),
            CategoryAvatar(
              imgURL:
                  'https://www.lego.com/cdn/cs/set/assets/blt6e68f542cdc174f5/marvel-characters-icon.jpg?fit=crop&format=jpg&quality=80&width=80&height=65&dpr=1',
              name: translator.translate('Characters'),
            ),
            CategoryAvatar(
              imgURL:
                  'https://www.lego.com/cdn/cs/set/assets/blt6fb7bec5706340a4/marvel-games-icon.jpg?fit=crop&format=jpg&quality=80&width=80&height=65&dpr=1',
              name: translator.translate('Games'),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        CategoryCard(
          containerColor: Color(0xFFA92F26),
          imgURL:
              "https://www.lego.com/cdn/cs/set/assets/bltc34159ed9f8d873c/Marvel_-_SpidersMan_-Molten_Man_-_Sidekick-Tall.jpg?fit=crop&format=jpg&quality=80&width=800&height=600&dpr=1",
          title: translator.translate('MoltenTitle'),
          description: translator.translate('MoltenDescription'),
          showBtn: true,
        ),
        StaticCarousel(
          img1:
              'https://www.lego.com/cdn/cs/set/assets/blta6383d1d265fb5b8/Gallery-Tall-Large_1.jpg?fit=crop&format=jpg&quality=80&width=1600&height=700&dpr=1',
          img2:
              'https://www.lego.com/cdn/cs/set/assets/blt97ce568619b350f3/Gallery-Tall-Large_2.jpg?fit=crop&format=jpg&quality=80&width=1600&height=700&dpr=1',
          img3:
              'https://www.lego.com/cdn/cs/set/assets/bltf955a442852287f1/Gallery-Tall-Large_3.jpg?fit=crop&format=jpg&quality=80&width=1600&height=700&dpr=1',
        ),
        CategoryCard(
          containerColor: Color(0xFF08306C),
          imgURL:
              "https://www.lego.com/cdn/cs/set/assets/blt6e619e8cff57a8d3/Marvel_-_SpidersMan_-_Hydo_Man_-_Sidekick-Tall.jpg?fit=crop&format=jpg&quality=80&width=800&height=600&dpr=1",
          title: translator.translate('HydroTitle'),
          description: translator.translate('HydroDescription'),
          showBtn: true,
        ),
        StaticCarousel(
          img1:
              'https://www.lego.com/cdn/cs/set/assets/bltcecd1bd9c25fea64/Marvel_-_SpidersMan_-_Hydro_Man_-_Gallery-Tall-Large_1.jpg?fit=crop&format=jpg&quality=80&width=1600&height=700&dpr=1',
          img2:
              'https://www.lego.com/cdn/cs/set/assets/bltd7c75a7957a20e89/Marvel_-_SpidersMan_-_Hydro_Man_-_Gallery-Tall-Large_2.jpg?fit=crop&format=jpg&quality=80&width=1600&height=700&dpr=1',
          img3:
              'https://www.lego.com/cdn/cs/set/assets/blt89605212b0aebdcc/Marvel_-_SpidersMan_-_Hydro_Man_-_Gallery-Tall-Large_3.jpg?fit=crop&format=jpg&quality=80&width=1600&height=700&dpr=1',
        ),
        CategoryCard(
          containerColor: Color(0xFF023823),
          imgURL:
              "https://www.lego.com/cdn/cs/set/assets/blt9d8345703e38a2f7/Marvel_-_SpidersMan_-_Stark_Jet_-_Sidekick-Tall.jpg?fit=crop&amp;format=jpg&amp;quality=80&amp;width=800&amp;height=600&amp;dpr=1",
          title: translator.translate('StarkTitle'),
          description: translator.translate('StarkDescription'),
          showBtn: true,
        ),
        StaticCarousel(
          img1:
              'https://www.lego.com/cdn/cs/set/assets/blt4ef19294cb314a3a/Marvel_-_SpidersMan_-_Stark_Jet_-_Gallery-Tall-Large_1.jpg?fit=crop&format=jpg&quality=80&width=1600&height=700&dpr=1',
          img2:
              'https://www.lego.com/cdn/cs/set/assets/bltd57a99e7b3f50633/Marvel_-_SpidersMan_-_Stark_Jet_-_Gallery-Tall-Large_2.jpg?fit=crop&format=jpg&quality=80&width=1600&height=700&dpr=1',
          img3:
              'https://www.lego.com/cdn/cs/set/assets/blted965ac2b961972a/Marvel_-_SpidersMan_-_Stark_Jet_-_Gallery-Tall-Large_3.jpg?fit=crop&format=jpg&quality=80&width=1600&height=700&dpr=1',
        ),
        Container(
          color: Color(0xFF1C2023),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    translator.translate('Questions'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    translator.translate('FindUs'),
                    style: TextStyle(
                      height: 2,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          translator.translate('GoToFAQ'),
                        ),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
