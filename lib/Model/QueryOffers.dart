
class query_offers{
  String _name,_image,_amount;
  double _rating;

  query_offers(this._name, this._image, this._amount, this._rating);

  double get rating => _rating;

  get amount => _amount;

  get image => _image;

  String get name => _name;
}