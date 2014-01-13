package answer;

class Good extends Answer
{
    public Good(String title)
    {
        super(title);
    }

    public Boolean isCorrect()
    {
        return this.getChoice();
    }
}
