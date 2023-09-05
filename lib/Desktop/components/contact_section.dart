import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/constants.dart';
import '../../helpers/responsive.dart';
import '../models/contactModel.dart';

class ContactSection extends StatelessWidget {
  ContactSection({Key? key}) : super(key: key);

  String? messege;
  String? fname;
  String? lname;
  List<ContactModel> contacts = [
    ContactModel(
      photo: 'assets/images/contact/facebookgif.gif',
      url: 'https://www.facebook.com/profile.php?id=100009444702867',
    ),
    ContactModel(
      photo: 'assets/images/contact/telegramgif.gif',
      url: 'https://t.me/Mahmoud_kok',
    ),
    ContactModel(
      photo: 'assets/images/contact/whatsappgif.gif',
      url: '///',
    ),
    ContactModel(
      photo: 'assets/images/contact/gethubgif.gif',
      url: 'mahmoudkoka39@gmail.com',
    ),
    ContactModel(
      photo: 'assets/images/contact/linkingif.gif',
      url: 'https://www.linkedin.com/in/mahmod-koka-20a155214/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Responsive res = Responsive();
    bool isWideScreen = res.isDesktop(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: kcomponentBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.03,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.call,
                    color: kpink,
                    size: isWideScreen ? 60 : 40,
                  ),
                  headSection('Contact with me'),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              SizedBox(
                width: screenWidth * 0.95,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: List.generate(
                              contacts.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ContactCicle(
                                      photo: contacts[index].photo,
                                      url: contacts[index].url,
                                      color: kpink,
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight,
                                    ),
                                  )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Send me a messege!',
                            style: GoogleFonts.firaSans(
                              color: kpink,
                              fontSize: isWideScreen ? 40 : 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          BeautyTextfield(
                            width: double.maxFinite,
                            height: screenHeight * 0.15,
                            duration: const Duration(milliseconds: 300),
                            accentColor: kdarkpurble,
                            textColor: white,
                            inputType: TextInputType.text,
                            prefixIcon: const Icon(
                              Icons.person,
                            ),
                            placeholder: "First Name",
                            onTap: () {
                              print('Click');
                            },
                            onChanged: (t) {
                              fname = t;
                            },
                            onSubmitted: (d) {
                              print(d.length);
                            },
                          ),
                          BeautyTextfield(
                            width: double.maxFinite,
                            height: screenHeight * 0.15,
                            duration: const Duration(milliseconds: 300),
                            accentColor: kdarkpurble,
                            textColor: white,
                            inputType: TextInputType.text,
                            prefixIcon: const Icon(
                              Icons.person,
                            ),
                            placeholder: "Last Name",
                            onTap: () {
                              print('Click');
                            },
                            onChanged: (t) {
                              lname = t;
                            },
                            onSubmitted: (d) {
                              print(d.length);
                            },
                          ),
                          BeautyTextfield(
                            width: double.maxFinite,
                            height: screenHeight * 0.45,
                            duration: const Duration(milliseconds: 300),
                            accentColor: kdarkpurble,
                            textColor: white,
                            inputType: TextInputType.text,
                            prefixIcon: const Icon(
                              Icons.person,
                            ),
                            placeholder: "Messege",
                            onTap: () {
                              print('Click');
                            },
                            onChanged: (t) {
                              messege = t;
                            },
                            onSubmitted: (d) {
                              print(d.length);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.01,
                                top: screenHeight * 0.02),
                            child: SizedBox(
                              height: screenHeight * 0.09,
                              width: screenWidth * 0.15,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kpurble),
                                ),
                                onPressed: () async {
                                  print(fname);
                                  print(lname);
                                  print(messege);
                                  launch(
                                    'mailto:mahmoudkoka39@gmail.com?subject=Flutter developer interview&body=Hello,i\'m$fname $lname\n$messege',
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    'Submit',
                                    style: GoogleFonts.firaSans(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
            decoration: BoxDecoration(
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
