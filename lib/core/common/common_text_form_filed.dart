import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/assets/app_colors.dart';
import 'package:harry_potter_app/core/assets/app_dimens.dart';

class TextFormFieldForm extends StatefulWidget {
  const TextFormFieldForm({
    super.key,
    required this.hinttext,
    this.validator,
    required this.controller,
    this.isHidden,
  });
  final String hinttext;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool? isHidden;

  @override
  State<TextFormFieldForm> createState() => _TextFormFieldFormState();
}

class _TextFormFieldFormState extends State<TextFormFieldForm> {
  final _hidePassword = ValueNotifier<bool?>(null);

  @override
  void initState() {
    if (widget.isHidden != null) {
      _hidePassword.value = widget.isHidden ?? false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _hidePassword,
        builder: (context, value, child) {
          return TextFormField(
            keyboardType: TextInputType.text,
            obscureText: value ?? false,
            controller: widget.controller,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: AppColour.textFormFieldColor,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  _hidePassword.value = !_hidePassword.value!;
                },
                icon: value != null
                    ? Icon(value ? Icons.visibility_off : Icons.visibility)
                    : const SizedBox.shrink(),
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.6),
              hintText: widget.hinttext,
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppDimens.textFormFieldRadius),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppDimens.textFormFieldRadius),
                borderSide: const BorderSide(color: Colors.white),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppDimens.textFormFieldRadius),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppDimens.textFormFieldRadius),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
            validator: widget.validator,
          );
        });
  }
}
