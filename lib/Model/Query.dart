class query {
  int _id, _user_id, _lead_requets_count;
  var _status,
      _service_type,
      _receiver_phone,
      _address,
      _additional_note,
      _pinCity,
      _user_name,
      _user_photo,
      _date,
      _pin,
      _city2;

  query(
      this._id,
      this._user_id,
      this._status,
      this._service_type,
      this._receiver_phone,
      this._address,
      this._additional_note,
      this._pinCity,
      this._user_name,
      this._user_photo,
      this._date,
      this._pin,
      this._city2,
      this._lead_requets_count);

  factory query.fromJson(json) {
    return query(
      json["query_id"],
      json["user_id"],
      json["status"],
      json["service_type"],
      json["receiver_phone"],
      json["address"],
      json["additional_note"],
      json["pincode_/_citytocity"],
      json["user_name"],
      json["user_photo"],
      json["date"],
      json["pin"] ?? "",
      json["city2"] ?? "",
      json["lead_requets_count"] ?? 0,
    );
  }

  get user_photo => _user_photo;

  get user_name => _user_name;

  get pincode => _pinCity;

  get additional_note => _additional_note;

  get address => _address;

  get date => _date;

  get pinCity => _pinCity;

  get receiver_phone => _receiver_phone;

  get service_type => _service_type;

  get status => _status;

  get user_id => _user_id;

  get id => _id;

  get pin => _pin;

  get city2 => _city2;

  get lead_requets_count => _lead_requets_count;
}
