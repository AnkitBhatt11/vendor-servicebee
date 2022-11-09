
class LastQuery{
  int? id,user_id,status,service_id;
  String? query_code,pin,name,phno,pin_city,address,note,quoted_by_vendor,quot_price,purchased_by_vendor;

  LastQuery(
      this.id,
      this.user_id,
      this.status,
      this.service_id,
      this.query_code,
      this.pin,
      this.name,
      this.phno,
      this.pin_city,
      this.address,
      this.note,
      this.quoted_by_vendor,
      this.quot_price,
      this.purchased_by_vendor);


  factory LastQuery.fromJson(json){
    return LastQuery(
      json["id"]??0,
      json["user_id"]??0,
      json["status"]??0,
      json["service_id"]??0,
      json["query_code"]??"",
      json["pin"]??"",
      json["name"]??"",
      json["phno"]??"",
      json["pin_city"]??"",
      json["address"]??"",
      json["note"]??"",
      json["quoted_by_vendor"]??"",
      json["quot_price"].toString()??"",
      json["purchased_by_vendor"]??"",
    );
  }

}