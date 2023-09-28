import 'package:flutter/material.dart';
import 'package:portifilio/helpers/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCicle extends StatefulWidget {
  ContactCicle({
    Key? key,
    this.color,
    this.photo,
    this.url,
    this.isHover = false,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final color;
  final photo;
  final url;
  bool isHover;
  final double screenWidth;
  final double screenHeight;

  @override
  State<ContactCicle> createState() => _ContactCicleState();
}

class _ContactCicleState extends State<ContactCicle> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (s) {
        setState(() {
          widget.isHover = true;
        });
      },
      onExit: (s) {
        setState(() {
          widget.isHover = false;
        });
      },
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(widget.url))) {
            print('Yes it is');
            await launchUrl(Uri.parse(widget.url));
          } else {
            print('Holly cow nothing is happening');
          }
        },
        child: SizedBox(
          height: widget.isHover
              ? widget.screenHeight * 0.16
              : widget.screenHeight * 0.14,
          width: widget.isHover
              ? widget.screenWidth * 0.16
              : widget.screenWidth * 0.14,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kyellow,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(widget.photo),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BeautyTextfield extends StatefulWidget {
  const BeautyTextfield(
      {Key? key,
      required this.width,
      required this.height,
      required this.prefixIcon,
      required this.inputType,
      this.controller,
      this.suffixIcon,
      this.duration = const Duration(milliseconds: 500),
      this.margin = const EdgeInsets.all(10),
      this.obscureText = false,
      this.backgroundColor = const Color(0xff111823),
      this.cornerRadius = const BorderRadius.all(Radius.circular(10)),
      this.textColor = const Color(0xff5c5bb0),
      this.accentColor = Colors.white,
      this.placeholder = "Placeholder",
      this.isShadow = true,
      this.onClickSuffix,
      this.wordSpacing,
      this.textBaseline,
      this.fontFamily,
      this.fontStyle,
      this.fontWeight,
      this.autofocus = false,
      this.autocorrect = false,
      this.focusNode,
      this.enabled = true,
      this.maxLength,
      this.maxLines,
      this.minLines,
      this.onChanged,
      this.onTap,
      this.onSubmitted})
      : assert(width != null),
        assert(height != null),
        assert(prefixIcon != null),
        assert(inputType != null),
        super(key: key);
  final BorderRadius cornerRadius;
  final double? width, height, wordSpacing;
  final Color? backgroundColor, accentColor, textColor;
  final String? placeholder, fontFamily;
  final Icon? prefixIcon, suffixIcon;
  final TextInputType? inputType;
  final EdgeInsets? margin;
  final Duration? duration;
  final VoidCallback? onClickSuffix;
  final TextBaseline? textBaseline;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final bool? autofocus, autocorrect, enabled, obscureText, isShadow;
  final FocusNode? focusNode;
  final int? maxLength, minLines, maxLines;
  final ValueChanged<String>? onChanged, onSubmitted;
  final GestureTapCallback? onTap;
  final TextEditingController? controller;

  @override
  _BeautyTextfieldState createState() => _BeautyTextfieldState();
}

class _BeautyTextfieldState extends State<BeautyTextfield> {
  bool isFocus = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          boxShadow: widget.isShadow!
              ? [
                  const BoxShadow(
                      color: Colors.grey, blurRadius: 2, spreadRadius: 1)
                ]
              : [const BoxShadow(spreadRadius: 0, blurRadius: 0)],
          borderRadius: widget.cornerRadius,
          color: widget.suffixIcon == null
              ? isFocus
                  ? widget.accentColor
                  : widget.backgroundColor
              : widget.backgroundColor),
      duration: widget.duration!,
      child: Stack(
        children: <Widget>[
          widget.suffixIcon == null
              ? Container()
              : Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedContainer(
                    width: isFocus ? 500 : 40,
                    height: isFocus ? widget.height : 40,
                    margin: EdgeInsets.only(right: isFocus ? 0 : 7),
                    duration: widget.duration!,
                    decoration: BoxDecoration(
                      borderRadius: isFocus
                          ? widget.cornerRadius
                          : const BorderRadius.all(Radius.circular(60)),
                      color: widget.accentColor,
                    ),
                  ),
                ),
          widget.suffixIcon == null
              ? Container()
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      isFocus ? isFocus = false : isFocus = true;
                      if (widget.onClickSuffix != null) {
                        widget.onClickSuffix!();
                      }
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    alignment: Alignment.centerRight,
                    child: Icon(
                      widget.suffixIcon!.icon,
                      color: widget.textColor,
                    ),
                  ),
                ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Icon(
                    widget.prefixIcon!.icon,
                    color:
                        isFocus ? widget.backgroundColor : widget.accentColor,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: const EdgeInsets.only(right: 50, top: 3),
                    child: TextField(
                      controller: widget.controller,
                      cursorWidth: 2,
                      obscureText: widget.obscureText!,
                      keyboardType: widget.inputType,
                      style: TextStyle(
                        fontFamily: widget.fontFamily,
                        fontStyle: widget.fontStyle,
                        fontWeight: widget.fontWeight,
                        wordSpacing: widget.wordSpacing,
                        textBaseline: widget.textBaseline,
                        fontSize: 18,
                        letterSpacing: 2,
                        color: widget.textColor,
                      ),
                      autofocus: widget.autofocus!,
                      autocorrect: widget.autocorrect!,
                      focusNode: widget.focusNode,
                      enabled: widget.enabled,
                      maxLength: widget.maxLength,
                      maxLines: widget.maxLines,
                      minLines: widget.minLines,
                      onChanged: widget.onChanged,
                      onTap: () {
                        setState(() {
                          isFocus = true;
                        });
                        if (widget.onTap != null) {
                          widget.onTap!();
                        }
                      },
                      onSubmitted: (t) {
                        setState(() {
                          isFocus = false;
                        });
                        widget.onSubmitted!(t);
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: widget.textColor),
                          hintText: widget.placeholder,
                          border: InputBorder.none),
                      cursorColor:
                          isFocus ? widget.accentColor : widget.backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
