import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifilio/Desktop/models/contactModel.dart';
import 'package:portifilio/Desktop/widgets/contact_section/common.dart';
import 'package:portifilio/helpers/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileContact extends StatelessWidget {
  MobileContact(
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
          child: FittedBox(
            child: Column(
              children: [
                Center(
                  child: FittedBox(
                    child: Text(
                      'Contact with me!',
                      style: headlabel(true),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                SizedBox(
                  width: screenWidth * 0.95,
                  height: screenHeight * 1.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Send me a messege!',
                        style: GoogleFonts.firaSans(
                          color: kpink,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Center(
                        child: FittedBox(
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
                          message = t;
                        },
                        onSubmitted: (d) {
                          print(d.length);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.01, top: screenHeight * 0.02),
                        child: SizedBox(
                          height: screenHeight * 0.06,
                          width: screenWidth * 0.40,
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
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  'Submit',
                                  style: GoogleFonts.firaSans(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp),
                                ),
                              ),
                            ),
                          ),
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
      ),
    );
  }
}
