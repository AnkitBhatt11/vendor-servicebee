
class VendorReview{
  int? id,query_id,user_id,vendor_id;
  double? rating;
  String? review,name,phone,email,address;

  VendorReview.fromJson(json){
    id = json['id']??0;
    query_id = json['query_id']??0;
    user_id = json['user_id']??0;
    vendor_id = json['vendor_id']??0;
    rating = double.parse(json['rating'].toString()) ?? 0;
    review = json['review']??"";
    name= json['name']??"";
    phone= json['phone']??"";
    email= json['email']??"";
    address= json['address']??"";
  }

}