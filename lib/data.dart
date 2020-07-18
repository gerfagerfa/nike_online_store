import 'package:flutter/material.dart';

enum Category {
  Lifestyle, Jordan, Running, Basketball, Football, Soccer, Training, Skateboarding, Baseball, Golf, Tennis, Walking
}

class Shoe {

  String name;
  String family;
  Category category;
  double price;
  double discount;
  List<String> images;
  Color backgroundColor;

  Shoe(this.name, this.family, this.category, this.price, this.discount, this.images, this.backgroundColor);

}

List<Shoe> getShoeList(){
  return <Shoe>[
    Shoe(
      "Jordan Max 200",
      "Jordan", 
      Category.Jordan,
      157.50,
      31,
      [
        "assets/images/jordan_max_200_0.png",
        "assets/images/jordan_max_200_1.png",
        "assets/images/jordan_max_200_2.png",
      ],
      Color(0xFFFFF7BD),
    ),
    Shoe(
      "Aix Max 720",
      "Air", 
      Category.Lifestyle,
      125.00,
      0,
      [
        "assets/images/air_max_720_0.png",
        "assets/images/air_max_720_1.png",
      ],
      Color(0xFFD8F5F6),
    ),
    Shoe(
      "Air Max 270 React",
      "Air", 
      Category.Lifestyle,
      125.00,
      0,
      [
        "assets/images/air_max_270_react_0.png",
        "assets/images/air_max_270_react_1.png",
        "assets/images/air_max_270_react_2.png",
      ],
      Color(0xFFDFE6E8),
    ),
    Shoe(
      "Air Force 1 React",
      "Air", 
      Category.Lifestyle,
      157.50,
      25,
      [
        "assets/images/air_force_1_react_0.png",
        "assets/images/air_force_1_react_1.png",
      ],
      Color(0xFFFFF7BD),
    ),
    Shoe(
      "React Element 55",
      "React", 
      Category.Training,
      125.00,
      0,
      [
        "assets/images/react_element_55_0.png",
        "assets/images/react_element_55_1.png",
        "assets/images/react_element_55_2.png",
      ],
      Color(0xFFD8F5F6),
    ),
    Shoe(
      "React Presto T4",
      "React", 
      Category.Walking,
      125.00,
      10,
      [
        "assets/images/react_presto_t4_0.png",
        "assets/images/react_presto_t4_1.png",
        "assets/images/react_presto_t4_2.png",
      ],
      Color(0xFFDFE6E8),
    ),
  ];
}

class Filter {

  String name;

  Filter(this.name);

}

List<Filter> getFilterList(){
  return <Filter>[
    Filter("All (1202)"),
    Filter("Lifestyle (202)"),
    Filter("Jordan (19)"),
    Filter("Running (42)"),
    Filter("Basketball (58)"),
    Filter("Football (35)"),
    Filter("Soccer (45)"),
    Filter("Training (156)"),
    Filter("Scateboarding (88)"),
    Filter("Baseball (34)"),
    Filter("Golf (12)"),
    Filter("Tennis (69)"),
    Filter("Walking (78)"),
  ];
}