<%request.setCharacterEncoding("utf-8");%> 
<%@ page language="java" import="java.util.*,java.io.*" contentType="text/html; charset=utf-8"%> 
<%!// 读取http请求的正文并转化为字符串。
 String getRequestBody(HttpServletRequest request)throws Exception{
 	 int contentLength = request.getContentLength(); 
 	 DataInputStream in = new DataInputStream(request.getInputStream());
 	 byte dataBytes[]=new byte[contentLength]; 
 	 int bytesRead = 0; int totalBytesRead = 0; 
 	 while(totalBytesRead<contentLength){ 
 	 	bytesRead = in.read(dataBytes,totalBytesRead,contentLength);
 	 	totalBytesRead += bytesRead; 
 	 	} 
 	 String requestBody = new String(dataBytes,"ISO-8859-1");
 	 return requestBody; 
 }
 // 找出用来把正文划分为多个部分的边界字符串 
 String getBoundary(String contentType){ 
 	int lastIndex = contentType.lastIndexOf("="); 
 	return contentType.substring(lastIndex+1,contentType.length());      
 } 

 // 找出正文的一个划分部分的头部中找出文件名 
 String getFileName(String partOfBody) throws Exception { 
 	final String RET = "\r\n"; String fileName = ""; 
 	int lineStart = 0; int lineEnd = partOfBody.indexOf(RET); 
 	while(lineEnd>=0){ 
 		String line = partOfBody.substring(lineStart, lineEnd); 
 		lineStart = lineEnd+RET.length();        
 		lineEnd = partOfBody.indexOf(RET,lineStart); 
 		if(line.isEmpty()){ break; } 
 		else{ 
 			if(line.toLowerCase().indexOf("filename")>=0){            
 			fileName = line.substring(line.lastIndexOf("=")+1).trim(); 
 			fileName = fileName.substring(1, fileName.length()-1); 
 			fileName = new String(fileName.getBytes("ISO-8859-1"), "UTF-8");
 			 break; 
 			}
 		}
 	}
 	return fileName; 
 }

 boolean saveFile(String contentPart,String path,String fileName){ 
 		final String RET = "\r\n"; 
 		int bodyStart = 0;
 		int lineStart = 0;
 		int lineEnd = contentPart.indexOf(RET);
 		while(lineEnd>=0){ 
 			String line = contentPart.substring(lineStart, lineEnd);
 			lineStart = lineEnd+RET.length();
 			lineEnd = contentPart.indexOf(RET,lineStart);
 			if(line.isEmpty()){ 
 				bodyStart = lineStart;
 				break;
 			} 
 		} 
 		if(bodyStart==0) 
 			return false; 
 		String body=contentPart.substring(bodyStart); 
 			try{ 
 				FileOutputStream fileOut = new FileOutputStream(path+fileName);
 				fileOut.write(body.getBytes("ISO-8859-1"));
 				fileOut.flush(); fileOut.close();
 				return true; 
 			} catch(Exception e){
 			 return false; 
 			} 
} 
%>

<% String msg = ""; 
   String fileName = "";
   String fileName2 = "";
   String requestBody = getRequestBody(request); 
   String contentType = request.getContentType(); 
   String boundary = getBoundary(contentType); 
   String FileName = "";
   int idPos = requestBody.indexOf("name=\"id\"");
   

   int tmpPos = requestBody.indexOf(boundary);

   int startPos = requestBody.indexOf(boundary,tmpPos+1);
   String id = requestBody.substring(idPos+10,startPos-2);
			while(startPos>=0){ 
				int endPos = requestBody.indexOf(boundary,startPos+1); 
				String partOfBody = ""; 
				if(endPos<0){ 
					partOfBody = requestBody.substring(startPos); 
				} else{ 
					partOfBody= requestBody.substring(startPos + boundary.length()+2,endPos); 
				} 
				fileName = getFileName(partOfBody);
				int start = fileName.lastIndexOf("\\");
				//int end = fileName.lastIndexOf(".");
				fileName = fileName.substring(start+1);
				FileName = id + "_" + fileName;
				if(!fileName.isEmpty()){
					if(saveFile(partOfBody,"head_image/",fileName)){ 
						msg = "C:/Program Files/Apache Software Foundation/Tomcat 8.5/webapps/JSP2/files/" + FileName; 
					} else{ 
						msg = "上传失败！"; 
					} 
				} 
				if(endPos<0) break; 
				startPos = partOfBody.indexOf(boundary,endPos); 
			} 
	fileName2 = "files/" + FileName;

%>
<!-- contentType = multipart/form-data; boundary=-7e2ee1fe0800 -->
<!DOCTYPE HTML>
<html>
<head>
<title>文件传输例子</title>
</head>
<body>
	<div> 文件被上传到服务器的实际位置：<%=msg%></div>
<!-- <div><a href=""></a></div> -->
	<div><a href="<%=fileName2%>"><%=FileName%></a></div>
</body>
</html>
