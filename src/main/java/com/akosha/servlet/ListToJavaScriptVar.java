package com.akosha.servlet;

import java.util.List;

public class ListToJavaScriptVar {
	public static String toJavascriptArray(List<String> followers){
		Object[] arr = followers.toArray();
	    StringBuffer sb = new StringBuffer();
	    sb.append("[");
	    for(int i=0; i<arr.length; i++){
	        sb.append("\"").append(arr[i]).append("\"");
	        if(i+1 < arr.length){
	            sb.append(",");
	        }
	    }
	    sb.append("]");
	    System.out.println(sb);
	    return sb.toString();
	}
}
