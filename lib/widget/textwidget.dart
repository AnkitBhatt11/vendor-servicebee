import 'package:flutter/material.dart';

class CustomeTextField extends StatefulWidget {
  final String? txt1;
  final String? txt2;
  final TextInputType? textInputType;

  const CustomeTextField({
    Key? key,
    this.txt1,
    this.txt2,
    this.textInputType,
  }) : super(key: key);

  @override
  _CustomeTextFieldState createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
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
          child: TextFormField(
            keyboardType: widget.textInputType,
            style:
                Theme.of(context).textTheme.caption!.copyWith(letterSpacing: 0.1, fontSize: 15, color: Theme.of(context).textTheme.headline1!.color),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14),
              hintText: widget.txt2,
              hintStyle: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(letterSpacing: 0.1, fontSize: 15, color: Theme.of(context).textTheme.headline1!.color),
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
