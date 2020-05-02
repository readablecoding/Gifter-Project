package com.swdo.gift.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class SeleniumCrawling {
	
	//WebDriver
    private WebDriver driver;
    
    //Properties
    public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = "C:\\chromedriver.exe";
    
    //크롤링 할 URL
    private String base_url;
    private String re_url;
    
    //크롤링 값 담을 변수 선언
    private ArrayList<String> srcs; // 상품이미지
    private Elements title;			// 상품이름 + 상품링크
    private List<WebElement> price;	// 상품가격
    
    //jsp로 옮겨 담을 변수
    HashMap<String, Object> map = new HashMap<>();
    
    public SeleniumCrawling() {
        super();
 
        //System Property SetUp
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
        
        //Driver SetUp
        ChromeOptions option = new ChromeOptions();
        option.addArguments("headless");
        option.addArguments("disable-gpu");
        option.setPageLoadStrategy(PageLoadStrategy.NORMAL);
        
        driver = new ChromeDriver(option);
       
        
    }

    public HashMap<String, Object> crawl(String age_range, String gender, String categoryName) {
        try {
        	// 쇼핑페이지 접근
        	base_url = "https://shopping.naver.com/";
        	driver.get(base_url);
        	String searchText = age_range + " " +gender+ " " + categoryName;
        	driver.findElement(By.name("query")).click();
            driver.findElement(By.name("query")).sendKeys(searchText);
            driver.findElement(By.name("query")).sendKeys(Keys.ENTER);
            
            // 스크롤 이동
            for (int i = 0; i < 15; i++) {
            	Thread.sleep(100);
                JavascriptExecutor jsx = (JavascriptExecutor)driver;
                jsx.executeScript("window.scrollBy(0,1000)","");
                
            }
            
            // 이미지 크롤링
         	List<WebElement> el = driver.findElements(By.className("_productLazyImg"));
         	// 이미지 값 담을 변수 준비
            srcs = new ArrayList<String>();
                     
            for(int i = 0; i < el.size(); i++) {
                 srcs.add(el.get(i).getAttribute("src"));
            }
            
            // 가격 크롤링
			price = driver.findElements(By.className("price"));
			// 가격 값 담을 변수 준비
			String[] prices = new String[price.size()];
			
			for (int i = 0; i < price.size(); i++) {
				prices[i] = price.get(i).getText();
				
				// 엔터 제거
				prices[i] = prices[i].replaceAll("(\r|\n|\r\n|\n\r)","");

				// 광고 제거
				if(prices[i].indexOf("광고") != -1) {
					prices[i] = prices[i].replaceAll("광고", "");
				}
				
				// 원 없으면 원 추가
				if(prices[i].indexOf("원") == -1) {
					prices[i] = prices[i]+"원";
				}
				
				// 들어간 가격 체크
				// System.out.println("\n" + i + " >> " + prices[i]);
			}
			
            /** 상품명...크롤링 처음에 작업한거라 Jsoup으로 가져옴... **/
			
			// 상품명 크롤링
            re_url = driver.getCurrentUrl();
    		Document doc = Jsoup.connect(re_url).get();
    		
    		title = doc.select("div.tit > a");

    		map.put("srcs", srcs);
    		map.put("title", title);
    		map.put("prices", prices);
    		
        } catch (Exception e) {
        	e.printStackTrace();
            driver.close();

        } finally {
            driver.close();
        }
        
        return map;
        
    }
    
    public ArrayList<String> InstaCrawl(String InstaID){
    	
    	base_url = "https://www.instagram.com/" + InstaID;
    	driver.get(base_url);
    	ArrayList<String> imgURL = new ArrayList<String>();
    	
    	try {
    		
    		
    		for(int i = 0; i < 10; i++) {
    			JavascriptExecutor jsx = (JavascriptExecutor)driver;
    			jsx.executeScript("window.scrollTo(0, document.body.scrollHeight);","");   		
            	Thread.sleep(500);
    		}
    		List<WebElement> urlList = driver.findElements(By.className("FFVAD"));
    		for(int i = 0; i < urlList.size(); i++) {
        		imgURL.add(urlList.get(i).getAttribute("src"));
        	}
    		System.out.println(urlList.size());
    	}
    	
    	catch(Exception e) {
        	e.printStackTrace();
        }
    	
    	finally {
            driver.close();
        }
    		
            
    	
    	
    	//for(int j = 0; j < imgNum; j++) {
//    		List<WebElement> urlList = driver.findElements(By.className("FFVAD"));
//    		for(int i = 0; i < urlList.size(); i++) {
//        		tempURL.add(urlList.get(i).getAttribute("src"));
//        	}
//            if(imgURL.size() ==0) {
//            	for(int i = 0; i < tempURL.size(); i++) {
//            		imgURL.add(tempURL.get(i));
//            		System.out.println(imgURL.get(i));
//            	}
//            }
            
//            else if(imgURL.size() > 0 && imgURL.size() < 50){
//            	int tempURLSize = 0;
//            	for(int i = 0; i < imgURL.size(); i++) {
//            		int tempSize = 0;
//                	for(int k = 0; k < tempURL.size(); k++) {
//                		if(imgURL.get(i).equals(tempURL.get(k))) {             			
//                			continue;
//                		}
//                		else {
//                			tempURLSize = k;
//                			tempSize++;
//                		}
//                	}
//            		if(tempSize > 1) {
//            			break;
//            		}
//                }
//            	for(int k = tempURLSize; k < tempURL.size(); k++) {
//            		if(imgURL.size() < 50) {
//            			imgURL.add(tempURL.get(k));
//            			System.out.println("in"+tempURL.get(k));
//            		}
//            		else {
//            			break;
//            		}
//            	}
//            	tempURL.clear();
//            }
//            else {
//            	driver.close();
//            	return imgURL;
//            }
            //j = imgURL.size();
            
            
            
    	//} 	
    	
    	return imgURL;
    }
}
