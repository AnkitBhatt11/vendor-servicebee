class City{
  int? id,state_id;
  String? city;

  City(this.id, this.state_id, this.city);

  factory City.fromJson(json){
    return City(
      json["id"],
      json["state_id"],
      json["city"],
    );
  }

}