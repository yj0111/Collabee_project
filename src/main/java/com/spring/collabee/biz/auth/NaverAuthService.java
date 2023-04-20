package com.spring.collabee.biz.auth;

import java.util.HashMap;
import java.util.Map;

public interface NaverAuthService {
	String getNaverAccessToken(Map<String, String> callbackInfo);
	HashMap<String, Object> getMeberInfo(String token);

}
