import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

public class sample {
    public static void main(String[] args) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://openapi-lib.sen.go.kr/openapi/service/lib/openApi"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=pR993xA19ngOTkIaRADWtpTD%2BtY%2BjeUuczNaruh0F9Brm0g5sNBXwJ1bZ5bmVlLRu4kdSBy8MAHmFq%2BrYdkLoQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("serviceKey","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*인증키*/
        urlBuilder.append("&" + URLEncoder.encode("title","UTF-8") + "=" + URLEncoder.encode("도둑", "UTF-8")); /*도서제목검색어 (*필수항목*)*/
        urlBuilder.append("&" + URLEncoder.encode("manageCd","UTF-8") + "=" + URLEncoder.encode("MB", "UTF-8")); /*도서관코드(*필수항목*)*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("5", "UTF-8")); /*출력건수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*출력페이지*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
    }
}