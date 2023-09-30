import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifilio/Desktop/models/contactModel.dart';
import 'package:portifilio/Desktop/widgets/contact_section/common.dart';
import 'package:portifilio/helpers/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopContact extends StatelessWidget {
  DesktopContact(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.contacts});
  double screenWidth;
  double screenHeight;
  List<ContactModel> contacts;
  String? fname = '';
  String? lname = '';
  String? message = '';

  @override
  Widget build(BuildContext context) {
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
              Center(
                child: SizedBox(
                  width: 60.w,
                  child: FittedBox(
                    child: Text(
                      "Contact with me!",
                      maxLines: 1,
                      style: headlabel(true),
                    ),
                  ),
                ),
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
                              fontSize: 40,
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
                              Icons.mail,
                            ),
                            placeholder: "Messege",
                            onTap: () {
                              print('Click');
                            },
                            onChanged: (t) {
                              message = t;
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
                                  print(message);
                                  launch(
                                    'mailto:mahmoudkoka39@gmail.com?subject=Mail from Portfolio &body=Hello,i\'m $fname $lname\n $message',
                                  );
                                },
                                child: FittedBox(
                                  child: Center(
                                    child: Text(
                                      'Submit',
                                      style: GoogleFonts.firaSans(
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp),
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
