package org.fullstack4.woolim.common;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.Set;

public class CommonUtil {

    public static String parseString(Object obj) {
        return (obj != null) ? (String)obj : "";
    }

    public static boolean nullCheck(String str) {
        if (str.equals("")){
            return false;
        } else if (str.trim().equals("")) {
            return false;
        }
        return true;
    }

    public static int parseInt(String str) {
        int result = 0;
        try {
            str = parseString(str);
            result = Integer.parseInt(str);
        } catch (NumberFormatException e) {
            System.out.println("숫자가 아닌 값 들어옴.");
        }
        return result;
    }
    public static String getUploadFolder(HttpServletRequest request, String target) {
        // target 인자에는 upload폴더 하위 폴더 명을 넣으시오
        String realPath = request.getServletContext().getRealPath("");
        return realPath.substring(0,realPath.indexOf("build")) + "src\\main\\webapp\\resources\\upload\\" + target;
    }



    public static String comma(String str) {
        return String.format("%,d", parseInt(str));
    }
}