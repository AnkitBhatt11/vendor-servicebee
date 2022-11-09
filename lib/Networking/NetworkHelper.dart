import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wellcare/Model/Query.dart';
import 'package:wellcare/Model/SetQuery.dart';
import 'package:http/http.dart' as http;
import '../Model/Banner.dart';
import '../Model/Category.dart';
import '../Model/SubCategory.dart';
import '../Model/Sub_To_Sub_Category.dart';
import '../Model/TextBanner.dart';
import '../Model/city.dart';
import '../Model/generic_response.dart';
import '../Model/last_query.dart';
import '../Model/notification.dart';
import '../Model/query_list_response.dart';
import '../Model/review_response.dart';
import '../Model/search_result.dart';
import '../Model/vendor_list_response.dart';
import '../Model/vendor_response.dart';
import '../Model/vendor_review_response.dart';
import '../constance/constance.dart';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  late Dio dio;
  BaseOptions option =
      BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  });

  Future otp_send(number, code) async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
    });
    dio = Dio(option);

    try {
      Response response = await dio.post(url, data: {
        'number': number,
        'vcode': code,
      });
      print(url);
      print({
        'number': number,
        'code': code,
      });
      if (response.statusCode == 200) {
        print(response.data);
        return response.data['message'];
      } else {
        return 'Failed';
      }
    } on DioError catch (e) {
      print('${e.message} ${{
        'number': number,
      }}');
    }
  }

  Future otp_verify(phone, otp, fcmtoken) async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
    });
    dio = Dio(option);
    print(url);
    print('${{'phone': phone, 'otp': otp, 'fcm_token': fcmtoken}}');
    try {
      Response response = await dio
          .post(url, data: {'phone': phone, 'otp': otp, 'fcm_token': fcmtoken});
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        if (response.data['token'] != null) {
          ConstanceData.setAccessToken(response.data['token']);
        } else {
          Fluttertoast.showToast(msg: response.data['message']);
        }
        return response.data['message'];
      } else {
        print(response.data);
        return 'Failed';
      }
    } on DioError catch (e) {
      print('${e.response}');
    }
  }

  Future get_category() async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);
    print(url);
    try {
      Response response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        var data = response.data['data'] as List;

        List<category> list = data.map((e) => category.fromJson(e)).toList();

        return list;
      } else {
        List<category> list = new List.empty();
        return list;
      }
    } on DioError catch (e) {
      print('${e.message}');
      List<category> list = new List.empty();
      return list;
    }
  }

  Future get_sub_category(category_id) async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);
    print(url);
    print({'category_id': category_id});
    try {
      Response response = await dio.post(
        url,
        data: {'category_id': category_id},
      );
      if (response.statusCode == 200) {
        print(response.data);
        var data = response.data['data'] as List;

        List<sub_category> list =
            data.map((e) => sub_category.fromJson(e)).toList();

        return list;
      } else {
        List<sub_category> list = new List.empty();
        return list;
      }
    } on DioError catch (e) {
      print('${e.message}');
      List<sub_category> list = new List.empty();
      return list;
    }
  }

  Future get_sub_to_sub_category(subcategory_id) async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);
    print(url);
    print('${ConstanceData.access_token}');
    print({'subcategory_id': subcategory_id});
    try {
      Response response = await dio.post(
        url,
        data: {'subcategory_id': subcategory_id},
      );
      if (response.statusCode == 200) {
        print(response.data);
        var data = response.data['data'] as List;

        List<sub_to_sub_category> list =
            data.map((e) => sub_to_sub_category.fromJson(e)).toList();

        return list;
      } else {
        List<sub_to_sub_category> list = new List.empty();
        return list;
      }
    } on DioError catch (e) {
      print('${e.message}');
      List<sub_to_sub_category> list = new List.empty();
      return list;
    }
  }

  Future update_pincity(pincode, city) async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);

    try {
      Response response = await dio.post(url, data: {
        'pincode': pincode,
        'city': city,
      });
      if (response.statusCode == 200) {
        print(response.data['message']);
        return response.data['message'];
      } else {
        print('Failed');
        return 'Failed';
      }
    } on DioError catch (e) {
      print('${e.message} ${{
        'pincode': pincode,
        'city': city,
      }}  ${ConstanceData.access_token}');
      return '${e.message}';
    }
  }

  Future show_user_profile() async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': 'Bearer ${ConstanceData.access_token}',
    });
    dio = Dio(option);
    print(url);
    print('Bearer ${ConstanceData.access_token}');
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        print('user ${response.data}');
        return response.data['data'];
      } else {
        print('Failed');
        return 'Failed';
      }
    } on DioError catch (e) {
      return '${e.response}';
    }
  }

  Future<GenericResponse> addReview(query_id, review, rating) async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': 'Bearer ${ConstanceData.access_token}',
    });
    var data = {
      'query_id': query_id,
      'review': review,
      'rating': rating,
    };
    dio = Dio(option);
    print(url);
    print(data);
    print('Bearer ${ConstanceData.access_token}');
    try {
      Response response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        print('review ${response.data}');
        return GenericResponse.fromJson(response.data);
      } else {
        print('Failed');
        return GenericResponse.withError("Something went wrong");
      }
    } on DioError catch (e) {
      print(e.response);
      return GenericResponse.withError('${e.response}');
    }
  }

  Future update_user_profile(name, email, address) async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);
    var data = {
      'name': name,
      'email': email,
      'address': address,
    };
    print(url);
    print(data);
    try {
      Response response = await dio.post(url, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('update profile ${response.data}');
        Fluttertoast.showToast(
            msg: "${response.data['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        return response.data['message'];
      } else {
        print('update profile Failed ${response.data}');
        return 'Failed';
      }
    } on DioError catch (e) {
      print(e.response);
      return '${e.message}';
    }
  }

  Future<QueryListResponse> user_query_list() async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);

    try {
      Response response = await dio.get(
        url,
      );
      print(url);
      print(response.data);
      if (response.statusCode == 200) {
        return QueryListResponse.fromJson(response.data);
      } else {
        return QueryListResponse.withError();
      }
    } on DioError catch (e) {
      return QueryListResponse.withError();
    }
  }

  Future<QueryListResponse> user_verified_query_list() async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);

    try {
      Response response = await dio.get(
        url,
      );
      print(url);
      print(response.data);
      if (response.statusCode == 200) {
        var data = response.data['data'] as List;

        return QueryListResponse.fromJson(response.data);
      } else {
        return QueryListResponse.withError();
      }
    } on DioError catch (e) {
      return QueryListResponse.withError();
    }
  }

  Future<NotificationResponse> getNotifications(int page) async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);
    print(url);
    var data = {'page': page};
    print(data);
    try {
      Response response = await dio.get(
        url,
        queryParameters: data,
      );

      print(response.data);
      if (response.statusCode == 200) {
        var data = response.data['data'] as List;

        return NotificationResponse.fromJson(response.data);
      } else {
        return NotificationResponse.withError("Something went wrong");
      }
    } on DioError catch (e) {
      print(e.response);
      return NotificationResponse.withError(e.message);
    }
  }

  Future create_query(set_query querry) async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);
    print(url);
    print({
      'service_id': querry.service_id,
      'name': querry.name,
      'phno': querry.phno,
      'pin_city': querry.pin_city,
      'city2': querry.city2 == '' ? null : querry.city2,
      'address': querry.address,
      'note': querry.note,
    });
    try {
      Response response = await dio.post(url, data: {
        'service_id': querry.service_id,
        'name': querry.name,
        'phno': querry.phno,
        'pin_city': querry.pin_city,
        'city2': querry.city2 == '' ? null : querry.city2,
        'address': querry.address,
        'note': querry.note,
      });
      if (response.statusCode == 200) {
        print(response.data);
        Fluttertoast.showToast(
            msg: "${response.data['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        return response.data['message'];
      } else {
        print('Failed');
        return 'Failed';
      }
    } on DioError catch (e) {
      return '${e.message}';
    }
  }

  Future banner_list() async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);

    try {
      Response response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        var data = response.data['result'] as List;

        List<banner> list = data.map((e) => banner.fromJson(e)).toList();

        return list;
      } else {
        List<banner> list = new List.empty();
        return list;
      }
    } on DioError catch (e) {
      print('${e.message}');
      List<banner> list = new List.empty();
      return list;
    }
  }

  Future city_list() async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);

    try {
      Response response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        var data = response.data['data'] as List;

        List<City> list = data.map((e) => City.fromJson(e)).toList();

        return list;
      } else {
        List<City> list = new List.empty();
        return list;
      }
    } on DioError catch (e) {
      print('${e.message}');
      List<City> list = new List.empty();
      return list;
    }
  }

  Future<ReviewResponse> getReviews() async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);
    print(url);
    try {
      Response response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        var data = response.data['data'] as List;

        List<City> list = data.map((e) => City.fromJson(e)).toList();

        return ReviewResponse.fromJson(response.data);
      } else {
        List<City> list = new List.empty();
        return ReviewResponse.withError("Something went wrong");
      }
    } on DioError catch (e) {
      print('${e.message}');
      List<City> list = new List.empty();
      return ReviewResponse.withError(e.message);
    }
  }

  Future<VendorReviewResponse> getVendorReviews(vendor_id) async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);
    print(url);
    var data = {
      'vendor_id': vendor_id,
    };
    print(data);
    Response response = await dio.get(
      url,
      queryParameters: data,
    );
    print(response);
    try {
      print(response);

      if (response.statusCode == 200) {
        var data = response.data['data'] as List;

        // List<City> list = data.map((e) => City.fromJson(e)).toList();

        return VendorReviewResponse.fromJson(response.data);
      } else {
        // List<City> list = new List.empty();
        return VendorReviewResponse.withError("Something went wrong");
      }
    } on DioError catch (e) {
      print('${e.message}');

      return VendorReviewResponse.withError(e.message);
    }
  }

  Future<VendorResponse> getVendor(vendor_id) async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);
    print(url);
    var data = {
      'vendor_id': vendor_id,
    };
    try {
      Response response = await dio.get(
        url,
        queryParameters: data,
      );
      if (response.statusCode == 200) {
        var data = response.data['data'] as List;

        // List<City> list = data.map((e) => City.fromJson(e)).toList();

        return VendorResponse.fromJson(response.data);
      } else {
        // List<City> list = new List.empty();
        return VendorResponse.withError("Something went wrong");
      }
    } on DioError catch (e) {
      print('${e.message}');

      return VendorResponse.withError(e.message);
    }
  }

  Future<VendorListResponse> getVendorList(query_id) async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);
    print(url);
    var data = {
      'query_id': query_id,
    };
    // print(data);
    try {
      Response response = await dio.get(
        url,
        queryParameters: data,
      );
      print(data);
      print(response.data);
      if (response.statusCode == 200) {
        var data = response.data['data'] as List;

        // List<City> list = data.map((e) => City.fromJson(e)).toList();

        return VendorListResponse.fromJson(response.data);
      } else {
        // List<City> list = new List.empty();
        return VendorListResponse.withError("Something went wrong");
      }
    } on DioError catch (e) {
      print('${e.message}');

      return VendorListResponse.withError(e.message);
    }
  }

  Future last_query() async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);
    try {
      Response response = await dio.get(
        url,
      );
      print(url);
      print(response.data);
      if (response.statusCode == 200) {
        var data = LastQuery.fromJson(response.data['data']);

        return data;
      } else {
        return LastQuery(0, 0, 0, 0, "", "", "", "", "", "", "", "", "", "");
      }
    } on DioError catch (e) {
      print('${e.message}');
      return LastQuery(0, 0, 0, 0, "", "", "", "", "", "", "", "", "", "");
    }
  }

  Future match_keywords(term) async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);
    print(url);
    print(term);
    try {
      Response response = await dio.post(url, data: {
        'term': term,
      });
      if (response.statusCode == 200) {
        print('opop${response.data}');
        if (response.data != '') {
          var data = response.data['result'] as List;

          List<search_result> list =
              data.map((e) => search_result.fromJson(e)).toList();

          return list;
        } else {
          List<search_result> list = [];
          return list;
        }
      } else {
        List<search_result> list = new List.empty();
        return list;
      }
    } on DioError catch (e) {
      print('${e.message}');
      List<search_result> list = new List.empty();
      return list;
    }
  }

  Future textbanner_list() async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);

    try {
      Response response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        var data = response.data['result'] as List;

        List<text_banner> list =
            data.map((e) => text_banner.fromJson(e)).toList();

        return list;
      } else {
        List<text_banner> list = new List.empty();
        return list;
      }
    } on DioError catch (e) {
      print('${e.message}');
      List<text_banner> list = new List.empty();
      return list;
    }
  }

  Future<GenericResponse> sendHelpSupport(name, email, phone, message) async {
    String baseUrl = "growgraphics.xyz";
    String path = "/service-bee/public/api";
    var data = {
      "name": name,
      "email": email,
      "phone": phone,
      "message": message
    };
    var url = Uri.https(baseUrl, "$path/vendor/help_support");
    print(url);
    print(data);
    try {
      http.Response response =
          await http.post(url, body: jsonEncode(data), headers: {
        "APP-KEY": "jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE",
        "Content-Type": "application/json",
        'Authorization': '${ConstanceData.access_token}',
      });
      print("sendQuote response: ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GenericResponse.fromJson(jsonDecode(response.body));
      } else {
        final res = GenericResponse.fromJson(jsonDecode(response.body));
        return GenericResponse.withError(res.message ?? "Something went wrong");
      }
    } catch (error) {
      return GenericResponse.withError(error.toString());
    }
  }

  Future badge_notification() async {
    BaseOptions option =
        BaseOptions(connectTimeout: 25000, receiveTimeout: 10000, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'APP-KEY': 'jXIIci1Uxirg7MU33cu9qu1PL4kgUIi74Q7yGiFE',
      'Authorization': '${ConstanceData.access_token}',
    });
    dio = Dio(option);
    //  var url = Uri.https(baseUrl, "$path/vendor/help_support");
    print(url);
    //print(term);
    try {
      Response response = await dio.post(url);
      if (response.statusCode == 200) {
        print('success');
        print(response.data);
        // var data = response.data['result'] as List;

        // List<search_result> list =
        //     data.map((e) => search_result.fromJson(e)).toList();

        // return list;
      } else {
        print('error');
        print(response.data);
        // List<search_result> list = new List.empty();
        // return list;
      }
    } on DioError catch (e) {
      print('errorsss');
      print('${e}');
      // List<search_result> list = new List.empty();
      // return list;
    }
  }
}
