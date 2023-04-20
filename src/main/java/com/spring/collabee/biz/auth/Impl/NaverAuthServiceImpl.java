package com.spring.collabee.biz.auth.Impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.collabee.biz.auth.NaverAuthService;

@Service("naverAuthService")
public class NaverAuthServiceImpl implements NaverAuthService {


	@Override
	public String getNaverAccessToken(Map<String, String> callbackInfo) {
		System.out.println("getNaverAccessToken()>> 실행");
		String code = callbackInfo.get("code");
		String state = callbackInfo.get("state");
		
		String accessToken = "";
		String refreshToken = "";
		String token_type = "";
		String requestURL = "https://nid.naver.com/oauth2.0/token";

		    try {
		        URL url = new URL(requestURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		        conn.setRequestMethod("POST");
		        conn.setDoOutput(true);  

		        // POST 요청에서 필요한 파라미터를 OutputStream을 통해 전송
		        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		        String sb = "grant_type=authorization_code" +
		                "&client_id=buqjifQ22odVst5wLWTD" + 
		        		"&client_secret=LsFrG6brdf"+
		                "&redirect_uri=http://localhost:8080/collabee/member/loginWithKakao.do" + // REDIRECT_URI
		                "&code=" + code + "&state=" + state;
		        bufferedWriter.write(sb);
		        bufferedWriter.flush();

		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);

		        // 요청을 통해 얻은 데이터를 InputStreamReader을 통해 읽어 오기
		        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String line = "";
		        StringBuilder result = new StringBuilder();

		        while ((line = bufferedReader.readLine()) != null) {
		            result.append(line);
		        }
		        System.out.println("response body : " + result);
		     
		        JsonElement element = JsonParser.parseString(result.toString());
		        
		        
		        accessToken = element.getAsJsonObject().get("access_token").getAsString();
		        refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
		        token_type = element.getAsJsonObject().get("token_type").getAsString();

		        System.out.println("accessToken : " + accessToken);
		        System.out.println("refreshToken : " + refreshToken);
		        System.out.println("token_type : " + token_type);

		        bufferedReader.close();
		        bufferedWriter.close();
		    } catch (IOException e) {
		        e.printStackTrace();
		    }

		    return accessToken;	
	}

	@Override
	public HashMap<String, Object> getMeberInfo(String accessToken) {
		HashMap<String, Object> memberInfo = new HashMap<>();
		String postURL = "https://openapi.naver.com/v1/nid/me";
		
		try {
			URL url = new URL(postURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
	        conn.setDoOutput(true);
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			StringBuilder result = new StringBuilder();
			
			while ((line = bufferedReader.readLine()) != null) {
				result.append(line);
			}

	        bufferedReader.close();
			System.out.println("response body : " + result); //여기까지 실행됨
			
			JsonElement element = JsonParser.parseString(result.toString());
			//System.out.println("JsonElement element : " + element);
			JsonObject response = element.getAsJsonObject().get("response").getAsJsonObject();
			
			System.out.println("response - response body : " + response);
			
			String email = response.getAsJsonObject().get("email").getAsString();
			System.out.println("Json get Email : " + email);
			
			memberInfo.put("email", email);
			
		} catch (IOException exception) {
			exception.printStackTrace();
		}
		
		return memberInfo;
		
	}



}
