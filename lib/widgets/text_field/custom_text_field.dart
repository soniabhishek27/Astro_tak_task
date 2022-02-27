import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:aaj_tak/app/themes/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../helper/text_field_wrapper.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int? maxLength;
  final TextInputType inputType;
  final TextFieldWrapper wrapper;
  final bool isEnabled;
  final bool passwordField;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool autofocus;
  final Widget? trailing;
  final Color? fillColor;
  final void Function(String)? onChanged;
  final String? label;
  final bool noBorder;
  final int? minLines;
  final IconData? trailingIcon;
  final VoidCallback? onTrailingIconPressed;
  final Color? borderColor;
  final double? contentPadding;
  final Widget? prefix;
  final isInputFormatters;
  final VoidCallback? onTap;

  CustomTextField({
    required this.wrapper,
    required this.hintText,
    this.maxLength,
    this.inputType = TextInputType.text,
    this.isEnabled = true,
    this.passwordField = false,
    this.maxLines,
    this.textAlign,
    this.isInputFormatters = false,
    this.autofocus = false,
    this.onChanged,
    this.label,
    this.trailing,
    this.noBorder = false,
    this.fillColor,
    this.minLines,
    this.onTap,
    this.borderColor,
    this.trailingIcon,
    this.onTrailingIconPressed,
    this.contentPadding,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    var passwordToggle = passwordField.obs;

    return Obx(
      () => TextField(
        onTap: onTap,
        inputFormatters: isInputFormatters
            ? [
                FilteringTextInputFormatter.digitsOnly,
              ]
            : [],
        controller: wrapper.controller,
        style: Styles.tsRegularTitleStyle16,
        maxLength: maxLength,
        maxLines: passwordField ? 1 : maxLines,
        minLines: minLines,
        keyboardType: inputType,
        enabled: isEnabled,
        autofocus: autofocus,
        onChanged: onChanged,
        textAlign: textAlign ?? TextAlign.start,
        obscureText: passwordToggle.value,
        cursorColor: AppColors.lightBlue,
        decoration: InputDecoration(
          counterText: '',
          alignLabelWithHint: true,
          filled: fillColor != null,
          contentPadding: EdgeInsets.all(contentPadding ?? 16),
          errorText: wrapper.errorText.isEmpty ? null : wrapper.errorText,
          errorStyle: Styles.fieldErrorStyle,
          fillColor: fillColor ?? AppColors.lightBlue,
          suffix: trailing,
          suffixIcon: trailingIcon != null
              ? IconButton(
                  icon: Icon(trailingIcon), onPressed: onTrailingIconPressed)
              : passwordField
                  ? IconButton(
                      icon: Icon(
                        passwordToggle.value
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                      ),
                      onPressed: () {
                        passwordToggle.value = !passwordToggle.value;
                      })
                  : null,
          hintText: hintText,
          hintStyle: Styles.tsHint,
          prefix: prefix,
          enabled: isEnabled,
          labelText: label,
          border: noBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: AppColors.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(2.0),
                ),
          focusedBorder: noBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightBlue),
                  borderRadius: BorderRadius.circular(2.0),
                ),
          enabledBorder: noBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightBlue),
                  borderRadius: BorderRadius.circular(2.0),
                ),
          focusedErrorBorder: noBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redAccent),
                  borderRadius: BorderRadius.circular(2.0),
                ),
          errorBorder: noBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redAccent),
                  borderRadius: BorderRadius.circular(2.0),
                ),
        ),
      ),
    );
  }
}
