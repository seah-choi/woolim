package org.fullstack4.woolim.service;

import org.fullstack4.woolim.common.InsufficientStockException;
import org.fullstack4.woolim.dto.MemberDTO;

import javax.servlet.http.HttpServletRequest;

public interface MemberServiceIf {
    boolean login(String id, String pwd, HttpServletRequest req) throws InsufficientStockException;
}
