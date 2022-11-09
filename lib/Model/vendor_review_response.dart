

import 'package:wellcare/Model/vendor_review.dart';

class VendorReviewResponse{
  bool? status;
  String? message;
  List<VendorReview>? reviews;

  VendorReviewResponse.fromJson(json) {
    status = json['status'] ?? false;
    message = json['message'] ?? "";
    reviews = json['data'] == null
        ? []
        : (json['data'] as List).map((e) => VendorReview.fromJson(e)).toList();
  }
  VendorReviewResponse.withError(msg){
    status = false;
    message = msg??"Something went wrong";
  }
}