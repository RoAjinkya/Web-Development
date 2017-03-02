package edu.neu.csye6220.util;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.http.HttpEntity;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;

public class Driver {

	
	public  JSONObject  GetResponse(String Param) throws IOException, JSONException {
		CloseableHttpClient httpclient = HttpClients.createDefault();
		String url ;
		if(Param!=""){
	     url ="https://api.nytimes.com/svc/search/v2/articlesearch.json?q="+Param;
		}
		else
		{
		 url ="https://api.nytimes.com/svc/search/v2/articlesearch.json?";
				
		}
		HttpGet httpGet = new HttpGet(url);
		CloseableHttpResponse response1 = httpclient.execute(httpGet);
	 
		try {
		    System.out.println(response1.getStatusLine());
		    HttpEntity entity1 = response1.getEntity();
		    System.out.println(entity1.getContent());
		    String retSrc = EntityUtils.toString(entity1);
		    JSONObject obj = new JSONObject(retSrc);
		    System.out.println(obj.get("response"));
		 System.out.println("XYZ"+obj.toString());
		    
		    return obj;
		} finally {
		    response1.close();
		}

		
	}

}
