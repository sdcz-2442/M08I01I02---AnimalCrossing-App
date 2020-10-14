import 'package:flutter/material.dart';
import 'dart:async';
import 'villagers_model.dart';
import 'villagers_list.dart';
import 'new_villagers_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Crossing Villagers',
      theme: ThemeData(
      ),
      home: MyHomePage(title: 'Animal Crossing Villagers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Villager> initialVillagers = []
      ..add(Villager('Fauna','Deer',"The first step is always the hardest.",'https://acnhapi.com/v1/icons/villagers/101'))
      ..add(Villager('Erik','Deer',"If you're afraid of wolves, don't go to the woods.",'https://acnhapi.com/v1/icons/villagers/110'))
      ..add(Villager('Gayle','Alligator',"An ounce of prevention is worth a pound of cure.",'https://acnhapi.com/v1/icons/villagers/99'))
      ..add(Villager('Phoebe','Ostrich',"You can't keep a good bird down.",'https://acnhapi.com/v1/icons/villagers/279'))
      ..add(Villager('Coach','Bull',"Fool me once, shame on you. Fool me twice, shame on me.", 'https://acnhapi.com/v1/icons/villagers/40'))
      ..add(Villager('Dora','Mouse',"The squeaky wheel gets the cheese.",'https://acnhapi.com/v1/icons/villagers/252'))
      ..add(Villager('Elvis','Lion',"Better a live coward than a forgotten hero.",'https://acnhapi.com/v1/icons/villagers/238'))
      ..add(Villager('Freckles','Duck',"Act now before you change your mind!",'https://acnhapi.com/v1/icons/villagers/134'))
      ..add(Villager('Patty','Cow',"A friend in need is a friend indeed!",'https://acnhapi.com/v1/icons/villagers/90'))
      ..add(Villager('Jacques','Bird',"Better to have loved and squawked than to have never loved at all.",'https://acnhapi.com/v1/icons/villagers/33'))
  ;

  Future _showNewVillagerForm() async {
  Villager newVillager = await Navigator.of(context)
    .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddVillagerFormPage();
  }));
  if(newVillager != null){
    initialVillagers.add(newVillager);
  }
}

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: key,
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
        backgroundColor: Colors.green,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add,
            color: Colors.white),
            onPressed: _showNewVillagerForm,
          )
        ]
      ),
      body: new Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Center(
          child:  new VillagerList(initialVillagers),
    )),
    );
  }
}
