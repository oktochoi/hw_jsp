package util;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

public class FileUpload {
    
    private static final String UPLOAD_DIR = "upload";
    private static final int MAX_FILE_SIZE = 10 * 1024 * 1024; // 10MB
    
    /**
     * 파일 업로드를 처리하고 MultipartRequest 객체를 반환합니다.
     * @param request HttpServletRequest
     * @param savePath 저장 경로
     * @return MultipartRequest 객체
     */
    public static MultipartRequest uploadFile(HttpServletRequest request, String savePath) {
        try {
            // upload 디렉토리가 없으면 생성
            File uploadDir = new File(savePath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            
            MultipartRequest multi = new MultipartRequest(
                request,
                savePath,
                MAX_FILE_SIZE,
                "UTF-8",
                new DefaultFileRenamePolicy()
            );
            
            return multi;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * 업로드된 파일명을 반환합니다.
     * @param multi MultipartRequest 객체
     * @param paramName 파라미터 이름
     * @return 파일명 (없으면 null)
     */
    public static String getFileName(MultipartRequest multi, String paramName) {
        String fileName = multi.getFilesystemName(paramName);
        return fileName;
    }
    
    /**
     * 업로드된 원본 파일명을 반환합니다.
     * @param multi MultipartRequest 객체
     * @param paramName 파라미터 이름
     * @return 원본 파일명 (없으면 null)
     */
    public static String getOriginalFileName(MultipartRequest multi, String paramName) {
        String originalFileName = multi.getOriginalFileName(paramName);
        return originalFileName;
    }
    
    /**
     * 파일을 삭제합니다.
     * @param filePath 삭제할 파일의 전체 경로
     * @return 삭제 성공 여부
     */
    public static boolean deleteFile(String filePath) {
        try {
            File file = new File(filePath);
            if (file.exists()) {
                return file.delete();
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * 업로드 디렉토리 경로를 반환합니다.
     * @return 업로드 디렉토리명
     */
    public static String getUploadDir() {
        return UPLOAD_DIR;
    }
}

    