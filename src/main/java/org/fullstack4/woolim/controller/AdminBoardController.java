package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.common.CommonUtil;
import org.fullstack4.woolim.common.FileUtil;
import org.fullstack4.woolim.dto.*;
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
import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

@Log4j2
@Controller
@RequestMapping(value="/admin/board")
@RequiredArgsConstructor
public class AdminBoardController {

    private final BbsServiceIf bbsServiceIf;


    @GetMapping("/list")
    public void GETList(@RequestParam(defaultValue = "") String bbs_type,
                        PageRequestDTO pageRequestDTO,
                        Model model) {

        pageRequestDTO.setBbs_type(bbs_type);
        pageRequestDTO.setBbs_teacher_yn("N");

        PageResponseDTO<BbsDTO> bbsList = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("bbsList", bbsList);

    }

    @GetMapping("/regist")
    public void GETRegist(@RequestParam(defaultValue = "") String bbs_type,
                          PageRequestDTO pageRequestDTO,
                          Model model) {
        pageRequestDTO.setBbs_type(bbs_type);
        pageRequestDTO.setBbs_teacher_yn("N");

        PageResponseDTO<BbsDTO> bbsList = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("bbsList", bbsList);
    }
    @PostMapping("/regist")
    public String POSTRegist(BbsDTO bbsDTO,
                          BindingResult bindingResult,
                          MultipartHttpServletRequest files,
                          HttpServletRequest req, RedirectAttributes redirectAttributes,
                          @RequestParam(defaultValue = "") String bbs_type,
                          PageRequestDTO pageRequestDTO) {

        pageRequestDTO.setBbs_type(bbs_type);
        pageRequestDTO.setBbs_teacher_yn("N");

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bbsDTO", bbsDTO);
            return "redirect:/admin/board/regist";
        }

        List<MultipartFile> list = files.getFiles("files");
        String uploadFoler = CommonUtil.getUploadFolder(req, "bbs");

        int result = bbsServiceIf.regist(bbsDTO);

        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getSize() == 0) {
                break;
            }
            FileDTO fileDTO = FileDTO.builder()
                    .file(list.get(i))
                    .uploadFolder(uploadFoler)
                    .build();

            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            log.info("=======================");
            log.info("upload : " + map);
            log.info("=======================");
            if (map.get("result").equals("success")) {
                BoardFileDTO boardFileDTO = BoardFileDTO.builder()
                        .bbs_idx(result)
                        .orgFile(map.get("orgName"))
                        .saveFile(map.get("newName")).build();
                bbsServiceIf.file_regist(boardFileDTO);
            }
        }
        if (result > 0) {
            return "redirect:/admin/board/list?bbs_type=" + bbsDTO.getBbs_category_code();
        } else {
            return "/admin/board/regist";
        }
    }
    @GetMapping("/view")
    public void GETView(@RequestParam(defaultValue = "") String bbs_type,
                        PageRequestDTO pageRequestDTO,
                        Model model,
                        @RequestParam(name="bbs_idx", defaultValue = "0") int bbs_idx) {

        log.info("AdminBoardController >>> GETView START");

        pageRequestDTO.setBbs_type(bbs_type);
        pageRequestDTO.setBbs_teacher_yn("N");


        BbsDTO  bbsDTO = bbsServiceIf.view(bbs_idx);
        BoardFileDTO boardFileDTO = bbsServiceIf.fileView(bbs_idx);

        log.info("bbs_type : "+bbsDTO.getBbs_category_code());

        model.addAttribute("bbs", bbsDTO);
        model.addAttribute("file",boardFileDTO);

        log.info("bbs : " + bbsDTO);
        log.info("file : "+ boardFileDTO);

        log.info("AdminBoardController >>> GETView END");

    }

    @GetMapping("/modify")
    public void GETModify(@RequestParam(name="bbs_idx", defaultValue = "0") int bbs_idx,
                          Model model) {

        BbsDTO bbsDTO = bbsServiceIf.view(bbs_idx);
        model.addAttribute("bbs", bbsDTO);

    }

    @PostMapping("/modify")
    public String POSTModify(BbsDTO bbsDTO,
                             MultipartHttpServletRequest files,
                             HttpServletRequest req,
                             RedirectAttributes redirectAttributes,
                             @RequestParam(defaultValue = "") String bbs_type,
                             PageRequestDTO pageRequestDTO){
        pageRequestDTO.setBbs_type(bbs_type);
        pageRequestDTO.setBbs_teacher_yn("N");

        List<MultipartFile> list = files.getFiles("files");
        String uploadFoler = CommonUtil.getUploadFolder(req,"bbs");

        int result = bbsServiceIf.modify(bbsDTO);

        for(int i=0;i<list.size();i++) {
            if (list.get(i).getSize() == 0) {
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
            if (map.get("result").equals("success")) {
                BoardFileDTO boardFileDTO = BoardFileDTO.builder()
                        .bbs_idx(result)
                        .orgFile(map.get("orgName"))
                        .saveFile(map.get("newName")).build();
                bbsServiceIf.file_regist(boardFileDTO);
            }
        }

        if(result > 0) {
            return "redirect:/admin/board/view?bbs_idx=" + bbsDTO.getBbs_idx();
        } else {
            return "/admin/board/modify?bbs_idx=" + bbsDTO.getBbs_idx();
        }
    }

    @GetMapping("/delete")
    public String GETDelete(@RequestParam(name="bbs_idx", required=false) String idxList) {
        String[] arrIdx = idxList.split(",");
        Integer[] newArr = Stream.of(arrIdx).mapToInt(Integer::parseInt).boxed().toArray(Integer[]::new);
        bbsServiceIf.deleteList(newArr);

        log.info("idxList : " + idxList);
        return "redirect:/admin/board/list";
    }
}
