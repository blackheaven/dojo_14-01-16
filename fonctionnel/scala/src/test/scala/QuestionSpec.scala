import org.scalatest._

class QuestionSpec extends FlatSpec with Matchers{
  it should "be correct when one good proposition checked" in {
    val questionA: Question = Question("A", List(GoodProposition("a")))
    val answersForQuestionA = List(Checked)
    questionA.correct(answersForQuestionA) should be(CorrectedQuestion("A", List(GoodProposition("a")),List(Correct)))
  }
  it should "be missed when one good proposition not checked" in {
    val questionA: Question = Question("A", List(GoodProposition("a")))
    val answersForQuestionA = List(UnChecked)
    questionA.correct(answersForQuestionA) should be(CorrectedQuestion("A", List(GoodProposition("a")),List(Missed)))
  }
  it should "be no correction when one bad proposition checked" in {
    val questionA: Question = Question("A", List(BadProposition("a")))
    val answersForQuestionA = List(UnChecked)
    questionA.correct(answersForQuestionA) should be(CorrectedQuestion("A", List(BadProposition("a")),List(NoCorrection)))
  }
}
