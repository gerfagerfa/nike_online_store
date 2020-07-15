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
      "Proto Max 720",
      "Jordan", 
      Category.Jordan,
      157.50,
      31,
      [
        "assets/images/jordan_proto_max_720.png",
        "assets/images/jordan_proto_max_720.png",
      ],
      Color(0xFFFFF7BD),
    ),
    Shoe(
      "React Bauhaus",
      "Nike Air Max 270", 
      Category.Lifestyle,
      125.00,
      0,
      [
        "assets/images/jordan_proto_max_720.png",
        "assets/images/jordan_proto_max_720.png",
      ],
      Color(0xFFD8F5F6),
    ),
    Shoe(
      "qweqwe",
      "xzccasasde eqw", 
      Category.Jordan,
      125.00,
      0,
      [
        "assets/images/jordan_proto_max_720.png",
        "assets/images/jordan_proto_max_720.png",
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
    Filter("All"),
    Filter("Lifestyle"),
    Filter("Jordan"),
    Filter("Running"),
    Filter("Basketball"),
    Filter("Football"),
    Filter("Soccer"),
    Filter("Training"),
    Filter("Scateboarding"),
    Filter("Baseball"),
    Filter("Golf"),
    Filter("Tennis"),
    Filter("Walking"),
  ];
}