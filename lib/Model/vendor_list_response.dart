import 'vendor.dart';

class VendorListResponse {
  bool? status;
  String? message;
  List<Vendor>? vendors;

  VendorListResponse.fromJson(json) {
    status = json['status'] ?? false;
    message = json['message'] ?? "Something Went Wrong";
    vendors = json['data'] == null
        ? []
        : (json['data'] as List).map((e) => Vendor.fromJson(e)).toList();
  }

  VendorListResponse.withError(msg) {
    status = false;
    message = msg ?? "Something went wrong";
  }
}
