import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class MyCardCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card();
  }
}

class Card extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: false,
      stream: slimyCard.stream, //Stream of SlimyCard
      builder: ((BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: 100),
            SlimyCard(
              topCardWidget: topCardWidget((snapshot.data)
                  ? 'assets/images/bfcm-gift-card-Quicklink.png'
                  : 'assets/images/lego.png'),
              bottomCardWidget: bottomCardWidget(),
            ),
          ],
        );
      }),
    );
  }

  // This widget will be passed as Top Card's Widget.
  Widget topCardWidget(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ListTile(
          trailing: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage(imagePath)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              translator.translate('About1'),
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget() {
    return Text(
      translator.translate('About2'),
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
