import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) {

        // First level: Дан файл действительных чисел и два числа a и b.
        // Используя очередь (несколько очередей) напечатать сначала все элементы,
        // меньшие a; потом все элементы из отрезка [a, b]; потом все элементы, большие b.
        int[] data = new int[100];
        for (int i = 0; i < data.length; i++) {
            data[i] = (int) (200 * Math.random() - 100);
            System.out.print(data[i] + " ");
        }
        System.out.println();
        System.out.println();
        // Начинает работать алгоритм
        Queue queue1 = new Queue();
        Queue queue2 = new Queue();
        int a = -20;
        int b = 30;

        for (int i = 0; i < data.length; i++) {
            if (data[i] < a) {
                System.out.print(data[i] + " ");
            } else if (data[i] >= a && data[i] <= b) {
                queue1.add(data[i]);
            } else {
                // > b
                queue2.add(data[i]);
            }
        }
        System.out.println();
        while (!queue1.isEmpty()) {
            System.out.print(queue1.delete() + " ");
        }

    }
}