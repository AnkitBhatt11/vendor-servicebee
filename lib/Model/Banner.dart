
class banner{
  String _url;
  String _link ; 

  banner(this._url , this._link);

  factory banner.fromJson(json){
    return banner(
      json["url/text"],
        json["url"]
    );
  }

  String get url => _url;
    String get link => _link;
}