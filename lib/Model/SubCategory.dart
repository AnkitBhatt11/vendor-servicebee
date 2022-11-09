

class sub_category{
  int _id,_category_id;
  String _sc_name,_sc_description,_sc_image;

  sub_category(this._id, this._category_id, this._sc_name, this._sc_description,
      this._sc_image);

  factory sub_category.fromJson(json){
    return sub_category(
      json["id"],
      json["category_id"],
      json["sc_name"],
      json["sc_description"],
      json["sc_image"],
    );
  }

  get sc_image => _sc_image;

  get sc_description => _sc_description;

  String get sc_name => _sc_name;

  get category_id => _category_id;

  int get id => _id;
}