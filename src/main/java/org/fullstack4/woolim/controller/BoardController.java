package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.common.CommonUtil;
import org.fullstack4.woolim.common.FileUtil;
import org.fullstack4.woolim.dto.*;
import org.fullstack4.woolim.service.BbsReplyServiceIf;
import org.fullstack4.woolim.service.BbsServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping(value="/board")
@RequiredArgsConstructor
public class BoardController {

    private final BbsServiceIf bbsServiceIf;
    private final BbsReplyServiceIf bbsReplyServiceIf;

    @GetMapping("/list")
    public void GETList(@RequestParam(defaultValue = "") String bbs_type,
                        PageRequestDTO pageRequestDTO,
                        Model model) {
        log.info("============================");
        log.info("BoardController >> GETList() START");

        pageRequestDTO.setBbs_type(bbs_type);
        pageRequestDTO.setBbs_teacher_yn("N");
        log.info("bbs_type" + bbs_type);

        PageResponseDTO<BbsDTO> bbsList = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("bbsList", bbsList);
        model.addAttribute("bbs_type",bbs_type);

        if(bbsList.getSearch_types()!=null){
            model.addAttribute("search_type", bbsList.getSearch_types()[0]);
        }

        log.info("bbsList : " + bbsList);

        log.info("BoardController >> GETList() END");
        log.info("============================");
    }

    @GetMapping("/view")
    public void GETView(PageRequestDTO pageRequestDTO, Model model
                        ,@RequestParam(name="bbs_idx", defaultValue = "0") int bbs_idx) {
        log.info("BoardController >> GETView()");
        BbsDTO  bbsDTO = bbsServiceIf.view(bbs_idx);
        BoardFileDTO boardFileDTO = bbsServiceIf.fileView(bbs_idx);

        bbsServiceIf.updateReadCount(bbs_idx);

        model.addAttribute("bbs", bbsDTO);
        model.addAttribute("file",boardFileDTO);

    }

    @GetMapping("/regist")
    public void GETRegist() {

    }

    @PostMapping("/regist")
    public String POSTRegist(BbsDTO bbsDTO, BindingResult bindingResult,MultipartHttpServletRequest files
            ,HttpServletRequest req, RedirectAttributes redirectAttributes) {


        bbsDTO.setBbs_teacher_yn("N");
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bbsDTO", bbsDTO);
            return "redirect:/board/regist";
        }

        List<MultipartFile> list = files.getFiles("files");
        String uploadFoler = CommonUtil.getUploadFolder(req,"bbs");

        int result = bbsServiceIf.regist(bbsDTO);

        for(int i=0;i<list.size();i++){
            if(list.get(i).getSize()==0){
                break;
            }
            FileDTO fileDTO = FileDTO.builder()
                    .file(list.get(i))
                    .uploadFolder(uploadFoler)
                    .build();
            log.info("========================");
            log.info("PostfreeModify >> bbsDTO" + bbsDTO);
            log.info("========================");
            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            log.info("=======================");
            log.info("upload : " + map);
            log.info("=======================");
            if(map.get("result").equals("success")) {
                BoardFileDTO boardFileDTO = BoardFileDTO.builder()
                        .bbs_idx(result)
                        .orgFile(map.get("orgName"))
                        .saveFile(map.get("newName")).build();
                bbsServiceIf.file_regist(boardFileDTO);
            }
        }


        if(result > 0){
            return "redirect:/board/list";
        } else{
            return "/board/regist";
        }

    }

    @GetMapping("/modify")
    public void GETModify(@RequestParam(name="bbs_idx", defaultValue = "0") int bbs_idx, Model model) {

        BbsDTO bbsDTO = bbsServiceIf.view(bbs_idx);
        model.addAttribute("bbs", bbsDTO);

        List<BoardFileDTO> fileList = bbsServiceIf.file_list(bbs_idx);
        model.addAttribute("fileList", fileList);
    }

    @PostMapping("/modify")
    public String PostModify(BbsDTO bbsDTO, BindingResult bindingResult,MultipartHttpServletRequest files
            ,HttpServletRequest req, RedirectAttributes redirectAttributes) {

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bbsDTO", bbsDTO);
            return "redirect:/board/regist";
        }

        int resultFile = 0;
        String upload = "";

        resultFile = bbsServiceIf.modify(bbsDTO);


        List<MultipartFile> list = files.getFiles("files");
        upload = CommonUtil.getUploadFolder(req, "bbs");

        log.info("resultFile : " + resultFile);
        log.info("files.size111 : " + files.getFiles("files").size());
        log.info("list : " + list);

        log.info("uploadFoler111: " + upload);

        boolean fileExists = bbsServiceIf.hasExistingFiles(bbsDTO.getBbs_idx());
        if (fileExists) {
            // 기존 파일이 있는 글 수정 등록 로직
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getSize() == 0) {
                    continue;
                }

                FileDTO fileDTO = FileDTO.builder()
                        .file(list.get(i))
                        .uploadFolder(upload)
                        .build();
                log.info("========================");
                log.info("PostModify >> bbsDTO" + bbsDTO);
                log.info("========================");
                Map<String, String> map = FileUtil.FileUpload(fileDTO);
                log.info("=======================");
                log.info("upload : " + map);
                log.info("=======================");
                if (map.get("result").equals("success")) {
                    BoardFileDTO boardFileDTO = BoardFileDTO.builder()
                            .bbs_idx(bbsDTO.getBbs_idx())
                            .orgFile(map.get("orgName"))
                            .saveFile(map.get("newName")).build();
                    bbsServiceIf.fileModify(boardFileDTO);
                    log.info("boardFileDTO : " + boardFileDTO);
                }
            }

        } else {
            //기존 파일이 없을 때 로직
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getSize() == 0) {
                    break;
                }
                FileDTO fileDTO = FileDTO.builder()
                        .file(list.get(i))
                        .uploadFolder(upload)
                        .build();
                log.info("========================");
                log.info("PostModify2222 >> bbsDTO" + bbsDTO);
                log.info("========================");
                Map<String, String> map = FileUtil.FileUpload(fileDTO);
                log.info("=======================");
                log.info("upload2222 : " + map);
                log.info("=======================");
                if (map.get("result").equals("success")) {
                    BoardFileDTO boardFileDTO = BoardFileDTO.builder()
                            .bbs_idx(bbsDTO.getBbs_idx())
                            .orgFile(map.get("orgName"))
                            .saveFile(map.get("newName")).build();
                    bbsServiceIf.file_regist(boardFileDTO);
                    log.info("boardFileDTO2222 : " + boardFileDTO);
                }
            }
        }


        if(resultFile > 0) {
            return "redirect:/board/view?bbs_idx=" + bbsDTO.getBbs_idx();
        } else {
            return "/board/modify?bbs_idx=" + bbsDTO.getBbs_idx();
        }
    }

    @PostMapping("/delete")
    public String POSTDelete(@RequestParam(name="bbs_idx", defaultValue = "0") int bbs_idx, BbsDTO bbsDTO) {
        int result = bbsServiceIf.delete(bbs_idx);
        if(result > 0){
            return "redirect:/board/freeList?bbs_type="+bbsDTO.getBbs_category_code();
        } else{
            return "/board/freeView?bbs_idx="+bbsDTO.getBbs_idx();
        }
    }

    @GetMapping("/freeList")
    public void GETfreeList(@RequestParam(defaultValue = "") String bbs_type,
                        PageRequestDTO pageRequestDTO,
                        Model model) {
        log.info("============================");
        log.info("BoardController >> GETfreeList() START");

        pageRequestDTO.setBbs_type(bbs_type);
        pageRequestDTO.setBbs_teacher_yn("N");
        log.info("bbs_type" + bbs_type);

        PageResponseDTO<BbsDTO> bbsList = bbsServiceIf.bbsListByPage(pageRequestDTO);
      for(int i=0; i<bbsList.getDtolist().size(); i++){
          String content = bbsList.getDtolist().get(i).getBbs_content();
          if(content.length() < 40) {
              bbsList.getDtolist().get(i).setBbs_content(content);
          } else {
              String subContent = content.substring(0,40);
              bbsList.getDtolist().get(i).setBbs_content(subContent+"...");
          }

      }

        if(bbsList.getSearch_types()!=null){
            model.addAttribute("search_type", bbsList.getSearch_types()[0]);
        }

        model.addAttribute("bbsList", bbsList);
        model.addAttribute("bbs_type",bbs_type);

        log.info("bbsList : " + bbsList);

        log.info("BoardController >> GETfreeList() END");
        log.info("============================");


    }

    @GetMapping("/freeRegist")
    public void GETfreeRegist() {

    }

    @PostMapping("/freeRegist")
    public String POSTfreeRegist(BbsDTO bbsDTO, BindingResult bindingResult,MultipartHttpServletRequest files
            ,HttpServletRequest req, RedirectAttributes redirectAttributes) {

        bbsDTO.setBbs_teacher_yn("N");
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bbsDTO", bbsDTO);
            return "redirect:/board/regist";
        }

        List<MultipartFile> list = files.getFiles("files");
        String uploadFoler = CommonUtil.getUploadFolder(req,"bbs");

        int result = bbsServiceIf.regist(bbsDTO);

        for(int i=0;i<list.size();i++){
            if(list.get(i).getSize()==0){
                break;
            }
            FileDTO fileDTO = FileDTO.builder()
                    .file(list.get(i))
                    .uploadFolder(uploadFoler)
                    .build();
            log.info("========================");
            log.info("PostfreeModify >> bbsDTO" + bbsDTO);
            log.info("========================");
            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            log.info("=======================");
            log.info("upload : " + map);
            log.info("=======================");
            if(map.get("result").equals("success")) {
                BoardFileDTO boardFileDTO = BoardFileDTO.builder()
                        .bbs_idx(result)
                        .orgFile(map.get("orgName"))
                        .saveFile(map.get("newName")).build();
                bbsServiceIf.file_regist(boardFileDTO);
            }
        }


        if(result > 0){
            return "redirect:/board/freeList?bbs_type="+bbsDTO.getBbs_category_code();
        } else{
            return "/board/regist";
        }

    }

    @GetMapping("/freeModify")
    public void GETfreeModify(@RequestParam(name="bbs_idx", defaultValue = "0") int bbs_idx, Model model) {

        BbsDTO bbsDTO = bbsServiceIf.view(bbs_idx);
        BoardFileDTO boardFileDTO = bbsServiceIf.fileView(bbs_idx);
        model.addAttribute("bbs", bbsDTO);
        model.addAttribute("file", boardFileDTO);

        List<BoardFileDTO> fileList = bbsServiceIf.file_list(bbs_idx);
        model.addAttribute("fileList", fileList);
        log.info("GETModify bbsDTO : "+bbsDTO);

    }

    @PostMapping("/freeModify")
    public String PostfreeModify(BbsDTO bbsDTO,MultipartHttpServletRequest files
                                 ,HttpServletRequest req, String fileYN, RedirectAttributes redirectAttributes){

        int resultFile = 0;
        String upload = "";

        resultFile = bbsServiceIf.modify(bbsDTO);
        if(fileYN.equals("N")){
            bbsServiceIf.file_delete(bbsDTO.getBbs_idx());
        }


        List<MultipartFile> list = files.getFiles("files");
        upload = CommonUtil.getUploadFolder(req, "bbs");

        log.info("resultFile : " + resultFile);
        log.info("files.size111 : " + files.getFiles("files").size());
        log.info("list : " + list);

        log.info("uploadFoler111: " + upload);

        boolean fileExists = bbsServiceIf.hasExistingFiles(bbsDTO.getBbs_idx());
        if (fileExists) {
            // 기존 파일이 있는 글 수정 등록 로직
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getSize() == 0) {
                    continue;
                }

                FileDTO fileDTO = FileDTO.builder()
                        .file(list.get(i))
                        .uploadFolder(upload)
                        .build();
                log.info("========================");
                log.info("PostModify >> bbsDTO" + bbsDTO);
                log.info("========================");
                Map<String, String> map = FileUtil.FileUpload(fileDTO);
                log.info("=======================");
                log.info("upload : " + map);
                log.info("=======================");
                if (map.get("result").equals("success")) {
                    BoardFileDTO boardFileDTO = BoardFileDTO.builder()
                            .bbs_idx(bbsDTO.getBbs_idx())
                            .orgFile(map.get("orgName"))
                            .saveFile(map.get("newName")).build();
                    bbsServiceIf.fileModify(boardFileDTO);
                    log.info("boardFileDTO : " + boardFileDTO);
                }
            }

        } else {
            //기존 파일이 없을 때 로직
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getSize() == 0) {
                    break;
                }
                FileDTO fileDTO = FileDTO.builder()
                        .file(list.get(i))
                        .uploadFolder(upload)
                        .build();
                log.info("========================");
                log.info("PostModify2222 >> bbsDTO" + bbsDTO);
                log.info("========================");
                Map<String, String> map = FileUtil.FileUpload(fileDTO);
                log.info("=======================");
                log.info("upload2222 : " + map);
                log.info("=======================");
                if (map.get("result").equals("success")) {
                    BoardFileDTO boardFileDTO = BoardFileDTO.builder()
                            .bbs_idx(bbsDTO.getBbs_idx())
                            .orgFile(map.get("orgName"))
                            .saveFile(map.get("newName")).build();
                    bbsServiceIf.file_regist(boardFileDTO);
                    log.info("boardFileDTO2222 : " + boardFileDTO);
                }
            }
        }

        if(resultFile > 0) {
            return "redirect:/board/freeView?bbs_idx=" + bbsDTO.getBbs_idx();
        } else {
            return "/board/freeModify?bbs_idx=" + bbsDTO.getBbs_idx();
        }
    }

    @GetMapping("/freeView")
    public void GETfreeView(PageRequestDTO pageRequestDTO, Model model
            ,@RequestParam(name="bbs_idx", defaultValue = "0") int bbs_idx) {
        log.info("BoardController >> GETView()");
        BbsDTO  bbsDTO = bbsServiceIf.view(bbs_idx);
        BoardFileDTO boardFileDTO = bbsServiceIf.fileView(bbs_idx);
        List<BbsReplyDTO> bbsReplyDTOList = bbsReplyServiceIf.list(bbs_idx);
        bbsServiceIf.updateReadCount(bbs_idx);

        model.addAttribute("bbs", bbsDTO);
        model.addAttribute("file",boardFileDTO);
        model.addAttribute("reply", bbsReplyDTOList);

    }


}
