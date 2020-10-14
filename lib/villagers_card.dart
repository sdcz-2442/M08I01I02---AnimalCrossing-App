import 'package:animal_crossing_villagers/new_villagers_form.dart';
import 'package:animal_crossing_villagers/villagers_model.dart';
import 'villagers_detail_page.dart';
import 'package:flutter/material.dart';

class VillagerCard extends StatefulWidget {
  final Villager villager;

  VillagerCard(this.villager);

  @override
  _VillagerCardState createState() => _VillagerCardState(villager);
}
  class _VillagerCardState extends State<VillagerCard> {
  Villager villager;
  String renderUrl;

  _VillagerCardState(this.villager);

  void initState() {
    super.initState();
    renderVillagerPic();
  }

  Widget get villagerImage {
    var villagerAvatar = new Hero(
      tag: villager,
      child: new Container(
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: new DecorationImage(
            fit: BoxFit.cover, image: new NetworkImage(renderUrl ?? '')
          )
        ),
      ),
    );

    var placeholder = new Container(
      width: 150.0,
      height: 150.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center
    );

    var crossFade = new AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: villagerAvatar,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: new Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  void renderVillagerPic() async {
    await villager.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = villager.villagerUrl;
      });
    }
  }

  Widget get villagerCard {
    return new Positioned(
      right: 0.0,
      child: new Container(
        width: 383,
        height: 115,
        child: new Card(
          color: Colors.white,
          child: new Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 120),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(
                  widget.villager.name,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 29.0,
                    fontFamily: 'Source Sans Pro'
                  ),
                  //style: Theme.of(context).textTheme.headline,
                ),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.star,
                    color: Colors.green),
                    new Text(': ${widget.villager.rating}/10')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showVillagerDetailPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return new VillagerDetailPage(villager);
    }));
  }

  @override
    Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => showVillagerDetailPage(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: new Container(
          height: 115.0,
          child: new Stack(
            children: <Widget>[
              villagerCard,
              new Positioned(top: 7.5, child: villagerImage),
            ],
          ),
        ),
      ),
    );
  }
}