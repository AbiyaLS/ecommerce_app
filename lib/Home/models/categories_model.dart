class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image
  });
}
  final List<Category> categories =[
    Category(
        title: "Shoes",
        image: "assets/categories/shoe.png"
    ),
    Category(
        title: "Jewellery",
        image: "assets/categories/jewellery.png"
    ),
    Category(
        title: "Mens Fashion",
        image: "assets/categories/mfashion.png"
    ),
    Category(
        title: "Women Fashion",
        image: "assets/categories/wfashion.png"
    ),
  ];
