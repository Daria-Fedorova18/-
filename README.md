$1 - входная директория
'NumberProcessorTest'
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;

public class NumberProcessor {

    private int[] numbers;

    public NumberProcessor(String filePath) throws IOException {
        String content = new String(Files.readAllBytes(Paths.get(filePath)));
        this.numbers = Arrays.stream(content.split(" "))
                             .mapToInt(Integer::parseInt)
                             .toArray();
    }

    public int _min() {
        return Arrays.stream(numbers).min().orElseThrow();
    }

    public int _max() {
        return Arrays.stream(numbers).max().orElseThrow();
    }

    public int _sum() {
        return Arrays.stream(numbers).sum();
    }

    public long _mult() {
        return Arrays.stream(numbers)
                     .mapToLong(i -> i)
                     .reduce(1, (a, b) -> a * b);
    }

    public static void main(String[] args) throws IOException {
        if (args.length != 1) {
            System.err.println("Usage: java NumberProcessor <file_path>");
            System.exit(1);
        }

        NumberProcessor np = new NumberProcessor(args[0]);

        System.out.println("Минимальное: " + np._min());
        System.out.println("Максимальное: " + np._max());
        System.out.println("Сумма: " + np._sum());
        System.out.println("Произведение: " + np._mult());
    }
}

'NumberProcessorTest'
import org.junit.jupiter.api.Test;
import java.io.IOException;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class NumberProcessorTest {

    @Test
    public void testMin() throws IOException {
        NumberProcessor np = new NumberProcessor("test1.txt");
        assertEquals(1, np._min());
    }

    @Test
    public void testMax() throws IOException {
        NumberProcessor np = new NumberProcessor("test1.txt");
        assertEquals(4, np._max());
    }

    @Test
    public void testSum() throws IOException {
        NumberProcessor np = new NumberProcessor("test1.txt");
        assertEquals(10, np._sum());
    }

    @Test
    public void testMult() throws IOException {
        NumberProcessor np = new NumberProcessor("test1.txt");
        assertEquals(24, np._mult());
    }

    @Test
    public void testPerformance() throws IOException {
        NumberProcessor np = new NumberProcessor("large_test.txt");
        long startTime = System.currentTimeMillis();
        np._min();
        np._max();
        np._sum();
        np._mult();
        long endTime = System.currentTimeMillis();
        long duration = endTime - startTime;
        System.out.println("Performance test duration: " + duration + " ms");
    }
}

#
$2 - выходная директория
