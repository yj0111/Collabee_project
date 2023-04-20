package com.spring.collabee.biz.auth.Impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.collabee.biz.auth.KakaoAuthService;

@Service("kakaoAuthService")
public class KakaoAuthServiceImpl implements KakaoAuthService {
	
	public void kakaoAuthServiceImpl() {
		 System.out.println("kakaoAuthServicenImpl()실행");
	}
	
	@Override
	public String getKakaoAccessToken(String code) {
		System.out.println("getKakaoAccessToken()>> 실행");
		String accessToken = "";
		String refreshToken = "";
		String requestURL = "https://kauth.kakao.com/oauth/token";

		    try {
		        URL url = new URL(requestURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		        conn.setRequestMethod("POST");
		        // setDoOutput()은 OutputStream으로 POST 데이터를 넘겨 주겠다는 옵션이다.
		        // POST 요청을 수행하려면 setDoOutput()을 true로 설정한다.
		        conn.setDoOutput(true);

		        // POST 요청에서 필요한 파라미터를 OutputStream을 통해 전송
		        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		        String sb = "grant_type=authorization_code" +
		                "&client_id=1de1359a671db7dcbf8be4aa691ce92d" + // REST_API_KEY
		                "&redirect_uri=http://localhost:8080/collabee/member/loginWithKakao.do" + // REDIRECT_URI
		                "&code=" + code;
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

		        System.out.println("accessToken : " + accessToken);
		        System.out.println("refreshToken : " + refreshToken);

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
		String postURL = "https://kapi.kakao.com/v2/user/me";
		
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
			JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String email = kakaoAccount.getAsJsonObject().get("email").getAsString();
			System.out.println("Json get Email : " + email);
			
			memberInfo.put("email", email);
			
		} catch (IOException exception) {
			exception.printStackTrace();
		}
		
		return memberInfo;
		
	}

	/*
	@Override
	public void kakaoLogout(String accessToken) {
		System.out.println("kakoLogout accessToken : >>" + accessToken);
		String getURL = "https://kauth.kakao.com/oauth/logout?" +
						"client_id=1de1359a671db7dcbf8be4aa691ce92d"+ //YOUR_REST_API_KEY
						"&logout_redirect_uri=http://localhost:8080/collabee/member/logout.do" ;
		System.out.println("getURL : " + getURL);
		try {
			URL url = new URL(getURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setDoInput(true);
			conn.setDoOutput(true);
			
			int responseCode = conn.getResponseCode();
			System.out.println("kakaoLogout) responseCode : " + responseCode);
				
				if(responseCode ==conn.HTTP_OK) {
					BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					String line = "";
					StringBuilder result = new StringBuilder();	
	
			        while ((line = bufferedReader.readLine()) != null) {
			            result.append(line);
			        }
			        bufferedReader.close();
			        System.out.println("response body : " + result); //여기까지 실행됨
				}
			
			} catch (IOException exception) {
				exception.printStackTrace();
	
			}
		
	}
	*/
/*
	@Override
	public boolean kakaoLogout(String accessToken) {
		
		String postURL = "https://kapi.kakao.com/v1/user/logout";
		
		try {
			URL url = new URL(postURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			int responseCode = conn.getResponseCode();
			System.out.println("kakaoLogout) responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			StringBuilder result = new StringBuilder();
			
			while ((line = br.readLine()) != null) {
				result.append(line);
			}
			System.out.println("response body : " + result); //여기까지 실행됨
			
			JsonElement element = JsonParser.parseString(result.toString());
			System.out.println("JsonElement element : " + element);
			String id = element.getAsJsonObject().get("id").getAsString();
			
			return true;
			
		} catch (IOException exception) {
			exception.printStackTrace();
			return false;
		}
		
	}
*/

}