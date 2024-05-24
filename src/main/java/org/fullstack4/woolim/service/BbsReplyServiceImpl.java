package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.BbsReplyVO;
import org.fullstack4.woolim.dto.BbsReplyDTO;
import org.fullstack4.woolim.mapper.BbsReplyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BbsReplyServiceImpl implements BbsReplyServiceIf{
    private final BbsReplyMapper bbsReplyMapper;
    private final ModelMapper modelMapper;

    @Override
    public List<BbsReplyDTO> list(int bbs_idx) {
        List<BbsReplyDTO> BbsReplyDTOList = bbsReplyMapper.list(bbs_idx).stream().map(vo->modelMapper.map(vo,BbsReplyDTO.class)).collect(Collectors.toList());
        log.info("BbsReplyDTOList: {}", BbsReplyDTOList);
        return BbsReplyDTOList;
    }

    @Override
    public int regist(BbsReplyDTO bbsReplyDTO) {
        log.info("========================");
        log.info("BbsReplyServiceImpl regist(bbsReplyDTO)" + bbsReplyDTO);

        BbsReplyVO bbsReplyVO = modelMapper.map(bbsReplyDTO, BbsReplyVO.class);
        int result = bbsReplyMapper.regist(bbsReplyVO);
        int reply_result = bbsReplyMapper.reply_cnt_update(bbsReplyDTO.getBbs_idx());
        log.info("BbsReplyServiceImpl bbsReplyVO" + bbsReplyVO);
        log.info("BbsReplyServiceImpl result :" + result);
        log.info("BbsReplyServiceImpl reply_result :" + reply_result);
        log.info("========================");

        return result;
    }

    @Override
    public int modify(BbsReplyDTO bbsReplyDTO) {
        BbsReplyVO bbsReplyVO = modelMapper.map(bbsReplyDTO, BbsReplyVO.class);
        int result = bbsReplyMapper.modify(bbsReplyVO);
        return result;
    }


    @Override
    public int delete(int reply_idx) {
        return bbsReplyMapper.delete(reply_idx);
    }

}
