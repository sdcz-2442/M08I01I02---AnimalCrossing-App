import 'package:animal_crossing_villagers/villagers_model.dart';
import 'package:flutter/material.dart';

class AddVillagerFormPage extends StatefulWidget {
  @override
  _AddVillagerFormPageState createState() => new _AddVillagerFormPageState();
}

class _AddVillagerFormPageState extends State<AddVillagerFormPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController imageurlController = new TextEditingController();

  void submitVillager(BuildContext context){
    if (nameController.text.isEmpty){
      Scaffold.of(context).showSnackBar(new SnackBar(
          backgroundColor: Colors.green,
          content: new Text('Add Villager name'),
      ));
    } else {
      var newVillager = new Villager(nameController.text, locationController.text,
          descriptionController.text, imageurlController.text);
      Navigator.of(context).pop(newVillager);
    }
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add a new villager'),
        backgroundColor: Colors.green,
      ),
      body: new Container(
        color: Colors.white,
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: new Column(
            children: [
              new Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new TextField(
                  controller: nameController,
                  onChanged: (v) => nameController.text = v,
                  decoration: new InputDecoration(
                    labelText: 'Name the villager'),
                  ),
                ),
              new Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new TextField(
                  controller: locationController,
                  onChanged: (v) => new InputDecoration(
                    labelText: "Villager Species"),
                  ),
                ),
        new Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: new TextField(
            controller: descriptionController,
            onChanged: (v) => descriptionController.text = v,
            decoration: new InputDecoration(
              labelText: 'Villager description'),
            ),
          ),
        new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Builder(
            builder: (context) {
            return new RaisedButton(
              onPressed: () => submitVillager(context),
              color: Colors.green,
              child: new Text('Submit Villager',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
            },
          ),
        )
        ]),
              )
              )
          );
  }
}