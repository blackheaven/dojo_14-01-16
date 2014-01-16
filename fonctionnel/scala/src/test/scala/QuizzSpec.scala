import org.scalatest._

class QuizzSpec extends FlatSpec with Matchers {

  behavior of "An incomplete Quizz"

  it should "have at least one question" in {
    a [IllegalArgumentException] should be thrownBy {
      IncompleteQuizz(Nil)
    }
  }

  it should "know the next question to answer" in {
    val question: Question = Question("title", List(GoodProposition("1")))
    val quizz = IncompleteQuizz(List(question))
    quizz.nextQuestion should be(question)
  }
  it should "not be completed" in {
    val question: Question = Question("title", List(GoodProposition("1")))
    val quizz = IncompleteQuizz(List(question))
    quizz.isCompleted shouldBe false
  }
  it should "be completed if last question is answered" in {
    val question: Question = Question("title", List(GoodProposition("1")))
    val quizz = IncompleteQuizz(List(question)).answerQuestion(List(Checked))
    quizz.isCompleted shouldBe true
  }
}
