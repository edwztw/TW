import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/categoria")
public class CategoriaFilmes extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Chave da API do TMDb
        String apiKey = "db2e1996e8f3cccdec769dce7aa8211d";

        // URL da API para obter a lista de categorias
        String apiUrl = "https://api.themoviedb.org/3/genre/movie/list?language=pt-BR&api_key=" + apiKey;

        try {
            // Conectar à API do TMDb
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            // Ler a resposta da API
            Scanner scanner = new Scanner(connection.getInputStream());
            StringBuilder jsonResult = new StringBuilder();
            while (scanner.hasNextLine()) {
                jsonResult.append(scanner.nextLine());
            }
            scanner.close();

            // Escrever a resposta no servlet
            out.println(jsonResult.toString());
        } catch (Exception e) {
            e.printStackTrace();
            out.println("{\"error\": \"Erro ao obter categorias\"}");
        } finally {
            out.close();
        }
    }
}
