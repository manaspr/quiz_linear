import 'package:flutter/material.dart';

void main() {
  runApp(const LinearQuiz());
}

class LinearQuiz extends StatelessWidget {
  const LinearQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: const Text('কুইজ'),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'ভারতের প্রথম ওডিআই (ক্রিকেট) অনুষ্ঠিত হয় আহমেদাবাদে।',
    'গোয়া নারকেল উৎপাদন না করার জন্য বিখ্যাত।',
    'পোলোর উৎপত্তি আসামে।',
    'খালসা 1699 সালে জন্মগ্রহণ করেন।',
    'লতা মঙ্গেশকর 1960 সালে পদ্মভূষণ জিতেছিলেন।',
    'শেক্সপিয়ার 37টি নাটক লিখেছেন।',
    'প্রথম ওডিআই ভারতীয় দলের প্রথম অধিনায়ক ছিলেন সুনীল গাভাস্কার।',
    'বেসবলের উৎপত্তি অস্ট্রেলিয়ায়।',
    'আইস হকিতে ফাউল বোঝাতে লাল এবং সবুজ বাতি ব্যবহার করা হয়।',
    'উটপাখির চোখ তার মস্তিষ্কের চেয়ে ছোট।',
    'উদ্ভিদ বায়ুমণ্ডল থেকে অক্সিজেন পর্যবেক্ষণ করে।',
    'ভারতের অপেশাদার অ্যাথলেটিক্স ফেডারেশন 1946 সালে প্রতিষ্ঠিত হয়েছিল।',
    'রামায়ণ রচনা করেছিলেন তুলসীদাস।',
    'নক্ষত্র সংখ্যায় ২৭টি।',
    'পশ্চিমবঙ্গের সুন্দরবন হাতির জন্য বিখ্যাত।',
    'বৈদিক জ্যোতিষশাস্ত্র সৌরজগতের উপর নির্ভর করে।',
    'সাবির ভাটিয়া হটমেইলের সহ-প্রতিষ্ঠাতা ছিলেন।',
    'কাশ্মীরের উলার হ্রদ ভারতের বৃহত্তম মিঠা পানির হ্রদ।',
    'শব্দ তরঙ্গ আলোর চেয়ে দ্রুত ভ্রমণ করে।',
  ];
  void questionIndexUp() {
    if (questionNumber < questions.length - 1) {
      questionNumber++;
    } else {
      questions.add('💓 ধন্যবাদ। পুনরায় শুরু করতে রিসেট বাটন চাপুন। 💓');
    }
  }

  int questionNumber = 0;
  List<bool> answers = [
    true,
    true,
    false,
    true,
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    true,
    false,
    true,
    false,
    false,
    true,
    true,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              child: const Text(
                'সত্য',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer = answers[questionNumber];
                setState(() {
                  if (correctAnswer == true) {
                    scoreKeeper.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scoreKeeper.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  }
                  questionIndexUp();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
                color: Colors.red,
                child: const Text(
                  'মিথ্যা',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  bool correctAnswer = answers[questionNumber];
                  setState(() {
                    if (correctAnswer == false) {
                      scoreKeeper.add(const Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    } else {
                      scoreKeeper.add(const Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    questionIndexUp();
                  });
                }),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: FlatButton(
                  color: Colors.blue,
                  child: const Icon(
                    Icons.restore,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      questionNumber = 0;
                      scoreKeeper = [];
                    });
                  }),
            ),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}
