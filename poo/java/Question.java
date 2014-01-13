class Question
{
    private String title;
    private answer.Answer[] answers;

    public Question(String title, answer.Answer[] answers)
    {
        this.title = title;
        this.answers = answers;
    }

    public int size()
    {
        return this.answers.length;
    }

    public answer.Answer getAnswer(int i)
    {
        return this.answers[i];
    }

    public Question setChoice(int i, Boolean v)
    {
        this.answers[i].setChoice(v);
        return this;
    }

    public Boolean isCorrect()
    {
        for (answer.Answer a : this.answers)
        {
            if (!a.isCorrect())
                return false;
        }
        return true;
    }
}
