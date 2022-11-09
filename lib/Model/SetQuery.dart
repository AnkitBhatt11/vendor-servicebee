
class set_query{
  var _service_id,_name,_phno,_pin_city,_city2,_address,_note;

  set_query(this._service_id, this._name, this._phno, this._pin_city,
      this._address, this._note,this._city2);

  get note => _note;

  get address => _address;

  get pin_city => _pin_city;

  get phno => _phno;

  get city2 => _city2;

  get name => _name;

  get service_id => _service_id;
}