package com.library;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class booksc {
	 // tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
	
	public static void calc(HttpServletRequest request, HttpServletRequest request2) throws IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("search");	
		String library = request.getParameter("library");
		int page = 2;	// 페이지 초기값 
		try{
				// parsing할 url 지정(API 키 포함해서)
				StringBuilder urlBuilder = new StringBuilder("http://openapi-lib.sen.go.kr/openapi/service/lib/openApi"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=pR993xA19ngOTkIaRADWtpTD%2BtY%2BjeUuczNaruh0F9Brm0g5sNBXwJ1bZ5bmVlLRu4kdSBy8MAHmFq%2BrYdkLoQ%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("serviceKey","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*����Ű*/
		        urlBuilder.append("&" + URLEncoder.encode("title","UTF-8") + "=" + URLEncoder.encode(title, "UTF-8")); /*��������˻��� (*�ʼ��׸�*)*/
		        urlBuilder.append("&" + URLEncoder.encode("manageCd","UTF-8") + "=" + URLEncoder.encode(library, "UTF-8")); /*�������ڵ�(*�ʼ��׸�*)*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("5", "UTF-8")); /*��°Ǽ�*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*출력페이지*/
		        
		        String url = urlBuilder + "";
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
		        
				// root tag 
				doc.getDocumentElement().normalize();
				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
				
				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("item");
				System.out.println("파싱할 리스트 수 : "+ nList.getLength());
				ArrayList<Book> book = new ArrayList<Book>();	
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){						
						Element eElement = (Element) nNode;	
						String booktitle = getTagValue("title", eElement);
						String author = getTagValue("author", eElement);
						String libname = getTagValue("libName", eElement);
						String callno = getTagValue("callNo", eElement);
						String publisher = getTagValue("publisher", eElement);
						String pubyear = getTagValue("pubYear", eElement);
						book.add(new Book(booktitle,author,libname,callno,publisher,pubyear));
					}	// for end
				}	// if end				
				request.setAttribute("book", book);	
			
		} catch (Exception e){	
			e.printStackTrace();
		}	// try~catch end
	}	// main end
}	// class end