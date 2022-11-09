class Review {
  int? id, query_id, user_id, vendor_id;
  String? review, name, email, phone, address;
  double? rating;

  Review.fromJson(json) {
    id = json['id'] ?? 0;
    query_id = json['query_id'] ?? 0;
    user_id = json['user_id'] ?? 0;
    vendor_id = json['vendor_id'] ?? 0;
    review = json['review'] ?? "";
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    address = json['address'] ?? "";
    rating = double.parse(json['rating'].toString()) ?? 0;
  }
}
