package org.fullstack4.woolim.service;

import org.fullstack4.woolim.dto.CartDTO;

import java.util.List;

public interface CartServiceIf {
    List<CartDTO> cartOrJjimList(CartDTO cartDTO);
}
