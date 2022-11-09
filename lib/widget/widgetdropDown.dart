// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomeDropDown extends StatefulWidget {
  final String? txt1;
  final List<String>? list;

  const CustomeDropDown({Key? key, this.txt1, this.list}) : super(key: key);
  @override
  _CustomeDropDownState createState() => _CustomeDropDownState();
}

class _CustomeDropDownState extends State<CustomeDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.txt1!,
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(letterSpacing: 0.1, fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.headline1!.color),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: (Theme.of(context).textTheme.headline1!.color)!),
          ),
          child: DropdownButtonFormField<String>(
            dropdownColor: Theme.of(context).appBarTheme.color,
            style: TextStyle(color: Theme.of(context).textTheme.headline1!.color),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                    color: Theme.of(context).textTheme.headline1!.color,
                    fontSize: 14,
                  ),
            ),
            items: widget.list!.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(letterSpacing: 0.1, fontSize: 15, color: Theme.of(context).textTheme.headline1!.color),
                ),
              );
            }).toList(),
            onChanged: (String? item) {},
            hint: Text(
              widget.list![0],
              style:
                  Theme.of(context).textTheme.caption!.copyWith(letterSpacing: 0.1, fontSize: 15, color: Theme.of(context).textTheme.headline1!.color),
            ),
          ),
        ),
      ],
    );
  }
}
