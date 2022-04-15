package popularbook;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

//	448ea4a7048c6523b3dc548a3654f3e0
public class popular {
	public static void main(String[] args) throws IOException {
        try {
        	String urlStr = "http://openapi.seoul.go.kr:8088/46786e675162696e32396b64634d76/json/SeoulLibraryBookRentNumInfo/1/5/"; /*URL*/
            
            URL url = new URL(urlStr);
            
            String line = "";
            String result = "";
            
            BufferedReader br;
            br = new BufferedReader(new InputStreamReader(url.openStream()));
            while ((line = br.readLine()) != null) {
                result = result.concat(line);
                //System.out.println(line);                
            }            
            
            // JSON parser 만들어 문자열 데이터를 객체화한다.
            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject)parser.parse(result);
            
            // list 아래가 배열형태로
            // {"list" : [ {"returnType":"json","clearDate":"--",.......} ] 
            JSONObject library = (JSONObject)obj.get("SeoulLibraryBookRentNumInfo");
            JSONArray row = (JSONArray) library.get("row");
            
            // 객체형태로
            // {"returnType":"json","clearDate":"--",.......},... 
            ArrayList<PB> pb=new ArrayList<PB>();
            for (int i=0;i<3;i++) {
                JSONObject book = (JSONObject) row.get(i);
                String title = (String) book.get("TITLE");            // 발령날짜
                String author = (String) book.get("AUTHOR");    // 발령지역
                
                StringBuffer sb = new StringBuffer();
                sb.append("제목-> " + title + "\n저자-> " + author);
                System.out.println(sb.toString());  
                pb.add(new PB(title,author));
            }
            
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	public static void show(HttpServletRequest request) {
		try {
        	String urlStr = "http://openapi.seoul.go.kr:8088/46786e675162696e32396b64634d76/json/SeoulLibraryBookRentNumInfo/1/5/"; /*URL*/
            
            URL url = new URL(urlStr);
            
            String line = "";
            String result = "";
            
            BufferedReader br;
            br = new BufferedReader(new InputStreamReader(url.openStream()));
            while ((line = br.readLine()) != null) {
                result = result.concat(line);
                //System.out.println(line);                
            }            
            
            // JSON parser 만들어 문자열 데이터를 객체화한다.
            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject)parser.parse(result);
            
            // list 아래가 배열형태로
            // {"list" : [ {"returnType":"json","clearDate":"--",.......} ] 
            JSONObject library = (JSONObject)obj.get("SeoulLibraryBookRentNumInfo");
            JSONArray row = (JSONArray) library.get("row");
            
            // 객체형태로
            // {"returnType":"json","clearDate":"--",.......},... 
            ArrayList<PB> pb=new ArrayList<PB>();
            for (int i=0;i<3;i++) {
                JSONObject book = (JSONObject) row.get(i);
                String title = (String) book.get("TITLE");            // 발령날짜
                String author = (String) book.get("AUTHOR");    // 발령지역
                
                StringBuffer sb = new StringBuffer();
                sb.append("제목-> " + title + "\n저자-> " + author);
                System.out.println(sb.toString());  
                pb.add(new PB(title,author));
            }
            request.setAttribute("pb", pb);
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}


}
