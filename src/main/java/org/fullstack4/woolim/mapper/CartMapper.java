package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.CartVO;
import org.fullstack4.woolim.dto.CartDTO;

import java.util.List;

@Mapper
public interface CartMapper {
    List<CartVO> cartOrJjimList(CartDTO cartDTO);
    int insertCartOrJjim(CartVO cartVO);
}
