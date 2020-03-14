class WishesModel {
  String name;
  String image;
  String relation;
  String text;
  bool isSelected;
  
  WishesModel({
    this.name,
    this.image,
    this.relation,
    this.text,
    this.isSelected,
  });

  WishesModel.fromJson(Map<String, dynamic> map) {
    this.name = map['name'];
    this.image = map['image'];
    this.relation = map['relation'];
    this.text = map['text'];
    this.isSelected = map['isSelected'];
  }
}
