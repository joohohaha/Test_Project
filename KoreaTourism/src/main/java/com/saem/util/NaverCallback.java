package com.saem.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.saem.domain.MemberVO;

public class NaverCallback {
	public String CallBack(String code, String state) throws Exception {
		String clientId = "xHnGDEiESs7O3i28j1Wl";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "QvwIWephMB";//애플리케이션 클라이언트 시크릿값";
	    String redirectURI = URLEncoder.encode("http://192.168.0.58:8000/tour/naver_login", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    //String refresh_token = "";
	    System.out.println("apiURL="+apiURL);
	    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      System.out.println("responseCode="+responseCode);
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
			    	JSONParser parser = new JSONParser();
					JSONObject jsonData = (JSONObject)parser.parse(res.toString());
					access_token = jsonData.get("access_token").toString();

			    	return access_token;
		      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
	    return null;
	}
}
