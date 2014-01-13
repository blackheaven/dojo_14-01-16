class Form
{
    private Question[] questions;

    public Form(Question[] q)
    {
        this.questions = q;
    }

    public int size()
    {
        return this.questions.length;
    }

    public Question getQuestion(int i)
    {
        return this.questions[i];
    }
}
