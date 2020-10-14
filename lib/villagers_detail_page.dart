import 'package:flutter/material.dart';
import 'villagers_card.dart';
import 'villagers_model.dart';
import 'dart:async';

class VillagerDetailPage extends StatefulWidget{
  final Villager villager;
  VillagerDetailPage(this.villager);

  @override
  _VillagerDetailPageState createState() => new _VillagerDetailPageState();
}

class _VillagerDetailPageState extends State<VillagerDetailPage>{
  final double villagerAvarterSize = 150.0;
  double _sliderValue = 10.0;

  Widget get addYourRating {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Flexible(
              flex: 1,
              child: new Slider(
                  activeColor: Colors.green,
                  min: 0.0,
                  max: 15.0,
                  value: _sliderValue,
                  onChanged: (newRating) {
                    setState(() {
                      _sliderValue = newRating;
                    });
                  },
              ),
            ),

            new Container(
              width: 50.0,
              alignment: Alignment.center,
              child: new Text('${_sliderValue.toInt()}',
              style: Theme.of(context).textTheme.display1),
              ),
          ]
        ),
        ),
    submitRatingButton,
      ],
    );
  }

  void updateRating() {
    if (_sliderValue < 10) {
      _ratingErrorDialog();
    } else {
      setState(() {
        widget.villager.rating = _sliderValue.toInt();
      });
    }
  }

  Future<Null> _ratingErrorDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Error'),
            content: new Text("They're good villagers :("),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Try Again'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  Widget get submitRatingButton {
    return new RaisedButton(
      onPressed: () => updateRating(),
      child: new Text('Submit'),
      color: Colors.green,
    );
  }

  Widget get villagerImage {
    return new Hero(
      tag: widget.villager,
      child: new Container(
        height: villagerAvarterSize,
        width: villagerAvarterSize,
        constraints: new BoxConstraints(),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                //fit: BoxFit.cover,
                image: new NetworkImage(widget.villager.villagerUrl ?? '')
            )
        ),
      ),
    );
  }

    Widget get rating {
      return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            Icons.star,
            color: Colors.green,
            size: 40.0,
          ),
          new Text(
            '${widget.villager.rating}/10',
            style: Theme.of(context).textTheme.display2,
          )
        ],
      );
    }

    Widget get villagerProfile {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 32.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          villagerImage,
          new Text(
            '${widget.villager.name}',
            style: TextStyle(fontSize: 32.0),
          ),
          new Text(
            widget.villager.location,
            style: TextStyle(fontSize: 20.0),
          ),
          new Padding(
            padding:
              const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: new Text(widget.villager.description),
          ),
          rating
        ],
      ),
    );
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text('Meet ${widget.villager.name}'),
      ),
      body: new ListView(
        children: <Widget>[villagerProfile, addYourRating],
      ),
    );
  }
}