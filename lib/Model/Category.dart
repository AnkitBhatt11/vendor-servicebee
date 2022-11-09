

class category{
  int _id;
  bool _is_citytocity;
  var _name,_description,_image;

  category(this._id, this._is_citytocity, this._name, this._description,
      this._image);

  factory category.fromJson(json){
    return category(
      json["id"],
      json["is_citytocity"]==0?false:true,
      json["name"]==null?json["category_name"]:json["name"],
      json["description"],
      json["image"],
    );
  }

  get image => _image;

  get description => _description;

  String get name => _name;

  bool get is_citytocity => _is_citytocity;

  int get id => _id;
}