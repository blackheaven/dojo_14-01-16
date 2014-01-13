package answer;

class Bad extends Answer
{
    public Bad(String title)
    {
        super(title);
    }

    public Boolean isCorrect()
    {
        return !this.getChoice();
    }
}
