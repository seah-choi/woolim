package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.CartVO;
import org.fullstack4.woolim.dto.CartDTO;
import org.fullstack4.woolim.mapper.CartMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartServiceIf{

    private final CartMapper cartMapper;
    private final ModelMapper modelMapper;

    @Override
    public List<CartDTO> cartOrJjimList(CartDTO cartDTO) {
        List<CartVO> voList = cartMapper.cartOrJjimList(cartDTO);
        List<CartDTO> dtolist = voList.stream().map(vo -> modelMapper.map(vo, CartDTO.class)).collect(Collectors.toList());

        return dtolist;
    }

    @Override
    public int insertCartOrJjim(CartDTO cartDTO) {
        CartVO cartVO = modelMapper.map(cartDTO, CartVO.class);
        int result = cartMapper.insertCartOrJjim(cartVO);
        return result;
    }
}
