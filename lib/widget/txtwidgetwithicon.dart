import 'package:flutter/material.dart';

class CustomeTextField2 extends StatefulWidget {
  final String? txt1, txt2;
  final TextInputType? textInputType;
  final IconData? suficon;
  final IconData? preicon;
  final bool? read;

  const CustomeTextField2(
      {Key? key,
      this.txt1,
      this.txt2,
      this.textInputType,
      this.suficon,
      this.preicon,
      this.read})
      : super(key: key);

  @override
  _CustomeTextField2State createState() => _CustomeTextField2State();
}

class _CustomeTextField2State extends State<CustomeTextField2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.txt1!,
          style: Theme.of(context).textTheme.caption!.copyWith(
              letterSpacing: 0.1,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.headline1!.color),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border:
                Border.all(color: (Theme.of(context).textTheme.headline1!.color)!),
          ),
          child: TextFormField(
            readOnly: widget.read!,
            keyboardType: widget.textInputType,
            style: Theme.of(context).textTheme.caption!.copyWith(
                letterSpacing: 0.1,
                fontSize: 15,
                color: Theme.of(context).textTheme.headline1!.color),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14, top: 15),
              hintText: widget.txt2,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  letterSpacing: 0.1,
                  fontSize: 15,
                  color: Theme.of(context).textTheme.headline1!.color),
              suffixIcon: Icon(
                widget.suficon,
                size: 20,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
