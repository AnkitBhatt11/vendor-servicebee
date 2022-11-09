
class sub_to_sub_category{
  int _id,_c_id,_sc_id;
  String _ssc_name,_ssc_description,_ssc_image;
  bool _is_citytocity,_is_pincode,_is_within_city;

  sub_to_sub_category(this._id, this._c_id, this._sc_id, this._ssc_name,
      this._ssc_description, this._ssc_image,this._is_citytocity,this._is_pincode,this._is_within_city);


  factory sub_to_sub_category.fromJson(json){
    return sub_to_sub_category(
      json["id"],
      json["c_id"],
      json["sc_id"],
      json["ssc_name"],
      json["ssc_description"],
      json["ssc_image"],
      (json["is_citytocity"]==0?false:true)??false,
      (json["is_pincode"]==0?false:true)??false,
      (json["is_within_city"]==0?false:true)??false,
    );
  }

  get ssc_image => _ssc_image;

  get ssc_description => _ssc_description;

  get is_pincode => _is_pincode;

  String get ssc_name => _ssc_name;

  get sc_id => _sc_id;

  get c_id => _c_id;


  bool get is_citytocity => _is_citytocity;

  int get id => _id;

  get is_within_city => _is_within_city;
}