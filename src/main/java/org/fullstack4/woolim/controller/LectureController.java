package org.fullstack4.woolim.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.common.CommonUtil;
import org.fullstack4.woolim.common.FileUtil;
import org.fullstack4.woolim.criteria.Criteria;
import org.fullstack4.woolim.criteria.PageMakerDTO;
import org.fullstack4.woolim.domain.OrderDetailVO;
import org.fullstack4.woolim.dto.*;
import org.fullstack4.woolim.service.BbsServiceIf;
import org.fullstack4.woolim.service.CartServiceIf;
import org.fullstack4.woolim.service.lecture.LectureServiceIf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Map;


@Log4j2
@Controller
@RequestMapping(value="/lecture")
public class LectureController {
    @Autowired
    private LectureServiceIf lectureServiceIf;
    @Autowired
    private BbsServiceIf bbsServiceIf;
    @Autowired
    private CartServiceIf cartServiceIf;
    @GetMapping("/list")
    public String GETList(Model model, Criteria cri, HttpSession session) {
        System.out.println("#####");
        log.info("-----------------------");
        log.info("-----LectureController-----" +"-> GETList() ");
        if(cri.getViewSorting() != null) {
            cri.setAmount(Integer.parseInt(cri.getViewSorting()));
        }
        log.info("----category---" + cri.getCategory());
        List<LectureDTO> lectureDTOS = null;
        int total = 0;
        if(cri.getCategory() != null && cri.getCategory() != ""){
            lectureDTOS  = lectureServiceIf.getListCategory(cri);
            total = lectureServiceIf.getLectureKeywordCategory(cri);
        } else{
            lectureDTOS =  lectureServiceIf.getList(cri);
            total = lectureServiceIf.getLectureKeyword(cri);
        }

        String id = "";
        if(session.getAttribute("member_id")!=null)
            id = session.getAttribute("member_id").toString();
        CartDTO cartDTO = CartDTO.builder()
                .member_id(id)
                .cart_status("N")
                .build();
        List<CartDTO> jjimList = cartServiceIf.cartOrJjimList(cartDTO);


        PageMakerDTO pageMakerDTO = new PageMakerDTO(cri,total);

        /*log.info("---lectureDTOS-------" + lectureDTOS);*/
        log.info("------lectureDTOS-------" + lectureDTOS);

        model.addAttribute("jjimList", jjimList);
        model.addAttribute("list",lectureDTOS);
        model.addAttribute("pageMaker",pageMakerDTO);
        model.addAttribute("cri",cri);
        return "/lecture/list";
    }

    @GetMapping("/regist")
    public void GETRegist() {

    }

    @GetMapping("/modify")
    public void GETModify() {

    }

    @GetMapping("/delete")
    public void GETDelete() {

    }
    @GetMapping("/view")
    public String viewGET(String lecture_idx, Model model , HttpServletRequest request) throws Exception {
        log.info("-----------------------");
        log.info("-----LectureController-----" +"-> viewGET() ");
        log.info("-----------------------");
        int idx = Integer.parseInt(lecture_idx);
        HttpSession session = request.getSession();
        String member_id = (String)session.getAttribute("member_id");

        LectureDTO lectureDTO = lectureServiceIf.lectureView(idx);
        List<VideoDTO> videoDTO = lectureServiceIf.lectureVideo(idx);
        OrderDetailDTO orderDetailDTO = lectureServiceIf.lectureStatus(idx,member_id);

        log.info("-----lectureDTO--------" + lectureDTO);
        log.info("-----video--------" + videoDTO);
        log.info("-----orderDetailDTO--------" + orderDetailDTO);
        model.addAttribute("list" , lectureDTO);
        model.addAttribute("video" , videoDTO);
        model.addAttribute("order" , orderDetailDTO);
        return "/lecture/view";
    }

    @GetMapping("/boardList")
    public void noticeListGET(@RequestParam(defaultValue = "") String bbs_type,
                              PageRequestDTO pageRequestDTO, Model model){

//        log.info("-----------------------");
//        log.info(lecture_idx);
//        pageRequestDTO.setLecture_idx(lecture_idx);
        log.info(pageRequestDTO);
        pageRequestDTO.setBbs_type(bbs_type);
        pageRequestDTO.setBbs_teacher_yn("Y");

        PageResponseDTO<BbsDTO> noticeListDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);
        log.info(noticeListDTO);
        model.addAttribute("responseDTO" , noticeListDTO);


//        int idx = Integer.parseInt(lecture_idx);
        LectureDTO lectureDTO = lectureServiceIf.lectureView(noticeListDTO.getLecture_idx());
        model.addAttribute("list" , lectureDTO);
        model.addAttribute("bbs_type",bbs_type);
    }

    @GetMapping("/jalyosilList")
    public void jalyosilListGET(String lecture_idx, Model model){
        int idx = Integer.parseInt(lecture_idx);
        LectureDTO lectureDTO = lectureServiceIf.lectureView(idx);
        model.addAttribute("list" , lectureDTO);
    }

    @GetMapping("/studentList")
    public void studentListGET(String lecture_idx, Model model,PageRequestDTO pageRequestDTO){
        int idx = Integer.parseInt(lecture_idx);
        LectureDTO lectureDTO = lectureServiceIf.lectureView(idx);
        model.addAttribute("list" , lectureDTO);

        pageRequestDTO.setBbs_teacher_yn("Y");

        PageResponseDTO<ClassDTO> bbsList = lectureServiceIf.gradeListByPage(pageRequestDTO);

        model.addAttribute("bbsList", bbsList);

        if(bbsList.getSearch_types()!=null){
            model.addAttribute("search_type", bbsList.getSearch_types()[0]);
        }

        log.info("bbsList : " + bbsList);

        log.info("LectureController >> GETList() END");
        log.info("============================");
    }

    @PostMapping("/studentRegist")
    public String studentRegist(GradeDTO gradeDTO){
        int result = lectureServiceIf.regist(gradeDTO);
        if(result > 0){
            return "redirect:/lecture/studentList";
        } else {
            return "redirect:/lecture/studentList";
        }
    }

    @PostMapping("/studentModify")
    public String studentModify(GradeDTO gradeDTO){
        int result = lectureServiceIf.modify(gradeDTO);
        if(result > 0){
            return "redirect:/lecture/studentList";
        } else {
            return "redirect:/lecture/studentList";
        }
    }



    @GetMapping("/boardRegist")
    public void boardRegistGET(Model model, @RequestParam String bbs_type, @RequestParam int lecture_idx){

        LectureDTO lectureDTO = lectureServiceIf.lectureView(lecture_idx);
        model.addAttribute("list" , lectureDTO);
        model.addAttribute("bbs_type",bbs_type);
        model.addAttribute("lecture_idx", lecture_idx);
    }

    @PostMapping("/boardRegist")
    public String boardRegistPOST(BbsDTO bbsDTO){
        int result = bbsServiceIf.InsertLectureBbs(bbsDTO);
        if(result>0){
            return "redirect:/lecture/boardList?bbs_type="+bbsDTO.getBbs_category_code()+"&lecture_idx="+bbsDTO.getLecture_idx();
        }
        else{
            return null;
        }
    }

    @GetMapping("/boardView")
    public void boardViewGET(@RequestParam int lecture_idx, Model model,@RequestParam int bbs_idx,@RequestParam String bbs_type){

        BbsDTO bbsDTO = bbsServiceIf.view(bbs_idx);
        BoardFileDTO boardFileDTO = bbsServiceIf.fileView(bbs_idx);

        model.addAttribute("file",boardFileDTO);
        model.addAttribute("bbsDTO" , bbsDTO);
        log.info(bbsDTO.toString());
        LectureDTO lectureDTO = lectureServiceIf.lectureView(lecture_idx);
        model.addAttribute("list" , lectureDTO);
        model.addAttribute("bbs_type",bbs_type);
        model.addAttribute("lecture_idx", lecture_idx);
        model.addAttribute("bbs_idx", bbs_idx);
    }




    @GetMapping("/qnaList")
    public void qnaListGET(String lecture_idx, Model model){
        int idx = Integer.parseInt(lecture_idx);
        LectureDTO lectureDTO = lectureServiceIf.lectureView(idx);
        model.addAttribute("list" , lectureDTO);
    }

    @GetMapping("/qnaRegist")
    public void qnaRegistGET(String lecture_idx, Model model){
        int idx = Integer.parseInt(lecture_idx);
        LectureDTO lectureDTO = lectureServiceIf.lectureView(idx);
        model.addAttribute("list" , lectureDTO);
    }

    @GetMapping("/qnaView")
    public void qnaViewGET(String lecture_idx, Model model){
        int idx = Integer.parseInt(lecture_idx);
        LectureDTO lectureDTO = lectureServiceIf.lectureView(idx);
        model.addAttribute("list" , lectureDTO);
    }
    @GetMapping("/watchVideo")
    public String watchVideoGET(String lectureIdx, Model model){
        int idx = Integer.parseInt(lectureIdx);
        List<VideoDTO> videoDTO = lectureServiceIf.lectureVideo(idx);
        log.info("VideoDTO" + videoDTO);
        model.addAttribute("list" , videoDTO);
        return "/lecture/watchVideo";
    }

    @GetMapping("/boardModify")
    public void GETBModify(@RequestParam int lecture_idx, Model model,@RequestParam int bbs_idx,@RequestParam String bbs_type) {
        BbsDTO bbsDTO = bbsServiceIf.view(bbs_idx);

        log.info("bbsDTO : " + bbsDTO);
        LectureDTO lectureDTO = lectureServiceIf.lectureView(lecture_idx);
        model.addAttribute("list" , lectureDTO);
        model.addAttribute("bbsDTO", bbsDTO);
        model.addAttribute("bbs_type",bbs_type);
        model.addAttribute("lecture_idx", lecture_idx);
        model.addAttribute("bbs_idx", bbs_idx);
    }

    @PostMapping("/boardModify")
    public String POSTBModify(@RequestParam int lecture_idx, Model model, @RequestParam int bbs_idx
            , @RequestParam String bbs_type, BbsDTO bbsDTO, HttpServletRequest req
            , MultipartHttpServletRequest files) {
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
            model.addAttribute("bbsDTO", bbsDTO);
            model.addAttribute("bbs_type",bbs_type);
            model.addAttribute("lecture_idx", lecture_idx);
            model.addAttribute("bbs_idx", bbs_idx);
            return "redirect:/lecture/boardView?bbs_idx=" + bbsDTO.getBbs_idx() +"&bbs_type="+bbs_type+"&lecture_idx="+lecture_idx;
        } else {
            return "/lecture/boardModify?bbs_idx=" + bbsDTO.getBbs_idx() +"&bbs_type="+bbs_type+"&lecture_idx="+lecture_idx;
        }

    }

    @GetMapping("/getGrade")
    @ResponseBody
    public ClassDTO getGrade(@RequestParam(name = "class_idx", defaultValue = "") int class_idx) throws IOException {
        ClassDTO dto = lectureServiceIf.getGrade(class_idx);

        return dto;

    }

}