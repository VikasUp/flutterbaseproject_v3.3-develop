import 'package:base_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomOtpField extends StatelessWidget {
  final Function(String) onChange;
  final BuildContext buildContext;
  final PinCodeFieldShape? shape;
  final double? borderRadius;
  final double? borderWidth;
  final Color? activeFillColor;
  final Color? inactiveFillColor;
  final Color? inactiveColor;
  final Color? selectedColor;
  final Color? selectedFillColor;
  final Color? activeColor;
  final Color? backgroundColor;
  final int? animationDuration;
  final TextInputType? keyboardType;
  final bool? isObscure;
  final String? obscureText;
  final int? length;
  final AnimationType? animationType;

  const CustomOtpField({
    required this.onChange,
    required this.buildContext,
    Key? key,
    this.activeColor,
    this.activeFillColor,
    this.animationDuration,
    this.backgroundColor,
    this.borderRadius,
    this.borderWidth,
    this.inactiveColor,
    this.inactiveFillColor,
    this.keyboardType,
    this.selectedColor,
    this.selectedFillColor,
    this.shape,
    this.isObscure,
    this.length,
    this.obscureText,
    this.animationType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: buildContext,
      length: length ?? 6,
      obscureText: isObscure ?? true,
      obscuringCharacter: obscureText ?? '*',
      blinkWhenObscuring: true,
      animationType: animationType ?? AnimationType.fade,
      pinTheme: PinTheme(
        shape: shape ?? PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
        borderWidth: borderWidth ?? 1,
        activeFillColor: activeFillColor ?? Colors.white,
        inactiveFillColor: inactiveFillColor ?? Colors.transparent,
        inactiveColor: inactiveColor ?? ColorName.primarySwatch,
        selectedColor: selectedColor ?? Theme.of(context).primaryColor,
        selectedFillColor: selectedFillColor ?? Colors.transparent,
        activeColor: activeColor ?? ColorName.primarySwatch,
      ),
      backgroundColor: backgroundColor ?? Colors.transparent,
      animationDuration: Duration(milliseconds: animationDuration ?? 300),
      enableActiveFill: true,
      keyboardType: keyboardType ?? TextInputType.number,
      onChanged: onChange,
      beforeTextPaste: (text) => true,
    );
  }
}
