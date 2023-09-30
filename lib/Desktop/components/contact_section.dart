import 'package:flutter/material.dart';
import 'package:portifilio/Desktop/widgets/contact_section/desktop_contact.dart';
import 'package:portifilio/Desktop/widgets/contact_section/mobile_contact.dart';
import 'package:portifilio/Desktop/widgets/contact_section/tablet_contact.dart';

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
    return res.isDesktop(context)
        ? DesktopContact(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            contacts: contacts)
        : (res.isTablet(context)
            ? TabletContact(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                contacts: contacts)
            : MobileContact(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                contacts: contacts));
  }
}
