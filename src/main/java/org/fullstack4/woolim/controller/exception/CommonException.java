package org.fullstack4.woolim.controller.exception;

import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import java.util.Arrays;

@Log4j2
@ControllerAdvice
public class CommonException {
    @ResponseBody
    @ExceptionHandler(NumberFormatException.class)
    public String exceptNumber(NumberFormatException numberFormatException) {
        log.info("==========================");
        log.info("CommonException >> exceptNumber()");
        log.info("Error Msg : " + numberFormatException.getMessage());
        log.info("==========================");

        return "Number format exception";
    }

    @ResponseBody
    @ExceptionHandler(Exception.class)
    public String except(Exception e) {
        log.info("==========================");
        log.info(e.getMessage());

        StringBuilder sb = new StringBuilder("<ul>");
        sb.append("<li>" + e.getMessage() + "</li>");

        Arrays.stream(e.getStackTrace())
                .forEach(el->{
                    sb.append("<li>" + el + "</li>");
                });
        sb.append("</ul>");

        log.info("==========================");

        return  sb.toString();
    }

    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String notFound(){
        return "custom404";
    }


}
