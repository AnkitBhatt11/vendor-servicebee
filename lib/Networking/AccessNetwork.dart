import 'package:wellcare/Model/Profile.dart';
import 'package:wellcare/Model/SetQuery.dart';

import '../Model/generic_response.dart';
import '../Model/notification.dart';
import '../Model/query_list_response.dart';
import '../Model/review_response.dart';
import '../Model/vendor_list_response.dart';
import '../Model/vendor_review_response.dart';
import '../constance/constance.dart';
import 'NetworkHelper.dart';

class access_network {
  static var otp_url = ConstanceData.url + 'otp';
  static var otpverified_url = ConstanceData.url + 'otpverified';
  static var show_category_url = ConstanceData.url + 'show_category';
  static var show_subcategory_url = ConstanceData.url + 'show_subcategory';
  static var show_sub_to_subcategory_url =
      ConstanceData.url + 'show_sub_to_subcategory';
  static var update_pincity_url = ConstanceData.url + 'update_pincity';
  static var show_user_profile_url = ConstanceData.url + 'show_user_profile';
  static var update_user_profile_url =
      ConstanceData.url + 'update_user_profile';
  static var user_query_list_url = ConstanceData.url + 'user_query_list';
  static var user_verified_query_list_url =
      ConstanceData.url + 'user_verified_query_list';
  static var create_query_url = ConstanceData.url + 'create_query';
  static var banner_list_url = ConstanceData.url + 'banner_list';
  static var city_list_url = ConstanceData.url + 'get_all_cities';
  static var textbanner_list_url = ConstanceData.url + 'textbanner_list';
  static var match_keywords_url = ConstanceData.url + 'match_keywords';
  static var fetch_last_query_url = ConstanceData.url + 'fetch_last_query';
  static var add_review_url = ConstanceData.url + 'add_review';
  static var get_reviews_url = ConstanceData.url + 'get_review_vendor_by_id';
  static var notification_url = ConstanceData.url + 'notifications';

  static var fetch_vendor_list_url =
      ConstanceData.url + 'get_query_vendor_list';
  static var get_review_vendor_by_id_url =
      ConstanceData.url + 'get_review_vendor_by_id';
  static var readNotifications = ConstanceData.url + 'readNotification';
  Future<dynamic> send_otp(number, code) async {
    NetworkHelper helper = NetworkHelper(otp_url);
    var dataR = await helper.otp_send(number, code);
    return dataR;
  }

  Future<dynamic> verify_otp(phone, otp, fcmtoken) async {
    NetworkHelper helper = NetworkHelper(otpverified_url);
    var dataR = await helper.otp_verify(phone, otp, fcmtoken);
    return dataR;
  }

  Future<dynamic> get_category() async {
    NetworkHelper helper = NetworkHelper(show_category_url);
    var dataR = await helper.get_category();
    return dataR;
  }

  Future<dynamic> get_sub_category(category_id) async {
    NetworkHelper helper = NetworkHelper(show_subcategory_url);
    var dataR = await helper.get_sub_category(category_id);

    print(dataR);
    return dataR;
  }

  Future<dynamic> get_sub_to_sub_category(subcategory_id) async {
    NetworkHelper helper = NetworkHelper(show_sub_to_subcategory_url);
    var dataR = await helper.get_sub_to_sub_category(subcategory_id);
    return dataR;
  }

  Future<dynamic> update_pincity(pincode, city) async {
    NetworkHelper helper = NetworkHelper(update_pincity_url);
    var dataR = await helper.update_pincity(pincode, city);
    return dataR;
  }

  Future<GenericResponse> addReview(query_id, review, rating) async {
    NetworkHelper helper = NetworkHelper(add_review_url);
    var dataR = await helper.addReview(query_id, review, rating);
    return dataR;
  }

  Future<dynamic> show_user_profile() async {
    NetworkHelper helper = NetworkHelper(show_user_profile_url);
    var dataR = await helper.show_user_profile();
    ConstanceData.setProfile(profile.fromJson(dataR));
    return profile.fromJson(dataR);
  }

  Future<dynamic> update_user_profile(name, email, address) async {
    NetworkHelper helper = NetworkHelper(update_user_profile_url);
    var dataR = await helper.update_user_profile(name, email, address);
    return dataR;
  }

  Future<QueryListResponse> user_query_list() async {
    NetworkHelper helper = NetworkHelper(user_query_list_url);
    QueryListResponse dataR = await helper.user_query_list();
    return dataR;
  }

  Future<QueryListResponse> user_verified_query_list() async {
    NetworkHelper helper = NetworkHelper(user_verified_query_list_url);
    QueryListResponse dataR = await helper.user_verified_query_list();
    return dataR;
  }

  Future<dynamic> create_query(set_query querry) async {
    NetworkHelper helper = NetworkHelper(create_query_url);
    var dataR = await helper.create_query(querry);
    return dataR;
  }

  Future<NotificationResponse> getNotifications(int page) async {
    NetworkHelper helper = NetworkHelper(notification_url);
    NotificationResponse dataR = await helper.getNotifications(page);
    return dataR;
  }
    Future <dynamic>readNotification() async {
    NetworkHelper helper = NetworkHelper(readNotifications);
    var dataR = await helper.badge_notification();
    return dataR;
  }
  Future<dynamic> banner_list() async {
    NetworkHelper helper = NetworkHelper(banner_list_url);
    var dataR = await helper.banner_list();
    return dataR;
  }

  Future<dynamic> city_list() async {
    NetworkHelper helper = NetworkHelper(city_list_url);
    var dataR = await helper.city_list();
    return dataR;
  }

  Future<ReviewResponse> getReviews() async {
    NetworkHelper helper = NetworkHelper(get_reviews_url);
    var dataR = await helper.getReviews();
    return dataR;
  }

  Future<VendorReviewResponse> getVendorReviews(id) async {
    NetworkHelper helper = NetworkHelper(get_reviews_url);
    var dataR = await helper.getVendorReviews(id);
    return dataR;
  }

  Future<dynamic> textbanner_list() async {
    NetworkHelper helper = NetworkHelper(textbanner_list_url);
    var dataR = await helper.textbanner_list();
    return dataR;
  }

  Future<dynamic> match_keywords(term) async {
    NetworkHelper helper = NetworkHelper(match_keywords_url);
    var dataR = await helper.match_keywords(term);
    return dataR;
  }

  Future<dynamic> last_query() async {
    NetworkHelper helper = NetworkHelper(fetch_last_query_url);
    var dataR = await helper.last_query();
    return dataR;
  }

  Future<VendorListResponse> getVendorList(query_id) async {
    NetworkHelper helper = NetworkHelper(fetch_vendor_list_url);
    var dataR = await helper.getVendorList(query_id);
    return dataR;
  }
}
