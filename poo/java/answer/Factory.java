package answer;

public class Factory
{
    public Answer create(String title, Boolean correct)
    {
        if (correct)
            return new Good(title);
        else
            return new Bad(title);
    }
}
