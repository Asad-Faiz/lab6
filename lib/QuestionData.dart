// ignore: file_names
import 'Questions.dart';
class QuizBrain{
  // ignore: non_constant_identifier_names
  //ecan
  int _QuestionNumber=0;
  //
  final List <Questions> _questionBank=[
    Questions('Vitamin C is also known by the chemical name of Ascorbic Acid ', true),
    Questions(' Glass is manufactured mainly from processed sand', true),
    Questions('The liver is the largest organ in the human body', false),
    Questions('Evita Perón was the first female president of Argentina', false),
    Questions('Mount Fuji is the highest mountain in Japan', true),
    Questions('Put together, a human’s body blood vessels can circle the Earth', true),
    Questions('The planet Venus has 20 moons', false),
    Questions('Electrons move faster than the speed of light.', false),
    Questions('A credit card and a debit card are the same.', false),
    Questions('There is no river in Saudi Arabia.', true),
  ];

  //ignore:
   void nextQuestions(){
       if(_QuestionNumber<_questionBank.length-1){
          _QuestionNumber++;
       }
   }

  // ignore: non_constant_identifier_names
  String GetQuestions(){
    return _questionBank[_QuestionNumber].QuestionString;
  }

  // ignore: non_constant_identifier_names
  bool CorrectAnswer(){
      return _questionBank[_QuestionNumber].AnswerText;
  }

  bool isFinished() {
    if (_QuestionNumber >=_questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }


  void reset() {
    _QuestionNumber = 0;
  }

}