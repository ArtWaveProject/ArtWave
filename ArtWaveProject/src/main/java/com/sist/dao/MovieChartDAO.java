package com.sist.dao;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.sist.vo.MovieChartVO;

public class MovieChartDAO {
	   
	   public static void main(String[] args) {
	      ScheduledJob job = new ScheduledJob();
	      Timer jobScheduler = new Timer();
	      jobScheduler.scheduleAtFixedRate(job, 1000, 5000);
	      try {
	         Thread.sleep(20000);
	      } catch(InterruptedException ex) {
	         //
	      }
	      jobScheduler.cancel();
	   }
	}

	class ScheduledJob extends TimerTask {
	   
	   public void run() {
	      try
	      {
	    	  Document doc=Jsoup.connect("https://www.kobis.or.kr/kobis/business/main/searchMainDailySeatTicket.do").get();
	    	  String json=doc.toString();
	    	  json=json.substring(json.indexOf("["),json.lastIndexOf("]")+1);
	    	  JSONParser jp=new JSONParser();
	    	  JSONArray arr=(JSONArray)jp.parse(json);
	    	  List<MovieChartVO> mcList= new ArrayList<MovieChartVO>();
	    	  for(int i=0;i<arr.size();i++)
	    	  {
	    		  JSONObject obj=(JSONObject)arr.get(i);
	    		  String name=(String)obj.get("movieNm");
	    		  String poster=(String)obj.get("fileSaveLoct");
	    		  String srate=(String)obj.get("totSeatCntRatio");
	    		  
	    		  
	    	  }
	      }catch(Exception ex){}
	   }
	}
