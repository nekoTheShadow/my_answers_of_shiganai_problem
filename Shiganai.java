import java.util.Arrays;
import java.util.Collections;

public class Shiganai {
	public static void main(String[] args) {
		var answer = solve();
		System.out.println(answer);
	}
	
	
	public static String solve() {
		var chars = Arrays.asList("しくてがない".split(""));
		String title = null;
		for (int n = 0; n < 100; n++) {
			Collections.shuffle(chars);
			
			title = String.join("", chars.subList(0, 4));
			if (title.equals("しがない")) {
				return String.format("第%d回SIerのSEからWEB系のエンジニアに転職したが楽しくて仕方がないラジオ、略して「しがないラジオ」", n + 1);
			}
		}
		return String.format("「%sラジオ」ちゃうやん", title);
	}
}
