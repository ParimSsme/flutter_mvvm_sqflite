import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final String? value;
  final String hint;
  final String? label;
  final Icon? prefixIcon;
  final Function(String) onSubmit;
  final bool? isReadOnly;
  final bool? isMultiline;
  final Function()? onTapped;

  const AppTextField({Key? key,
    this.value,
    required this.hint,
    required this.onSubmit,
    this.onTapped,
    this.prefixIcon,
    this.label,
    this.isReadOnly,
    this.isMultiline
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label ?? "",),
        const SizedBox(height: 5),
        TextField(
          maxLines: (isMultiline ?? false) ? 10 : 1,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              hintText: hint),
          onSubmitted: (val){ onSubmit(val); },
          onChanged: (val){ onSubmit(val); },
          readOnly: isReadOnly ?? false,
          controller: TextEditingController(
              text: value ?? ""
          ),
          onTap: (){
            (onTapped != null) ? onTapped!() : (){};
          },
        ),
      ],
    );
  }
}