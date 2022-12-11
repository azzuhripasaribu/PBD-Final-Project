import 'package:flutter/material.dart';
import 'package:final_project/page/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationPage extends StatelessWidget {

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if(!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education'),
      ),
      drawer: myDrawer(context),
      body: SingleChildScrollView(
        child: Column(
            children: [
        Container(
        margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Text(
          'Introduction',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Text(
          '    Many of you may already know what sexual harassment is, but did you know that this is a sexual harassment too\n\n“You’re actually doing pretty good for a women/men”\n\nAccording to http://etactics.com around 72% victim did not think that they were sexually harassed. So, there’s clearly still not enough of awareness surrounding what is sexual harassment? What is the effect? And how to to protect ourselves from it.',
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Text(
          'What is sexual harassment?',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Text(
          '    Sexual harassment is an unwanted act of sexual behavior that is done in explicit or implicit way that may or may not make the person offended, harmed or intimidated. Sexual harassment does not always mean it is targeted to one person, it could be conducted to a large group of people and it can affect both men and women.',
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Text(
          'What is sexual harassment looks like?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Text(
          '    In a whole there is a lot of form of sexual harassment however, in general there is three main types of sexual harassment namely verbal, non-verbal and physical harassment. To be more specific let’s dive in to each of the examples',
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Text(
          '1. Verbal sexual harassment',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
              Container(
                margin: EdgeInsets.only(left:20, right:20,bottom: 10),
                child: Text(
                    '    In definition, verbal sexual harassment is an act of sexual behavior that involves verbal activities in an unwelcomed manner (according to damorelaw.com).To be more clear, if there’s someone saying sexual things that made you feel uncomfortable, then you may be the victim of verbal sexual harassment because of how easy it is to get verbally abused,this made verbal sexual harassment the most common type of harassment, according to whattobecome.com which 77% act of sexual harassment is verbal abuse. Example of verbal sexual harassments are:'
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  '- Revealing the desire for sexual activity.\n- Usage of sexually inappropriate language.\n- Speaking in a sexual tone.\n- Criticizing someone’s appearance.\n- Making a sexual jokes.<br>'
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  '    Keep in mind that not every sexually-themed comment are sexual harassment it usually depends on the context and situation and each person perception are differs.However, we can draw a line of what considered too far and it is important to not let that slide'
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text(
                  '2. Non-Verbal Harassment',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  '    Is an act of unwelcomed sexual activity that is not verbal but also not considered to be physical or usually considered as visual sexual harassment.This type of harassment is very common in this modern era, this is because of social media whereas the victim received an explicit message,picture or other similar sexual behavior. However, it is also still conducted in traditional most notably are stalking and staring. Some of the examples are:'
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Text(
                  '- Sending inappropriate picture.\n- Texting in a sexual manner.\n- Stalking or staring.\n- Taking picture.\n- Blowing kiss or winking'
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Text(
                  '    Because of it’s passive or passive aggressive nature of this behavior it can be relatively hard to identify whether non-verbal abuse have taken place,and the perpetrators can even positioned themselves to be in discreet places so it may go unnoticed.'
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: Text(
                  '3. Physical Harassment',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  '    Unwelcomed sexual physical behavior can be considered as sexual assault or sexual harassment. While other type of sexual harassment is relatively hard to identify it, physical sexual harassment is may be the easiest to detect, this is because of the act of physical touch or similar activity is not as common as verbal or visual and it’s usually easy to draw the line.Some of the examples namely:'
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Text(
                  '- Any unwelcomed touching\n- Hugging, kissing or massaging\n- Grabbing, rubbing or pinching'
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Text(
                  '    You cannot let unwelcomed sexual harassment happened. You have the right to reject, push or other similar defensive activity if it is deemed necessary. It is important to know that you do not need to be afraid especially in workplace.'
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Text(
                  "What's the effect?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text(
                  "For Victims",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "    Significant psychological effects, including as anxiety, sadness, headaches, sleep issues, weight loss or gain, nausea, diminished self-esteem, and sexual dysfunction,can be experienced by sexual harassment victims. They also suffer expenses associated to their jobs, such as lost wages, low morale, unsatisfactory work, and permanent harm to workplace relationships."
                ),
              ),
              Container(
                child: new InkWell(
                  child: new Text("http://www.equalrights.org/professional/sexhar/work/workplac.asp"),
                  onTap: () => _launchURL('http://www.equalrights.org/professional/sexhar/work/workplac.asp'),
                )
              ),
              Container(
                  child: new InkWell(
                    child: new Text("http://www.stopvaw.org/effects_of_sexual_harassment.html"),
                    onTap: () => _launchURL("http://www.stopvaw.org/effects_of_sexual_harassment.html"),
                  )
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  '    Additionally, in the context of higher education, students who have been the targets of sexual harassment could feel forced to abandon a class, alter their major or minor, and endure physical and mental anguish. Overall, sexual harassment creates an environment that is stressful and counterproductive for learning and working.'
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: Text(
                  'For Harasser',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
              )
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "    Sexual harassment may result in written or verbal reprimands, referrals for training or therapy, suspension, reassignment, demotion, or termination of employment. Another relevant authority may be referred to for review of potential violations of local, state, and federal laws.\n Any student who is found to have broken any rule(s) established by Ramapo College may be subject to the proper disciplinary measures, which may include, but are not limited to: referral for an educational program, referral for counseling, written or verbal reprimand, probation, suspension, or expulsion.\nVisit the Office of Student Conduct website and refer to the 'Sexual Misconduct Policy Governing Students' included in the Student Handbook for more details on the process for filing complaints of student harassment."
                )
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: Text(
                  "How to protect ourselves?",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "    Regardless of how it appears, sexual harassment must be recognized and the harasser must be dealt with quickly. It is extremely important to prevent sexual harassment and to deal with it quickly when it does occur.\nHere are eight steps to protect yourself from being sexually harassed:"
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right:20),
                child: Text(
                  "1. Be informed about the definition of sexual harassment.\n2. Be knowledgeable about institutional policies regarding sexual harassment.\n3. Take an active role in fostering a work environment free from sexual harassment.\n4. Attend sexual harassment prevention courses or training.\n5. Report the harassment to your supervisor immediately, or to a higher authority if your supervisor is the harasser. Consult with your human resources office and government agency if necessary. Never be afraid to report a comment, action, or gesture by somebody that made you feel uncomfortable.\n6. If possible, speak with the individual directly and inform him or her that you feel the behavior is inappropriate.\n7. Seek support from family members, friends, colleagues, or your state nurses’ association.\n8. Document the harassment in writing as soon as possible<br>"
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, top: 10),
                  child: new InkWell(
                    child: new Text("https://minoritynurse.com/8-steps-protect-sexual-harassment/"),
                    onTap: () => _launchURL("https://minoritynurse.com/8-steps-protect-sexual-harassment/"),
                  )
              ),

      ]
    )
    )
    );
  }
}

