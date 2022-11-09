
class vendor_rating{
  String _name,_note;
  double _rating;

  vendor_rating(this._name, this._note, this._rating);

  double get rating => _rating;

  get note => _note;

  String get name => _name;
}