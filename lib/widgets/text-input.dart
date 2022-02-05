import 'package:flutter/material.dart';
import 'package:fuelmetrics_flutter_project/utils.dart/themes.dart';

class TextInput extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Color? textColor;
  final double? borderWidth;
  final FocusNode? focusNode;
  final String? hintText;
  final String? Function(String?)? validator;
  final VoidCallback? iconAction;
  final String? labelText;
  final Color? labelTextColor;
  final double? labelFontSize;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Widget? prefixWidget;
  final IconData? icon;
  final double? hintTextSize;
  final bool? isPassword;
  final EdgeInsetsGeometry? contentPadding;
  final Function? onChanged;
  final double? textSize;
  final Color? color;
  final bool readOnly;
  final bool? enabled;
  final int? maxLines;

  TextInput(
      {@required this.controller,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.labelFontSize,
      this.hintTextSize,
      this.hintText,
      this.labelTextColor,
      this.prefixWidget,
      this.icon,
      this.borderWidth,
      this.borderColor,
      this.focusedBorderColor,
      this.enabled,
      this.isPassword,
      this.iconAction,
      this.labelText = '',
      this.textColor,
      this.contentPadding,
      this.focusNode,
      this.maxLines = 1,
      this.onChanged,
      this.textSize = 12,
      this.color = Colors.transparent,
      this.readOnly = false});

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        /*
        decoration: BoxDecoration(
            color: this.widget.color,
            border: Border.all(
                color: this.widget.borderColor ?? ColorSet().primaryColorDark,
                width: this.widget.borderWidth ?? 1),
            borderRadius: BorderRadius.circular(5)),*/
        child: TextFormField(
          maxLines: this.widget.maxLines,
          readOnly: this.widget.readOnly,
          enabled: this.widget.enabled ?? true,
          validator: this.widget.validator ?? null,
          onChanged: (value) => this.widget.onChanged ?? null,
          focusNode: this.widget.focusNode,
          obscureText: this.widget.isPassword!,
          controller: this.widget.controller,
          keyboardType: this.widget.keyboardType,
          style: TextStyle(color: this.widget.textColor, fontSize: 16),
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.transparent,
              filled: true,
              hintText: this.widget.hintText ?? '',
              labelStyle: TextStyle(
                  color: this.widget.labelTextColor,
                  fontSize: this.widget.textSize,
                  fontFamily: 'BasisGrotesquePro',
                  letterSpacing: 0.0),
              //  hintText: this.widget.hintText ?? null,
              isDense: true,
              hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.grey,
                  // letterSpacing: hintTextSpacing,
                  fontSize: this.widget.hintTextSize ?? 12.0),
              //prefix: this.widget.prefixWidget ?? null,
              prefixIcon: this.widget.prefixWidget ?? null,
              suffixIcon: InkWell(
                child: Icon(this.widget.icon,
                    size: 25,
                    color: this.widget.isPassword! == true
                        ? Colors.grey.withOpacity(0.4)
                        : primaryGreen),
                onTap: this.widget.iconAction,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: this.widget.borderColor ?? primaryGreen!,
                      width: this.widget.borderWidth ?? 1)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: Colors.red, width: this.widget.borderWidth ?? 1)),
              contentPadding: this.widget.contentPadding ??
                  EdgeInsets.only(left: 20, top: 8, bottom: 15)),
        ),
      ),
    );
  }
}
