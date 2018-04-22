import java.util.Arrays;
import java.util.Collections;

public class Shiganai {
	public static void main(String[] args) {
		var answer = solve();
		System.out.println(answer);
	}
	
	
	public static String solve() {
		var chars = Arrays.asList("�����Ă��Ȃ�".split(""));
		String title = null;
		for (int n = 0; n < 100; n++) {
			Collections.shuffle(chars);
			
			title = String.join("", chars.subList(0, 4));
			if (title.equals("�����Ȃ�")) {
				return String.format("��%d��SIer��SE����WEB�n�̃G���W�j�A�ɓ]�E�������y�����Ďd�����Ȃ����W�I�A�����āu�����Ȃ����W�I�v", n + 1);
			}
		}
		return String.format("�u%s���W�I�v���Ⴄ���", title);
	}
}
