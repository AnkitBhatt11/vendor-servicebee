import 'Category.dart';
import 'SubCategory.dart';
import 'Sub_To_Sub_Category.dart';

class search_result {
  int _id;
  category? _categ;
  sub_category? _sub_categ;
  sub_to_sub_category? _sub_to_sub_categ;

  search_result(this._id, this._categ, this._sub_categ, this._sub_to_sub_categ);

  factory search_result.fromJson(json) {
    print(json);
    if (json['category_name'] != null) {
      return search_result(
        0,
        category.fromJson(json),
        null,
        null,
      );
    } else if (json["sc_name"] != null) {

      return search_result(
        1,
        null,
        sub_category.fromJson(json),
        null,
      );
    } else {
      // print(json["sc_name"]);
      return search_result(
       2,
        null,
        null,
        sub_to_sub_category.fromJson(json),
      );
    }
  }

  sub_to_sub_category? get sub_to_sub_categ => _sub_to_sub_categ;

  sub_category? get sub_categ => _sub_categ;

  category? get categ => _categ;

  int get id => _id;
}
