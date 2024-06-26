// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/core/constants/color.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final double h = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          primary: true,
          // extendBodyBehindAppBar: true,
          backgroundColor: isDark
              ? AppColor.ColorAppBarBackGraoundB
              : AppColor.ColorAppBarBackGraound,
          appBar: AppBar(
              primary: true,
              title: Text(
                "سياسة الخصوصية و الإستخدام",
                style: TextStyle(
                  fontFamily: "ElMessiri",
                  color: isDark ? AppColor.ColorTextB : AppColor.ColorText,
                ),
              ),
              centerTitle: true,
              toolbarHeight: h / 6.5,
              backgroundColor: const Color.fromARGB(0, 0, 0, 0),
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                bottomRight: Radius.circular(100),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(100),
              )),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0),
                    bottomRight: Radius.circular(100),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(100),
                  ),
                  gradient: LinearGradient(
                      begin:
                          isDark ? Alignment.centerLeft : Alignment.topCenter,
                      end: isDark
                          ? Alignment.centerRight
                          : Alignment.bottomCenter,
                      colors: isDark
                          ? AppColor.ColorAppBarB
                          : AppColor.ColorAppBar),
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? AppColor.ColorConShadowB
                          : AppColor.ColorConShadow,
                      blurRadius: 15,
                    ),
                  ],
                ),
              )),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(children: [
                      TextSpan(
                        text: '''
 سياسة الخصوصية
                    
    آخر تحديث: 22 يونيو 2024
                    
يحدد هذا الإشعار الخصوصي لشركة Night Co. ("نحن" أو "لنا" أو "خاصتنا") كيفية جمعنا ومعالجتنا ومشاركة معلوماتك عند استخدامك لخدماتنا ("الخدمات")، بما في ذلك تطبيقنا المحمول (Tasawe7). يتضمن أيضًا معلومات عن حقوقك و خياراتك المتعلقة بالخصوصية. باستخدام خدماتنا، فإنك توافق على الشروط الموضحة في هذه السياسة.

ملخص النقاط الرئيسية
جمع المعلومات الشخصية: نقوم بجمع المعلومات الشخصية التي تقدمها لنا طوعًا.
المعلومات الشخصية الحساسة: نحن لا نعالج المعلومات الشخصية الحساسة.

معلومات الطرف الثالث: نحن لا نتلقى أي معلومات من أطراف ثالثة.

معالجة المعلومات: نقوم بمعالجة المعلومات لتقديم وتحسين وإدارة خدماتنا، والتواصل معك، وضمان الأمان، ومنع الاحتيال، والامتثال للقانون.
مشاركة المعلومات: قد نشارك المعلومات في مواقف محددة ومع أطراف ثالثة محددة، كما هو موضح في هذه السياسة.
إخلاء المسؤولية: لا تعد شركة Night Co. وخدماتها، بما في ذلك تطبيق Tasawe7 المحمول، تابعة لأي جهة حكومية. لا يمثل التطبيق أو يزعم تمثيل أي وكالة أو سلطة حكومية. أي معلومات مقدمة من خلال خدماتنا هي لأغراض إعلامية فقط ولا ينبغي تفسيرها على أنها معلومات حكومية رسمية ما لم ينص على خلاف ذلك صراحة. ينصح المستخدمون بالتحقق من المعلومات بشكل مستقل من خلال المواقع الرسمية الحكومية:
''',
                        style: TextStyle(
                          fontFamily: "ElMessiri",
                          color: isDark
                              ? AppColor.ColorTextB
                              : const Color.fromARGB(255, 2, 2, 2),
                        ),
                      ),
                      TextSpan(
                        text: 'جوازات السفر',
                        style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse('https://enationality.moi.gov.eg/'));
                          },
                      ),
                      const TextSpan(
                        text: ' - ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 23, 24, 26),
                        ),
                      ),
                      TextSpan(
                        text: 'بطاقات الرقم القومي',
                        style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse('https://digital.gov.eg/'));
                          },
                      ),
                      const TextSpan(
                        text: ' - ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 23, 24, 26),
                        ),
                      ),
                      TextSpan(
                        text: 'شهادات الزواج',
                        style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(
                                'https://digital.gov.eg/categories/terms/%D9%85%D8%B3%D8%AA%D8%AE%D8%B1%D8%AC-%D8%B5%D9%88%D8%B1%D8%A9-%D8%B1%D8%B3%D9%85%D9%8A%D8%A9-%D9%85%D9%86-%D9%88%D8%AB%D9%8A%D9%82%D8%A9-%D8%B2%D9%88%D8%A7%D8%AC'));
                          },
                      ),
                      const TextSpan(
                        text: ' - ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 23, 24, 26),
                        ),
                      ),
                      TextSpan(
                        text: 'شهادات الميلاد\n',
                        style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(
                                'https://digital.gov.eg/categories/terms/%D8%B4%D9%87%D8%A7%D8%AF%D8%A9-%D8%A7%D9%84%D9%85%D9%8A%D9%84%D8%A7%D8%AF'));
                          },
                      ),
                      TextSpan(
                        text: '''
الاحتفاظ بالبيانات: نحتفظ بمعلوماتك طالما كان ذلك ضروريًا للأغراض الموضحة في هذا الإشعار الخصوصي ما لم يتطلب القانون خلاف ذلك.
الأطفال: نحن لا نجمع بيانات أو نسوق للأطفال الذين تقل أعمارهم عن 18 عامًا.
حقوق الخصوصية: يمكنك مراجعة أو تغيير أو إنهاء حسابك في أي وقت. سحب موافقتك عن طريق الاتصال بنا.
ميزات عدم التتبع: نحن لا نستجيب حاليًا لإشارات عدم التتبع.
تحديثات الإشعار: قد نقوم بتحديث هذا الإشعار الخصوصي للبقاء متوافقين مع القوانين ذات الصلة. سيتم إخطار المستخدمين بالتغييرات الجوهرية.
معلومات الاتصال: للاستفسارات المتعلقة بالخصوصية، اتصل بنا على nightxnight007@gmail.com.
مراجعة أو تحديث أو حذف البيانات: لديك الحق في طلب الوصول أو التغييرات أو حذف معلوماتك الشخصية عن طريق الاتصال بـ nightxnight007@gmail.com.
باستخدام خدماتنا، فإنك تقر وتوافق على الممارسات الموضحة في سياسة الخصوصية هذه.

جدول المحتويات
ما هي المعلومات التي نجمعها؟
كيف نعالج معلوماتك؟
متى ومع من نشارك معلوماتك الشخصية؟
ما هو موقفنا من مواقع الطرف الثالث؟
كم من الوقت نحتفظ بمعلوماتك؟
هل نجمع معلومات من الأطفال؟
ما هي حقوقك المتعلقة بالخصوصية؟
التحكم في ميزات عدم التتبع
هل نقوم بتحديث هذا الإشعار؟
كيف يمكنك الاتصال بنا بشأن هذا الإشعار؟
كيف يمكنك مراجعة أو تحديث أو حذف البيانات التي نجمعها منك؟
                    
1. ما هي المعلومات التي نجمعها؟
المعلومات الشخصية التي تقدمها لنا

باختصار: نجمع المعلومات الشخصية التي تقدمها لنا.

نجمع المعلومات الشخصية التي تقدمها لنا طوعًا عند التسجيل في الخدمات، أو التعبير عن الاهتمام بالحصول على معلومات عنا أو عن منتجاتنا وخدماتنا، عند المشاركة في أنشطة على الخدمات، أو عند الاتصال بنا بأي طريقة أخرى.

المعلومات الحساسة: نحن لا نعالج المعلومات الحساسة.

يجب أن تكون جميع المعلومات الشخصية التي تقدمها لنا صحيحة وكاملة ودقيقة، ويجب عليك إخطارنا بأي تغييرات تطرأ على هذه المعلومات الشخصية.

2. كيف نعالج معلوماتك؟
باختصار: نعالج معلوماتك لتقديم وتحسين وإدارة خدماتنا، والتواصل معك، من أجل الأمان ومنع الاحتيال، والامتثال للقانون. قد نعالج أيضًا معلوماتك لأغراض أخرى بموافقتك.

نعالج معلوماتك الشخصية لعدة أسباب، اعتمادًا على كيفية تفاعلك مع خدماتنا، بما في ذلك:

لتسهيل إنشاء الحساب والمصادقة وإدارة حسابات المستخدمين. قد نعالج معلوماتك حتى تتمكن من إنشاء حسابك وتسجيل الدخول إليه، وكذلك للحفاظ على حسابك في حالة عمل جيدة.

3. متى ومع من نشارك معلوماتك الشخصية؟
باختصار: قد نشارك المعلومات في مواقف محددة موصوفة في هذا القسم ومع الأطراف الثالثة التالية.

قد نحتاج إلى مشاركة معلوماتك الشخصية في الحالات التالية:

نقل الأعمال: قد نشارك أو ننقل معلوماتك فيما يتعلق بأي عملية اندماج أو بيع أصول الشركة أو تمويل أو استحواذ على كل أو جزء من أعمالنا لشركة أخرى أو أثناء المفاوضات المتعلقة بذلك.

4. ما هو موقفنا من مواقع الطرف الثالث؟
باختصار: نحن غير مسؤولين عن أمان أي معلومات تشاركها مع أطراف ثالثة قد نربطها أو تعلن على خدماتنا، ولكنها غير تابعة لخدماتنا.

قد ترتبط الخدمات بمواقع ويب أو خدمات عبر الإنترنت أو تطبيقات محمولة لأطراف ثالثة و/أو تحتوي على إعلانات من أطراف ثالثة غير تابعة لنا والتي قد ترتبط بمواقع ويب أو خدمات أو تطبيقات أخرى. وفقًا لذلك، لا نقدم أي ضمان بشأن أي من هذه الأطراف الثالثة، ولن نكون مسؤولين عن أي خسارة أو ضرر ناتج عن استخدام مواقع ويب أو خدمات أو تطبيقات الأطراف الثالثة. لا يعني تضمين رابط إلى موقع ويب أو خدمة أو تطبيق تابع لطرف ثالث تأييدًا منا. لا يمكننا ضمان سلامة وخصوصية البيانات التي تقدمها لأي أطراف ثالثة. البيانات التي تجمعها الأطراف الثالثة لا تغطيها هذا الإشعار الخصوصي. نحن لسنا مسؤولين عن محتوى أو ممارسات و سياسات الخصوصية والأمان لأي أطراف ثالثة، بما في ذلك مواقع الويب أو الخدمات أو التطبيقات الأخرى التي قد ترتبط بها أو من خدماتنا. يجب عليك مراجعة سياسات هذه الأطراف الثالثة والاتصال بها مباشرة للرد على أسئلتك.

5. كم من الوقت نحتفظ بمعلوماتك؟
باختصار: نحتفظ بمعلوماتك طالما كان ذلك ضروريًا لتحقيق الأغراض الموضحة في هذا الإشعار الخصوصي ما لم يتطلب القانون خلاف ذلك.

سنحتفظ بمعلوماتك الشخصية فقط طالما كان ذلك ضروريًا لتحقيق الأغراض المنصوص عليها في هذا الإشعار الخصوصي، ما لم تتطلب فترة احتفاظ أطول أو يسمح بها القانون (مثل الضرائب أو المحاسبة أو المتطلبات القانونية الأخرى). لن يتطلب أي غرض من هذا الإشعار أن نحتفظ بمعلوماتك الشخصية لفترة أطول من.

عندما لا يكون لدينا حاجة مشروعة مستمرة لمعالجة معلوماتك الشخصية، سنقوم إما بحذفها أو إخفائها، أو إذا لم يكن ذلك ممكنًا (على سبيل المثال، لأن معلوماتك الشخصية قد تم تخزينها في أرشيفات النسخ الاحتياطي)، فسوف نقوم بتخزين معلوماتك الشخصية بشكل آمن وعزلها عن أي معالجة أخرى حتى يصبح الحذف ممكنًا.

6. هل نجمع معلومات من الأطفال؟
باختصار: نحن لا نجمع بيانات من أو نسوق للأطفال الذين تقل أعمارهم عن 18 عامًا.

نحن لا نسعى لجمع البيانات من أو تسويقها للأطفال الذين تقل أعمارهم عن 18 عامًا. باستخدام الخدمات، فإنك تقر بأنك لا تقل عن 18 عامًا أو أنك والد أو وصي على هذا الطفل القاصر وتوافق على استخدامه للخدمات. إذا علمنا أنه تم جمع معلومات شخصية من مستخدمين تقل أعمارهم عن 18 عامًا، فسنقوم بإلغاء تنشيط الحساب واتخاذ تدابير معقولة لحذف هذه البيانات على الفور من سجلاتنا. إذا علمت بأي بيانات قد جمعناها من أطفال تقل أعمارهم عن 18 عامًا، يرجى الاتصال بنا على nightxnight007@gmail.com.

7. ما هي حقوقك المتعلقة بالخصوصية؟
باختصار: يمكنك مراجعة أو تغيير أو إنهاء حسابك في أي وقت.

سحب موافقتك: إذا كنا نعتمد على موافقتك لمعالجة معلوماتك الشخصية، والتي قد تكون موافقة صريحة و/أو ضمنية اعتمادًا على القانون المعمول به، لديك الحق في سحب موافقتك في أي وقت. يمكنك سحب موافقتك في أي وقت عن طريق الاتصال بنا باستخدام تفاصيل الاتصال المقدمة في القسم "كيف يمكنك الاتصال بنا بشأن هذا الإشعار؟" أدناه.

ومع ذلك، يرجى ملاحظة أن هذا لن يؤثر على قانونية المعالجة قبل سحبها ولا، عندما يسمح القانون المعمول به، سيؤثر على معالجة معلوماتك الشخصية التي تم تنفيذها اعتمادًا على أسباب المعالجة القانونية غير الموافقة.

معلومات الحساب

إذا كنت ترغب في أي وقت في مراجعة أو تغيير المعلومات في حسابك أو إنهاء حسابك، يمكنك:

تسجيل الدخول إلى إعدادات حسابك وتحديث حساب المستخدم الخاص بك.
الاتصال بنا باستخدام معلومات الاتصال المقدمة.
عند طلبك إنهاء حسابك، سنقوم بإلغاء تنشيط أو حذف حسابك ومعلوماتك من قواعد البيانات النشطة لدينا. ومع ذلك، قد نحتفظ ببعض المعلومات في ملفاتنا لمنع الاحتيال، وحل المشكلات، والمساعدة في أي تحقيقات، وفرض شروطنا القانونية و/أو الامتثال للمتطلبات القانونية المعمول بها.

إذا كانت لديك أسئلة أو تعليقات حول حقوقك المتعلقة بالخصوصية، يمكنك إرسال بريد إلكتروني إلينا على nightxnight007@gmail.com.

8. التحكم في ميزات عدم التتبع
تتضمن معظم متصفحات الويب وبعض أنظمة التشغيل والتطبيقات المحمولة ميزة عدم التتبع ("DNT") أو الإعداد الذي يمكنك تنشيطه للإشارة إلى تفضيلات الخصوصية الخاصة بك بعدم تتبع أنشطتك على الإنترنت ومراقبتها. في هذه المرحلة، لم يتم الانتهاء من معيار تكنولوجيا موحد للتعرف على إشارات DNT وتنفيذها. على هذا النحو، نحن لا نستجيب حاليًا لإشارات المتصفح DNT أو أي آلية أخرى تنقل تلقائيًا اختيارك بعدم التتبع عبر الإنترنت. إذا تم اعتماد معيار للتتبع عبر الإنترنت يجب أن نتبعه في المستقبل، فسنبلغك بهذه الممارسة في إصدار منقح من هذا الإشعار الخصوصي.

9. هل نقوم بتحديث هذا الإشعار؟
باختصار: نعم، سنقوم بتحديث هذا الإشعار حسب الضرورة للبقاء متوافقين مع القوانين ذات الصلة.

قد نقوم بتحديث هذا الإشعار الخصوصي من وقت لآخر. سيتم تحديد الإصدار المحدث من خلال تاريخ "تم التحديث" المحدث وسيكون الإصدار المحدث فعالاً بمجرد أن يكون متاحًا. إذا أجرينا تغييرات جوهرية على هذا الإشعار الخصوصي، فقد نعلمك إما عن طريق نشر إشعار بارز بهذه التغييرات أو عن طريق إرسال إشعار إليك مباشرة. نشجعك على مراجعة هذا الإشعار الخصوصي بشكل متكرر للبقاء على اطلاع حول كيفية حماية معلوماتك.

10. كيف يمكنك الاتصال بنا بشأن هذا الإشعار؟
إذا كانت لديك أسئلة أو تعليقات حول هذا الإشعار، يمكنك إرسال بريد إلكتروني إلينا على nightxnight007@gmail.com أو الاتصال بنا عن طريق البريد على:

Night Co.
___________
الجيزة، الهرم
مصر

11. كيف يمكنك مراجعة أو تحديث أو حذف البيانات التي نجمعها منك؟
لديك الحق في طلب الوصول إلى المعلومات الشخصية التي نجمعها منك، أو تغيير تلك المعلومات، أو حذفها. لطلب مراجعة أو تحديث أو حذف معلوماتك الشخصية، يرجى زيارة: nightxnight007@gmail.com.
''',
                        style: TextStyle(
                          fontFamily: "ElMessiri",
                          color: isDark
                              ? AppColor.ColorTextB
                              : const Color.fromARGB(255, 2, 2, 2),
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
