import java.util.*;

public void setup() {
	String lines[] = loadStrings("LowellHymn.txt");
	String words = new String();
	String complete = new String();
	int wordCount = 0;
	for (int i = 0; i < lines.length; i++)
	{
		words = words + lines[i] + " ";
	}
	for(int i = 0; i < words.length(); i++)
	{
		if (words.charAt(i) == ' ' || words.charAt(i) == '.' || words.charAt(i) == ',')
			i++;
		else
		{
			for (int o = i; o < words.length(); o++)
			{
				if (words.charAt(o) == ' ' || words.charAt(o) == '.' || words.charAt(o) == ',')
				{
					complete = complete + " " + pigLatin(words.substring(i, o));
					i+=(o-i);
					wordCount++;
					break;
				}
			}
		}
	}
	System.out.println("Words translated: " + wordCount);
	System.out.println(complete);
}
public void draw()
{
}
public int findFirstVowel(String word)
{
  for (int i = 0; i < word.length(); i++)
  {
    if (word.charAt(i) == 'a' || word.charAt(i) == 'e' || word.charAt(i) == 'i' || word.charAt(i) == 'o' || word.charAt(i) == 'u')
    return i;
  }
  return -1;
}
public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	else if (sWord.charAt(0) == 'a' || sWord.charAt(0) == 'e' || sWord.charAt(0) == 'i' || sWord.charAt(0) == 'o' || sWord.charAt(0) == 'u')
	{
		return sWord + "way";
	}
	else if (sWord.substring(0,2).equals("qu"))
	{
		return sWord.substring(2, sWord.length()) + "quay";
	}
	else
	{
		return sWord.substring(findFirstVowel(sWord + 1), sWord.length()) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
	}
}