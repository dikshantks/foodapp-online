class MenuItems {
  late String name;

  late double price;

  late String imgURl;

  MenuItems({
    required this.imgURl,
    required this.name,
    required this.price,
  });
}

List<MenuItems> sample = [
  MenuItems(
      imgURl: "assets/IndianStreetFood_20190103000803.jpg",
      name: 'eggroll',
      price: 30.0),
  MenuItems(
      imgURl: "assets/IndianStreetFood_20190103000803.jpg",
      name: 'veg roll',
      price: 30.0),
  MenuItems(
      imgURl: "assets/IndianStreetFood_20190103000803.jpg",
      name: 'pav bhaji ',
      price: 30.0),
  MenuItems(
      imgURl: "assets/IndianStreetFood_20190103000803.jpg",
      name: 'this thing special pav ',
      price: 30.0),
  MenuItems(
      imgURl: "assets/IndianStreetFood_20190103000803.jpg",
      name: 'wakka',
      price: 30.0),
];
