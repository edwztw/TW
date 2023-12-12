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

@WebServlet("/lista")
public class ListaFilmes extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            // Chave da API do TMDb
            String apiKey = "db2e1996e8f3cccdec769dce7aa8211d";

            // URL para obter informações sobre filmes populares
            String popularMoviesUrl = "https://api.themoviedb.org/3/movie/now_playing?language=pt-BR&api_key=" + apiKey;

            // Obter dados do filme mais popular
            String popularMoviesJson = getApiResponse(popularMoviesUrl);
            out.println(popularMoviesJson);

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.println("{ \"error\": \"" + e.getMessage() + "\" }");
        }
    }

    private String getApiResponse(String apiUrl) throws IOException {
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        // Configurar método GET
        connection.setRequestMethod("GET");

        // Obter a resposta
        int responseCode = connection.getResponseCode();

        if (responseCode == HttpURLConnection.HTTP_OK) {
            // Ler a resposta
            Scanner scanner = new Scanner(connection.getInputStream());
            StringBuilder response = new StringBuilder();
            while (scanner.hasNextLine()) {
                response.append(scanner.nextLine());
            }
            scanner.close();

            return response.toString();
        } else {
            throw new IOException("Falha na solicitação da API. Código de resposta: " + responseCode);
        }
    }
}
