import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class Input extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool obscure;
  final String? obscuringCharacter;
  final TextEditingController? controller;

  const Input({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.obscuringCharacter,
    this.controller,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          obscuringCharacter: "*",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter ${widget.label.toLowerCase()}';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            prefixIcon: Icon(widget.icon),
            suffixIcon:
                widget.obscure
                    ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                    : null,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
