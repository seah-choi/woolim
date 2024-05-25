package org.fullstack4.woolim.common;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import org.json.JSONObject;
public class GoogleOAuth2Helper {
    private static final String CLIENT_ID = "407108558562-l8kdc02drjtq9qe6id97a5bm4gfubfvb.apps.googleusercontent.com";
    private static final String CLIENT_SECRET = "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";
    private static final String REDIRECT_URI = "http://localhost:8080/login/oauth2/callback";

    public String getAccessToken(String authorizationCode) throws Exception {
        String parameters = "code=" + authorizationCode +
                "&client_id=" + CLIENT_ID +
                "&client_secret=" + CLIENT_SECRET +
                "&redirect_uri=" + REDIRECT_URI +
                "&grant_type=authorization_code";

        URL url = new URL("https://oauth2.googleapis.com/token");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

        try (OutputStream os = conn.getOutputStream()) {
            os.write(parameters.getBytes(StandardCharsets.UTF_8));
        }

        StringBuilder response = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line.trim());
            }
        }

        JSONObject jsonObject = new JSONObject(response.toString());
        return jsonObject.getString("access_token");
    }

    public JSONObject getUserInfo(String accessToken) throws Exception {
        URL url = new URL("https://www.googleapis.com/oauth2/v2/userinfo?access_token=" + accessToken);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        StringBuilder response = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line.trim());
            }
        }

        return new JSONObject(response.toString());
    }
}
