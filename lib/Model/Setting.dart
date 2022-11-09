
import 'package:flutter/material.dart';

class setting{

  String _name,_desc;
  IconData _image;
  Function _onTap;

  setting(this._name, this._desc, this._image, this._onTap);

  Function get onTap => _onTap;

  IconData get image => _image;

  get desc => _desc;

  String get name => _name;
}