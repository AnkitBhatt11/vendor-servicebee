import 'package:wellcare/Model/vendor.dart';
import 'package:wellcare/Model/vendor_review.dart';

import 'review.dart';

class VendorResponse {
  bool? status;
  Vendor? vendor;
  List<VendorReview>? reviews;

  VendorResponse.fromJson(json) {
    status = json['status'] ?? false;
    vendor = Vendor.fromJson(json['data']['vendor']);
    reviews = json['data']['reviews'] == null
        ? []
        : (json['data']['reviews'] as List).map((e) => VendorReview.fromJson(e)).toList();
  }
  VendorResponse.withError(msg){
    status = false;
  }
}
