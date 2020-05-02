package com.swdo.gift.controller;



import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.swdo.gift.dao.MemberDAO;
import com.swdo.gift.util.AuthInfo;
import com.swdo.gift.util.NaverLoginBO;
import com.swdo.gift.util.UserMailSendService;
import com.swdo.gift.vo.Member;


@Controller
@RequestMapping(value="/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	/* GoogleLogin */
	@Inject
    private AuthInfo authInfo;
	
	@Autowired
    private GoogleOAuth2Template googleOAuth2Template;
    
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
	
    /*Kakao Login */
    private final static String K_CLIENT_ID = "e729d4032cec6c7d96f0672f736e5c0e"; 	//이런식으로 REDIRECT_URI를 써넣는다.  
    private final static String K_REDIRECT_URI = "http://localhost:8080/member/oauth";

    
     public static String getAuthorizationUrl(HttpSession session) { 
    	 String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" 
    			 + "client_id=" + K_CLIENT_ID + "&redirect_uri=" 
    			 + K_REDIRECT_URI + "&response_type=code"; 
    	 return kakaoUrl; 
    }
     
     public static JsonNode getAccessToken(String autorize_code) { 
    	 final String RequestUrl = "https://kauth.kakao.com/oauth/token"; 
    	 final ArrayList<NameValuePair> postParams = new ArrayList<NameValuePair>(); 
    	 postParams.add(new BasicNameValuePair("grant_type", "authorization_code")); 
    	 postParams.add(new BasicNameValuePair("client_id", "e729d4032cec6c7d96f0672f736e5c0e"));  //REST API KEY 
    	 postParams.add(new BasicNameValuePair("redirect_uri"
    			 , "http://localhost:8080/member/oauth")); // 리다이렉트 URI 
    	 postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값 
    	 final HttpClient client = HttpClientBuilder.create().build(); 
    	 final HttpPost post = new HttpPost(RequestUrl); 
    	 JsonNode returnNode = null; 
    	 try { 
    		 post.setEntity(new UrlEncodedFormEntity(postParams)); 
    		 final HttpResponse response = client.execute(post); 
    		 // JSON 형태 반환값 처리 
    	 	ObjectMapper mapper = new ObjectMapper(); 
    	 	returnNode = mapper.readTree(response.getEntity().getContent()); 
    	 } catch (UnsupportedEncodingException e) { 
    		 e.printStackTrace(); 
    	 } catch (ClientProtocolException e) { 
    		 e.printStackTrace(); 
    	 } catch (IOException e) { 
    		 e.printStackTrace(); 
    	 } finally { 
    		 // clear resources 
    	 } 
    	 return returnNode;
    } 

    public static JsonNode getKakaoUserInfo(JsonNode accessToken) { 
    	 final String RequestUrl = "https://kapi.kakao.com/v2/user/me"; 
    	 final HttpClient client = HttpClientBuilder.create().build(); 
    	 final HttpPost post = new HttpPost(RequestUrl);
    	 // add header 
    	 post.addHeader("Authorization", "Bearer " + accessToken); 
    	 JsonNode returnNode = null; 
    	 try { 
    		 final HttpResponse response = client.execute(post); 
    		 // JSON 형태 반환값 처리 
    		 ObjectMapper mapper = new ObjectMapper(); 
    		 returnNode = mapper.readTree(response.getEntity().getContent()); 
    	 } catch (ClientProtocolException e) { 
    		 e.printStackTrace(); 
    	 } catch (IOException e) { 
    		 e.printStackTrace(); 
    	 } finally { 
    		 // clear resources 
    	 } 
    	 return returnNode; 
    } 
     
    
    
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private UserMailSendService mailsender;

	//회원가입 폼 이동
	@RequestMapping(value="signupForm", method=RequestMethod.GET)
	public String signupForm() {
		logger.info("회원가입 페이지 이동");
		return "member/signupForm";
	}
		
	//회원가입
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public String signup(Member member, Model model, HttpServletRequest request) {
		logger.info("회원가입 ");
	
		//회원가입 메서드
		int cnt = dao.memberInsert(member);
		
		
		logger.info(Integer.toString(cnt));
		
		//회원가입 발송 이메일(인증키 발송)
		mailsender.mailSendWithUserKey(member.getMember_email(), member.getMember_id(), request);
			
		return "redirect:/member/beforeReg";
	}
	
	
	//이메일 인증 시키기
	@RequestMapping(value="beforeReg", method=RequestMethod.GET)
	public String beforeReg() {	
		logger.info("이메일 인증 요구");
		return "member/beforeReg";
	}
	
	//e-mail 인증 컨트롤러
	@RequestMapping(value="key_alter", method=RequestMethod.GET)
	public String key_alterConfirm(@RequestParam("member_id") String member_id
			,@RequestParam("member_key") String member_key ) {
		
		mailsender.alter_userKey_service(member_id, member_key);
		
		return "member/regSuccess";
	}
	
	/*
	//로그인 폼 이동
	@RequestMapping(value="loginForm", method=RequestMethod.GET)
	public String loginForm() {
		logger.info("로그인 폼 이동");
		return "member/loginForm";		
	}
	*/
	
	
	//로그인 하기
	@RequestMapping(value="login", method= RequestMethod.POST)
	public String login(Member member, HttpSession session) {
		logger.info("로그인 하기");
		
	
		int result = dao.memberLogin(member);
		
		if(result != 1) {
			logger.info("로그인 실패");			
			return "redirect:/member/loginFail";
		}
		
		logger.info("로그인 성공");
		session.setAttribute("member_id", member.getMember_id());
		return "redirect:/";
	}
	
	
	//로그인 실패
	@RequestMapping(value="loginFail", method= RequestMethod.GET)
	public String loginFail() {
		logger.info("로그인 실패 창 이동");
		return "member/loginFail";
	}
		
	//로그인 폼 이동
	@RequestMapping(value="loginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLogin(Model model, HttpSession session) {
		logger.info("로그인 폼");
	
		
		//1)네이버 로그인 		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		 String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		 
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		
		logger.info("네이버 로그인, url " + naverAuthUrl);
		model.addAttribute("naver_url", naverAuthUrl);
			
		//2)구글 로그인		
		/* 구글code 발행 */
		//URL을 생성한다.
        String url = googleOAuth2Template.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        logger.info("구글 로그인, url : " + url);
        model.addAttribute("google_url", url);
        
        //3)카카오 로그인
        String kakaoUrl = getAuthorizationUrl(session);
        logger.info("카카오 로그인, url : " +  kakaoUrl);
        model.addAttribute("kakao_url", kakaoUrl);

       
		return "member/loginForm";
	}
	
	

	//네이버 콜백
	@RequestMapping(value="callback", method={ RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) 
			throws IOException, ParseException{
		
		logger.info("여기는 콜백");	
				
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		logger.info("아이디는 {}",nickname);
		
		//response의 nickname값 파싱
		String email = (String)response_obj.get("email");
		logger.info("이메일은 {}", email);
		
		
		//4.db에 넣기
		
		//이미 아이디와 이메일이 있다면 바로 jsp로 이동시키기		
		int memberCnt = dao.socialMemberFind(email);
		if(memberCnt == 1) {
			logger.info("이미 회원 가입함");
			session.setAttribute("member_id",nickname);
			return "redirect:/member/loginForm";		
		}
		
		logger.info("회원에 없으니 회원가입 시킨다");	
		
		//랜덤 비밀번호 생성
		String tempPassword = ""; 

		for(int i=0; i<10; i++) { 
			int rndVal = (int)(Math.random() * 62); 
			if(rndVal < 10) { tempPassword += rndVal; } 
			else if(rndVal > 35) { tempPassword += (char)(rndVal + 61); } 
			else { tempPassword += (char)(rndVal + 55); 
			} 
			
		} 
		System.out.println("tempPassword : " + tempPassword);
		
		Member member = new Member() ;
		member.setMember_id("na-" + nickname);
		member.setMember_pw(tempPassword);
		member.setMember_email(email);
		member.setMember_key("Y");
		
		int cnt = dao.socialMemberInsert(member);
		logger.info(Integer.toString(cnt));	
		if(cnt == 0) {
			logger.info("회원가입 실패");
		}
		else {
			logger.info("회원가입 성공");
		}
			
		//5.파싱 닉네임 세션으로 저장
		session.setAttribute("member_id",nickname); //세션 생성
		//session.setAttribute("member_email",email); //세션 생성
		//model.addAttribute("result", apiResult);
		
		return "redirect:/member/loginForm";	
	}
	
	// 구글 Callback호출 메소드
	@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, HttpSession session, HttpServletRequest request) throws IOException {
		logger.info("여기는 구글 콜백");

        String code = request.getParameter("code");
        System.out.println(code);
        
        //RestTemplate을 사용하여 Access Token 및 profile을 요청한다.
        RestTemplate restTemplate = new RestTemplate();
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("code", code);
        parameters.add("client_id", authInfo.getClientId());
        parameters.add("client_secret", authInfo.getClientSecret());
        parameters.add("redirect_uri", googleOAuth2Parameters.getRedirectUri());
        parameters.add("grant_type", "authorization_code");
 
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(parameters, headers);
        ResponseEntity<Map> responseEntity = restTemplate.exchange("https://www.googleapis.com/oauth2/v4/token", HttpMethod.POST, requestEntity, Map.class);
        Map<String, Object> responseMap = responseEntity.getBody();
 
        // id_token 라는 키에 사용자가 정보가 존재한다.
        // 받아온 결과는 JWT (Json Web Token) 형식으로 받아온다. 콤마 단위로 끊어서 첫 번째는 현 토큰에 대한 메타 정보, 두 번째는 우리가 필요한 내용이 존재한다.
        // 세번째 부분에는 위변조를 방지하기 위한 특정 알고리즘으로 암호화되어 사이닝에 사용한다.
        //Base 64로 인코딩 되어 있으므로 디코딩한다.
 
        String[] tokens = ((String)responseMap.get("id_token")).split("\\.");
        Base64 base64 = new Base64(true);
        String body = new String(base64.decode(tokens[1]));
        
        System.out.println(tokens.length);
        System.out.println(new String(Base64.decodeBase64(tokens[0]), "utf-8"));
        System.out.println(new String(Base64.decodeBase64(tokens[1]), "utf-8"));
 
        //Jackson을 사용한 JSON을 자바 Map 형식으로 변환   
       
        ObjectMapper mapper = new ObjectMapper();
      	Map<String, String> result = mapper.readValue(body, Map.class);
      	
      	
      	//Map에서 키가 email로 된 것의 값을 추출
      	System.out.println("이메일 값 : " + result.get("email")); //email 주소를 가져온 것을 확인함
      	
      	System.out.println("이름 값 : " + result.get("name"));
      	
      	
      	//db에 있는지 확인
      	
         	
      	String member_id = result.get("name");
      	String email = result.get("email");
      	
      //이미 아이디와 이메일이 있다면 바로 jsp로 이동시키기		
      int memberCnt = dao.socialMemberFind(email);
      if(memberCnt == 1) {
      	logger.info("이미 회원 가입함");
      	session.setAttribute("member_id", member_id);
      	return "redirect:/member/loginForm";		
      }
      logger.info("회원에 없으니 회원가입 시킨다");	
      	
//      	//가져온 이메일을 활용해 db에 넣기(이메일을 자른 것을 닉네임으로 하고 이메일은 그대로 쓴다)
//        String email = result.get("email"); //받아온 메일 주소
//        
//        int idx = email.indexOf("@");		//@의 위치 파악
//        
//        String star = "";
//        for(int i = 0 ; i < (idx/2); i++) {		//@ /2 만큼의 별(*)을 찍는다.
//			star += "*";		
//		}
//         
//        String showingNickname= email.substring(0, (idx/2)) + star; //0번부터 idx/2까지 보여주고 나머지는 별(*)로 처리한다.
//        String nickname=  email.substring(0, idx); 
        
        //랜덤 비밀번호 생성
      	String tempPassword = ""; 

      	for(int i=0; i<10; i++) { 
      		int rndVal = (int)(Math.random() * 62); 
      		if(rndVal < 10) { tempPassword += rndVal; } 
      		else if(rndVal > 35) { tempPassword += (char)(rndVal + 61); } 
      		else { tempPassword += (char)(rndVal + 55); 
      		} 
      			
      	} 
      	System.out.println("tempPassword : " + tempPassword);
      		
      	Member member = new Member() ;
      	member.setMember_id("go-" + member_id);
      	member.setMember_pw(tempPassword);
      	member.setMember_email(email);
      	member.setMember_key("Y");
      		
      	int cnt = dao.socialMemberInsert(member);
      	logger.info(Integer.toString(cnt));	
      	if(cnt == 0) {
      		logger.info("회원가입 실패");
      	}
      	else {
      		logger.info("회원가입 성공");
      	}
      			
      	//파싱 닉네임 세션으로 저장
      	session.setAttribute("member_id", member_id); //세션 생성
             
		return "redirect:/member/loginForm";
	}
	
	///카카오 로그인 콜백
	@RequestMapping(value = "/oauth", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST }) 
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request
	, HttpServletResponse response, HttpSession session) throws Exception { 
		
		// 결과값을 node에 담아줌 
		JsonNode node = getAccessToken(code); 
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음 
		JsonNode accessToken = node.get("access_token"); 
		// 사용자의 정보 
		JsonNode userInfo = getKakaoUserInfo(accessToken); 
		String kemail = null; 
		String kname = null; 
		// 유저정보 카카오에서 가져오기 Get properties 
		JsonNode properties = userInfo.path("properties"); 
		JsonNode kakao_account = userInfo.path("kakao_account"); 
		kemail = kakao_account.path("email").asText(); 
		kname = properties.path("nickname").asText(); 
		System.out.println("이메일 주소는? : " + kemail);
		System.out.println("닉네임은? : " + kname);
		
		//이미 아이디와 이메일이 있다면 바로 jsp로 이동시키기		
	      int memberCnt = dao.socialMemberFind(kemail);
	      if(memberCnt == 1) {
	      	logger.info("이미 회원 가입함");
	      	session.setAttribute("member_id", kname);
	      	return "redirect:/member/loginForm";		
	      }
	      logger.info("회원에 없으니 회원가입 시킨다");	
		
		
		//랜덤 비밀번호 생성
      	String tempPassword = ""; 

      	for(int i=0; i<10; i++) { 
      		int rndVal = (int)(Math.random() * 62); 
      		if(rndVal < 10) { tempPassword += rndVal; } 
      		else if(rndVal > 35) { tempPassword += (char)(rndVal + 61); } 
      		else { tempPassword += (char)(rndVal + 55); 
      		}  			
      	} 
      	System.out.println("tempPassword : " + tempPassword);
		
      	//보여줄 닉네임 수정(* 활용)
      	int idx = kname.length(); //닉네임 길이
      	System.out.println("닉네임의 길이는 : " + idx);
            	
      	int endNum = 0;
            	
      	if(idx % 2 == 0) {
      		endNum = idx / 2;
      	}
      	else {
      		endNum = idx / 2 ;
      	}
      	System.out.println("*앞까지의 숫자는? : " + endNum);
            	
      	String star = "";
      	for(int i = 0 ; i < endNum; i++) {	
      		star += "*";		
      	}     	
              
      	String showingNickname = kname.substring(0, idx - endNum) + star;
      	System.out.println("보여줄 닉네임 : " + showingNickname);
      	
      	
		Member member = new Member();
		member.setMember_email(kemail);
		member.setMember_id("ka-" + kname);
		member.setMember_pw(tempPassword);
		member.setMember_key("Y");
		
		int cnt = dao.socialMemberInsert(member);
      	logger.info(Integer.toString(cnt));	
      	if(cnt == 0) {
      		logger.info("회원가입 실패");
      	}
      	else {
      		logger.info("회원가입 성공");
      	}
			
		session.setAttribute("member_id", showingNickname); 
		
	
		return "redirect:/member/loginForm"; 
	}

	
	
	//로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("로그아웃 하기");
		session.removeAttribute("member_id");
		return "redirect:/";		
	}	
	
	
	//아이디 찾기 이동
	@RequestMapping(value="idFinder", method =RequestMethod.GET)	
	public String idFinder() {
		logger.info("아이디 찾기로 이동");	
		return "member/idFinder";
	}
	
	//아이디 찾기
	@RequestMapping(value="idFind", method=RequestMethod.POST)	
	public String idFind(String member_email, HttpSession session) {
		logger.info("아이디 찾기");
		
		ArrayList<Member> list = dao.memberIdFind(member_email);
		System.out.println("가져온 리스트는 : " +  list);
		
		if(list.isEmpty()) {
			logger.info("가입한 아이디가 존재하지 않음");
			session.setAttribute("msg2", "fail");
			return "redirect:/member/idFindResult";
		}
		
		logger.info("가입한 아이디가 존재함");
		System.out.println("가입한 아이디는 : " + list);
		
		session.setAttribute("msg2", list);
	
		return "redirect:/member/idFindResult";
	}
	
	@RequestMapping(value="idFindResult", method = RequestMethod.GET)
	public String idFindResult() {
		logger.info("아이디 찾기 결과로 이동");
		return "member/idFindResult";
	}
	
	
	//비밀번호 찾기 이동
	@RequestMapping(value="pwFinder", method =RequestMethod.GET)	
	public String pwFinder() {
		logger.info("비밀번호 찾기로 이동");	
		return "member/pwFinder";
	}
	
	//비밀번호 찾기
	@RequestMapping(value="pwFind", method=RequestMethod.POST)
	public String pwFind(String member_id, String member_email
			, HttpSession session, HttpServletRequest request) {
		logger.info("비밀번호 찾기");
		
		Member member = new Member();
		member.setMember_id(member_id);
		member.setMember_email(member_email);
		
		int cnt = dao.emailAuthCheck(member);
		System.out.println(cnt);
		if(cnt == 0) {
			logger.info("이메일 인증이 된 아이디가 아닙니다.");
			
			//이메일 인증이 안됐다는 것을 jsp에서 알려준다.
			session.setAttribute("msg3", "fail");
			return "redirect:/member/pwFindResult";
		}
		
		logger.info("이메일 인증이 된 아이디입니다.");
		mailsender.mailSendWithPassword(member_id, member_email, request);
			
		
		return "redirect:/member/pwFindResult";
	}
	
	@RequestMapping(value="pwFindResult", method = RequestMethod.GET)
	public String pwFindResult() {
		logger.info("비밀번호 찾기 결과로 이동");
		return "member/pwFindResult";
	}
	
	@RequestMapping(value="myPage", method = RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {
		logger.info("마이 페이지 이동");
		
		String member_id = (String)session.getAttribute("member_id");
		Member member = dao.memberInfoById(member_id);
		model.addAttribute("info", member);
		
		return "member/myPage";
	}
	
	@RequestMapping(value="pwUpdate", method = RequestMethod.POST)
	public String pwUpdate(Member member, HttpSession session) {
		logger.info("비밀번호 변경");
			
		int cnt = dao.pwUpdate(member);
		if(cnt == 0) {
			logger.info("비밀번호 업데이트 실패");
			session.setAttribute("msg4", "fail");
			return "redirect:/member/pwUpdateResult";
		}
		else {	
			logger.info("비밀번호 업데이트 성공");
			session.setAttribute("msg4", "success");
		}
		return "redirect:/member/pwUpdateResult";
	}
	
	@RequestMapping(value="pwUpdateResult", method = RequestMethod.GET)
	public String pwUpdateResult() {
		logger.info("비밀번호 수정 결과");
		return "member/pwUpdateResult";
	}
	
	
	@RequestMapping(value="deleteMemberForm", method = RequestMethod.GET)
	public String deleteMemberForm(Model model, HttpSession session) {
		logger.info("회원 탈퇴 폼 이동");
		
		//session.removeAttribute("deleteFail");
		
		//String member_id = (String)session.getAttribute("member_id");
		//model.addAttribute("info", member_id);
		return "member/deleteMemberForm";
	}
	
	@RequestMapping(value="deleteMember", method = RequestMethod.POST)
	public String deleteMember(Member member, HttpSession session, Model model){
		logger.info("회원 탈퇴");
		
		
		int cnt = dao.memberDeletion(member);
		if(cnt == 0) {
			logger.info("회원 탈퇴 실패");
			return "redirect:/member/deleteMemberFail";
		}
		logger.info("회원 탈퇴 성공");
		
		session.removeAttribute("member_id");
			
		return "redirect:/";
	}
	
	@RequestMapping(value="deleteMemberFail", method = RequestMethod.GET)
	public String deleteMemberFail() {
		logger.info("회원 탈퇴 실패 창 이동");
		return "member/deleteMemberFail";
	}
	
	@RequestMapping(value="about", method = RequestMethod.GET)
	public String about() {
		logger.info("Gifter 소개");
		return "member/about";
	}
}
