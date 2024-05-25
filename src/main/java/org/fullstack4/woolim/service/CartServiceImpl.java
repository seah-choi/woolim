package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.common.InsufficientStockException;
import org.fullstack4.woolim.domain.CartVO;
import org.fullstack4.woolim.dto.CartDTO;
import org.fullstack4.woolim.mapper.CartMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    @Transactional(rollbackFor = {InsufficientStockException.class, Exception.class})
    public int insertCartOrJjim(CartDTO cartDTO) throws InsufficientStockException{
        CartVO cartVO = modelMapper.map(cartDTO, CartVO.class);
        log.info(cartVO.toString());
        int exist = cartMapper.existCartOrJjim(cartVO);
        if(exist>0){
            throw new InsufficientStockException("이미 추가된 강좌입니다.");
        }
        int result = cartMapper.insertCartOrJjim(cartVO);
        return result;
    }

    @Override
    @Transactional(rollbackFor = {InsufficientStockException.class, Exception.class})
    public int InsertCartFromJjim(List<CartDTO> cartDTO) throws InsufficientStockException {
        int total_result =0;
        for(int i = 0; i < cartDTO.size(); i++){
            CartVO cartVO = modelMapper.map(cartDTO.get(i), CartVO.class);
            log.info(cartVO);
            int exist = cartMapper.existCartOrJjim(cartVO);
            log.info("exist:{}",exist);
            if(exist>0){
                throw new InsufficientStockException("이미 장바구니에 담긴 강좌가 있습니다.");
            }
            int result = cartMapper.InsertCartFromJjim(cartVO);
            if(result>0){
                total_result ++;
            }else{
                throw new InsufficientStockException("실패했습니다.");
            }
        }

        return total_result;
    }

    @Override
    public int deleteCartOrJjim(CartDTO cartDTO) {
        CartVO cartVO = modelMapper.map(cartDTO, CartVO.class);
        int result = cartMapper.deleteCartOrJjim(cartVO);
        return result;
    }
}
