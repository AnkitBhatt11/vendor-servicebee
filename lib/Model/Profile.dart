
class profile{
  var _name,_city,_pincode,_phone,_address,_email;

  profile(this._name, this._city, this._pincode, this._phone,this._address,this._email);

  factory profile.fromJson(json){
    return profile(
      json["name"],
      json["city"],
      json["pincode"],
      json["phone"],
      json["address"],
      json["email"],
    );
  }

  get phone => _phone;

  get address => _address;

  get email => _email;

  get pincode => _pincode;

  get city => _city;

  get name => _name;
}