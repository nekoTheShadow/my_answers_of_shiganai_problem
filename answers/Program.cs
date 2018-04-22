using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine(solve());
    }

    static string solve()
    {
        string title = null;
        foreach(var n in Enumerable.Range(1, 100))
        {
            title = sample("しくてがない", 4);
            if (title == "しがない")
            {
                return $"第{n + 1}回SIerのSEからWEB系のエンジニアに転職したが楽しくて仕方がないラジオ、略して「しがないラジオ」";
            }
        }
        return $"「{title}ラジオ」ちゃうやん";
    }

    static Random random = new Random();

    static string sample(string chars, int len)
    {
        var idxs = new List<int>();
        while (idxs.Count < len)
        {
            var idx = random.Next(chars.Length);
            if (!idxs.Contains(idx))
            {
                idxs.Add(idx);
            }
        }
        return string.Join("", idxs.Select(idx => chars[idx]));
    }
}
