import static spark.Spark.*;

public class Main {
    public static void main(String[] args) {

        port(8081);

        get("/", (req, res) -> "Hello, Student! Application running on port 8081");

    }
}
