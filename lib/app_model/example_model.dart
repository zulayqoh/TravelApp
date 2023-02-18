// json to dart formatter   https://javiercbk.github.io/json_to_dart/

import 'dart:convert';
import 'package:travel_app_sample/helpers/data_parser.dart';

// list.map((e) => ExampleModel.fromJson(e)).toList();
List<ExampleModel> welcomeFromJson(List<dynamic> data) =>
    List<ExampleModel>.from(data.map((x) => ExampleModel.fromJson(x)));

String welcomeToJson(List<ExampleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExampleModel {
  ExampleModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.people,
    required this.selectedPeople,
    required this.img,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String description;
  int price;
  int stars;
  int people;
  int selectedPeople;
  String img;
  String location;
  DateTime createdAt;
  DateTime updatedAt;

  /// Convert from JSON response stream to ExampleModel object

  factory ExampleModel.fromJson(Map<String, dynamic> json) => ExampleModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        people: json["people"],
        selectedPeople: json["selected_people"],
        img: json["img"],
        location: json["location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

// OR

//   ExampleModel.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     name = json["name"];
//     description = json["description"];
//     price = json["price"];
//     stars = json["stars"];
//     people = json["people"];
//     selectedPeople = json["selected_people"];
//     img = json["img"];
//     location = json["location"];
//     createdAt = DateTime.parse(json["created_at"]);
//     updatedAt = DateTime.parse(json["updated_at"]);
//   }

  // OR

  // ExampleModel.fromJson(Map<String, dynamic> json)
  //     : id = DataParser.parse(ParserType.Number, json["id"]),
  //       name = DataParser.parse(ParserType.String, json["name"]),
  //       description = DataParser.parse(ParserType.String, json["description"]),
  //       price = DataParser.parse(ParserType.Number, json["price"]),
  //       stars = DataParser.parse(ParserType.Number, json["stars"]),
  //       people = DataParser.parse(ParserType.Number, json["people"]),
  //       selectedPeople = DataParser.parse(ParserType.Number, json["selected_people"]),
  //       img = DataParser.parse(ParserType.String, json["img"]),
  //       location = DataParser.parse(ParserType.String, json["location"]),
  //       createdAt = DataParser.parse(ParserType.Date, json["created_at"]),
  //       updatedAt = DataParser.parse(ParserType.Date, json["updated_at"]);

  /// Convert an in-memory representation of a ExampleModel object to a Map<String, dynamic>
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stars": stars,
        "people": people,
        "selected_people": selectedPeople,
        "img": img,
        "location": location,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
