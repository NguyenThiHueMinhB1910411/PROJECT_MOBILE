import 'package:flutter/animation.dart';

class Category {
  final String image, title;
  final String type;
  Category({
    required this.image,
    required this.title,
    required this.type,
  });

  get price => null;
}

List<Category> show_categories = [
  Category(
    image: "assets/images/milk_tea_canva.png",
    title: "Trà sữa",
    type: "TraSua",
  ),
  Category(image: "assets/images/tra_canva.png", title: "Trà", type: "Tra"),
  Category(
    image: "assets/images/da_xay_canva.png",
    title: "Đá xay",
    type: "DaXay",
  ),
  Category(
    image: "assets/images/latte_canva.png",
    title: "Latte",
    type: "Latte",
  ),

  // ),
];
