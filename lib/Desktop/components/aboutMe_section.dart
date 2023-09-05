import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifilio/helpers/constants.dart';
import 'package:portifilio/helpers/responsive.dart';

class AboutMeSection extends StatelessWidget {
  AboutMeSection({super.key});
  String aboutMe = '''
"👋 Hey there, I'm Mahmoud kokeh! 🌟

I'm not just an IT student, I'm a passionate explorer of the digital realm. My journey into the world of technology began with a fascination 
for loving programming and tye possibilities the have and move this passion for app development using Flutter framework. Over time, I've honed my skills, transforming my curiosity into a tool to create seamless, user-centric applications.

🏆 Competing in the ICPC for four years, I've embraced challenges as opportunities for growth. Those intense coding battles have earned me good ranks in anniversary contests, shaping me into a relentless problem solver and a dedicated team player.

📚 Pursuing my studies in AI at Damascus University, I've found my true calling. The boundless possibilities of artificial intelligence ignite a fire within me. I envision a future where innovation and automation not only augment our lives but also revolutionize the very essence of how we function.

🌍 My love for the IT realm goes beyond the classroom. I'm constantly brewing ideas to reshape the norm, to disrupt conventional thinking and introduce novel ways of doing things. From enhancing user experiences to optimizing intricate processes, I believe in the power of tech to shape a brighter tomorrow.

🎯 My goal? To make a difference, I'm on a mission to simplify the complexities of our world, to bridge gaps and make technology accessible to all. As I learn, grow, and evolve, I'm determined to leave an indelible mark by crafting solutions that cater to the very needs of our global community.

Let's connect and collaborate! Feel free to reach out if you share the same passion for innovation, problem-solving, and making the world a better place through technology. 🚀"
''';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Responsive res = Responsive();
    bool isWideScreen = res.isDesktop(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: isWideScreen ? 80 : 40,
      ),
      decoration: BoxDecoration(
        color: kcomponentBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 62, right: 62),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: isWideScreen ? 2 : 3,
              child: Image.asset('assets/images/about_me.png'),
            ),
            SizedBox(width: isWideScreen ? 40 : 20),
            Expanded(
              flex: isWideScreen ? 3 : 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Me',
                    style: GoogleFonts.changa(
                      color: darkWihte,
                      fontSize: isWideScreen ? 36 : 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    aboutMe,
                    style: GoogleFonts.changa(
                      color: darkWihte,
                      fontSize: isWideScreen ? 18 : 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'MAHM',
                    style: GoogleFonts.greatVibes(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
