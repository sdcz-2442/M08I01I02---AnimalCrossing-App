import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Villager {
  final String name;
  final String location;
  final String description;
  //String imageUrl;
  String villagerUrl;
  
  int rating = 10;
  
  Villager(this.name, this.location, this.description, this.villagerUrl);
  
  Future getImageUrl() async {

    if(villagerUrl != null){
      return;
    }

    HttpClient http = new HttpClient();
    try {
      http.getUrl(Uri.parse(villagerUrl));
    } catch (exception) {
      print(exception);
    }
  }
}