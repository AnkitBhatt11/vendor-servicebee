
class text_banner{
  String _txt;

  text_banner(this._txt);

  factory text_banner.fromJson(json){
    return text_banner(
      json["url/text"]
    );
  }

  String get txt => _txt;
}