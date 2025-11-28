<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>

<%
    String fileName = request.getParameter("filename");
    if (fileName == null || fileName.isEmpty()) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "파일명이 없습니다.");
        return;
    }
    
    String oFilename = fileName;
    String savePath = "./upload";
    ServletContext context = request.getServletContext();
    String realPath = context.getRealPath(savePath);
    String sFilePath = realPath + "/" + fileName;
    
    File file = new File(sFilePath);
    if (!file.exists()) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND, "파일을 찾을 수 없습니다.");
        return;
    }
    
    FileInputStream in = new FileInputStream(sFilePath);
    String sMimeType = request.getServletContext().getMimeType(sFilePath);
    if (sMimeType == null) {
        sMimeType = "application/octet-stream";
    }
    
    // 한글 파일명 처리
    String userAgent = request.getHeader("User-Agent");
    String encodedFilename = null;
    
    if (userAgent != null && userAgent.indexOf("MSIE") != -1) {
        // IE
        encodedFilename = java.net.URLEncoder.encode(oFilename, "UTF-8").replaceAll("\\+", "%20");
    } else if (userAgent != null && userAgent.indexOf("Chrome") != -1) {
        // Chrome
        encodedFilename = new String(oFilename.getBytes("UTF-8"), "ISO-8859-1");
    } else {
        // Firefox, Safari 등
        encodedFilename = new String(oFilename.getBytes("UTF-8"), "ISO-8859-1");
    }
    
    response.setContentType(sMimeType);
    response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFilename + "\"");
    response.setHeader("Content-Length", String.valueOf(file.length()));
    
    ServletOutputStream fileOut = response.getOutputStream();
    int numRead;
    byte b[] = new byte[4096];
    
    try {
        while ((numRead = in.read(b, 0, b.length)) != -1) {
            fileOut.write(b, 0, numRead);
        }
        fileOut.flush();
    } finally {
        if (in != null) in.close();
        if (fileOut != null) fileOut.close();
    }
%>
