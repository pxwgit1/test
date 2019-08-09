import java.io.IOException;
import java.util.Scanner;

public class RecursionTest {
	@SuppressWarnings("resource")
	public static void main(String[] args) throws IOException{
		System.out.println("输入一个数字");
		Scanner into = new Scanner(System.in);
		int number = into.nextInt();
		System.out.println(number +" 阶乘是"+ function(number));
	}

	private static int function(int number) throws IOException{
		int result=0;
		if (number < 0) {
			throw new IOException("number not needed");
		}
		else if(number == 0 || number ==1) {
			result = 1;
		}
		else if (number > 1) {
			result = number * function(number - 1);
		}
		return result;
	}

}
