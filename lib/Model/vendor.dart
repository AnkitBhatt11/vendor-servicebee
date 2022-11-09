class Vendor {
  // "vendor": {
  // "name": "Sukanya Saha",
  // "phone": "9173789524",
  // "address": "BA-17",
  // "email": "sidadjuned78692@gmail.com",
  // "profile_picture": "uploads/vendors/docs/19c73530c64ae05bc26770167ffdcc37e4c17db0.png"
  // },
  String? name, phone, address, email, profile_picture, vendor_id;
  double? rating;
  // int? offer_price;
  String? offer_price;

  Vendor.fromJson(json) {
    vendor_id = json['vendor_id'] ?? "";
    name = json['name'] ?? "";
    phone = json['phone'] ?? "";
    address = json['address'] ?? "";
    email = json['email'] ?? "";
    profile_picture = json['profile_picture'] ?? "";
    offer_price =
        json['offer_price'] == null ? '' : json['offer_price'].toString();
    rating =
        json['rating'] == null ? 0 : double.parse(json['rating'].toString());
  }
}
