import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? label;
  final String? errorText;
  final String? hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;


  const CustomTextFormField({
    super.key, 
    this.label, 
    this.errorText, 
    this.hintText, 
    this.onChanged, 
    this.validator, 
    this.obscureText = false
    });

  @override
  Widget build(BuildContext context) {
    
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(30));


    final color = Theme.of(context).colorScheme;

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: color.primary)),
        errorBorder: border.copyWith(borderSide: const BorderSide(color: Colors.red)),
        focusedErrorBorder: border.copyWith(borderSide: const BorderSide(color: Colors.red)),
        isDense: true,
        label: label != null? Text(label!) : null,
        hintText: hintText,
        focusColor: color.primary,
        errorText: errorText,
      ),
    );
  }
}