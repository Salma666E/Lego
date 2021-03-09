import 'package:LegoApp/features/themes/categoryAvatar.dart';
import 'package:LegoApp/features/themes/categoryCard.dart';
import 'package:LegoApp/features/themes/staticCarousel.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CategoryCard(
          containerColor: Color(0xFF00051B),
          imgURL:
              "https://www.lego.com/cdn/cs/set/assets/bltf7be226735a5d446/Marvel_-_SpidersMan_-_Intro_-_Sidekick-Standard.jpg?fit=crop&format=jpg&quality=80&width=800&height=426&dpr=1",
          title: 'LEGO® Marvel Spider-Man',
          description:
              'Our friendly neighborhood Spider-Man is going places! Can’t poor Peter Parker go on a nice, quiet school trip like a normal teen? More trouble for Spider-Man means more fun for you – with new friends and foes, new battles and locations, and new adventures and toy playsets to build, rebuild, roleplay and reimagine.',
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
              name: 'Spider-man',
            ),
            CategoryAvatar(
              imgURL:
                  'https://www.lego.com/cdn/cs/set/assets/bltb92ef962613e63b5/marvel-avengers-icon.jpg?fit=crop&format=jpg&quality=80&width=80&height=65&dpr=1',
              name: 'Avengers',
            ),
            CategoryAvatar(
              imgURL:
                  'https://www.lego.com/cdn/cs/set/assets/blt6e68f542cdc174f5/marvel-characters-icon.jpg?fit=crop&format=jpg&quality=80&width=80&height=65&dpr=1',
              name: 'Characters',
            ),
            CategoryAvatar(
              imgURL:
                  'https://www.lego.com/cdn/cs/set/assets/blt6fb7bec5706340a4/marvel-games-icon.jpg?fit=crop&format=jpg&quality=80&width=80&height=65&dpr=1',
              name: 'Games',
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
          title: '76128 – MOLTEN MAN BATTLE',
          description:
              'Rush to the heat of the action with this fully buildable action figure toy set. Includes a 6-beam rapid shooter, fun “melting” items to build, and 3 minifigures – Spider-Man, Mysterio and a firefighter – for roleplaying and collecting.',
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
          title: '76129 – HYDRO-MAN ATTACK',
          description:
              'Enjoy a gondola ride, a coffee-and-pizza date, and battling Hydro-Man as he blasts massive waves across the canal. Ah, Venice! Includes buildable bridge with explode function, a coffee machine, and 4 collectable Marvel Universe minifigures.',
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
          title: '76130 – STARK JET ATTACK',
          description:
              'Fly straight into the fight with this jet airplane playset equipped with beam shooters, adjustable wings, an opening hatch, heaps of movable elements, spider web string for Spider-Man to swing, and 4 Marvel Universe minifigures to play and collect.',
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
                    'Questions about the LEGO® Marvel sets?',
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
                    'How do you find the perfect LEGO® superhero toy? Have you lost your building instructions or a piece from a set? Our team of caped, masked heroes are standing by to help!',
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
                        Text('Go to FAQ Section'),
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
