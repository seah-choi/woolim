package org.fullstack4.woolim.service;

import org.fullstack4.woolim.domain.CartVO;
import org.fullstack4.woolim.dto.CartDTO;

import java.util.List;

public interface CartServiceIf {
    List<CartDTO> cartOrJjimList(CartDTO cartDTO);
    int insertCartOrJjim(CartDTO cartDTO);
}
