import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? value;
  final String? label;
  final IconData? prefixIcon;
  final Function(String) onSubmit;
  final bool? isReadOnly;
  final int? maxLines;
  final Function()? onTapped;

  const AppTextField({
    super.key,
    this.value,
    required this.onSubmit,
    this.onTapped,
    this.prefixIcon,
    this.label,
    this.isReadOnly,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? "",
        ),
        const SizedBox(height: 5),
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(colors: [Colors.red, Colors.blue])
                .createShader(bounds);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: maxLines,
              textAlign: TextAlign.right,
              cursorColor: const Color.fromARGB(255, 192, 192, 192),
              style: const TextStyle(color: Color.fromARGB(255, 192, 192, 192)),
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  labelText: "Email",
                  prefixIcon: Icon(
                    prefixIcon,
                    color: Theme.of(context).primaryColor,
                  )),
              onSubmitted: (val) {
                onSubmit(val);
              },
              onChanged: (val) {
                onSubmit(val);
              },
              readOnly: isReadOnly ?? false,
              controller: TextEditingController(text: value ?? ""),
              onTap: () {
                (onTapped != null) ? onTapped!() : () {};
              },
            ),
          ),
        ),
      ],
    );
  }
}
