package answer;

public abstract class Answer
{
    private String title;
    private Boolean choice;

    public Answer(String t)
    {
        this.title = t;
        this.choice = false;
    }

    public String getTitle()
    {
        return this.title;
    }

    public Boolean getChoice()
    {
        return this.choice;
    }

    public Answer setChoice(Boolean c)
    {
        this.choice = c;
        return this;
    }

    abstract public Boolean isCorrect();
}
