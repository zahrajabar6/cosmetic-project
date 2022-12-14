import 'package:cosmetic_project/controllers/colors.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {Key? key,
      required this.label,
      required this.validator,
      required this.obsecure, this.onChanged})
      : super(key: key);
  final String label;
  final FormFieldValidator<String> validator;
  final bool obsecure;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 70,
        child: SizedBox(
          height: 50,
          child: TextFormField(
            onFieldSubmitted:(x){
        FocusScope.of(context).unfocus();
        },
            onChanged: onChanged,
            obscureText: obsecure,
            textInputAction: TextInputAction.next,
            enableSuggestions: false,
            autocorrect: false,
            cursorColor: green,
            decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 14),
              labelText: label,
              labelStyle:
                  TextStyle(color: grey.withOpacity(0.70), fontSize: 18),
              floatingLabelStyle: TextStyle(color: green, fontSize: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 1, color: grey.withOpacity(0.20)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 2, color: green.withOpacity(0.60)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.red),
              ),
            ),
            validator: validator,
          ),
        ),
      ),
    );
  }
}
