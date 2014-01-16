sealed trait Answer
case object Checked extends Answer
case object UnChecked extends Answer

sealed trait Proposition{
  val value:String
  def check(answer:Answer):Correction
}

case class GoodProposition(value:String) extends Proposition{
  def check(answer: Answer):Correction = answer match {
    case Checked   => Correct
    case UnChecked => Missed
  }
}

case class BadProposition(value:String) extends Proposition{
  def check(answer: Answer):Correction = answer match {
    case Checked   => Incorrect
    case UnChecked => NoCorrection
  }
}

sealed trait Correction
case object Correct extends Correction
case object Incorrect extends Correction
case object Missed extends Correction
case object NoCorrection extends Correction

case class Question(title:String, propositions:List[Proposition]){
  def correct(answers:List[Answer]):CorrectedQuestion={
    val corrections  = propositions zip answers map{ case (prop, answer) => prop.check(answer)}
    CorrectedQuestion(title, propositions, corrections)
  }
}
case class CorrectedQuestion(title:String, propositions:List[Proposition], corrections:List[Correction])

sealed trait Quizz{
  def nextQuestion:Question
  def answerQuestion(answers:List[Answer]):Quizz
  def isCompleted:Boolean
  def corrections:List[CorrectedQuestion]
}

case class IncompleteQuizz(questions:List[Question], corrections:List[CorrectedQuestion] = Nil) extends Quizz{
  require(!questions.isEmpty)
  def nextQuestion=questions.head
  def answerQuestion(answers:List[Answer])= {
    if(questions.tail.isEmpty) CompletedQuizz(questions.head.correct(answers) :: corrections)
    else copy(questions.tail, questions.head.correct(answers) :: corrections)
  }
  def isCompleted=false
}
case class CompletedQuizz(corrections:List[CorrectedQuestion]) extends Quizz{
  def nextQuestion:Question = throw new NoSuchElementException()
  def answerQuestion(answers:List[Answer]):Quizz=  throw new UnsupportedOperationException()
  def isCompleted=true
}
