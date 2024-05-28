package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.annotations.Param;
import org.fullstack4.woolim.criteria.Criteria;
import org.fullstack4.woolim.criteria.PageMakerDTO;
import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.dto.VideoDTO;
import org.fullstack4.woolim.service.lecture.LectureServiceIf;
import org.fullstack4.woolim.service.lectureAdmin.LectureAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/admin/lecture")
@RequiredArgsConstructor
public class AdminLectureController {
    @Autowired
    private LectureAdminService lectureAdminService;
    @Autowired
    private LectureServiceIf lectureServiceIf;
    @GetMapping("/list")
    public void GETList(Model model , Criteria cri) {
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


        PageMakerDTO pageMakerDTO = new PageMakerDTO(cri,total);



        model.addAttribute("list",lectureDTOS);
        model.addAttribute("pageMaker",pageMakerDTO);
        model.addAttribute("cri",cri);

    }

    @GetMapping("/regist")
    public void GETRegist() {

    }

    @GetMapping("/modify")
    public void GETModify(String lecture_idx , Model model , @Param("selectedMemberName") String selectedMemberName,
                          @Param("selectedMemberId") String selectedMemberId  ) throws Exception{
        int idx = Integer.parseInt(lecture_idx);

        LectureDTO lectureDTO = lectureServiceIf.lectureView(idx);
        log.info("lectureDTO " + lectureDTO);
        model.addAttribute("list",lectureDTO);
        List<VideoDTO> videoDTO = lectureServiceIf.lectureVideo(idx);
        log.info("--------videoDTO--------" + videoDTO );
        if(videoDTO != null){
            model.addAttribute("video",videoDTO);
        }
        if(selectedMemberName != null) {
            log.info("selectedMemberName---" + selectedMemberName);
            model.addAttribute("selectedMemberName",selectedMemberName);
        }
        if(selectedMemberId != null) {
            log.info("selectedMemberId---" + selectedMemberId);
            model.addAttribute("selectedMemberId",selectedMemberId);
        }

    }

    @GetMapping("/delete")
    public String GETDelete(String selectedValues) {
        log.info("GETDelete---");


        String idx[] = selectedValues.split(",");

        for(int i=0; i<idx.length; i++) {

            int rResult = lectureAdminService.deleteLecture(Integer.parseInt(idx[i]));
        }

        return "redirect:/admin/lecture/list";
    }
    @GetMapping("/teacherList")
    public void GETteacherList(Model model) {
        List<MemberDTO> list = lectureAdminService.getTeacherList();
        log.info("list---" + list);

        model.addAttribute("list" , list);
    }

    @GetMapping("/teacherChoice")
    public void teacherChoiceGET(Model model , String selectedMemberName , String selectedMemberId
    , HttpServletResponse response) throws IOException {

        log.info("teacherChoiceGET---");




        model.addAttribute("selectedMemberId",selectedMemberId);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('선택이 완료되었습니다.');");
         out.println("window.opener.location.href = '/admin/lecture/regist?selectedMemberId="+selectedMemberId+"&selectedMemberName="
                +selectedMemberName+  "';");
        out.println("window.close();");
        out.println("</script>");


    }
    @GetMapping("/teacherListModify")
    public void GETteacherListModify(Model model, String lecture_idx) {
        List<MemberDTO> list = lectureAdminService.getTeacherList();
        log.info("list---" + list);
        log.info("lecture_idx---" + lecture_idx);
        model.addAttribute("lecture_idx",lecture_idx);
        model.addAttribute("list" , list);
    }

    @GetMapping("/teacherChoiceModify")
    public void teacherChoiceModifyGET(Model model , String selectedMemberName , String selectedMemberId
            , HttpServletResponse response , String lecture_idx) throws IOException {

        log.info("teacherListModify---");
        log.info("selectedMemberName---" + selectedMemberName);
        log.info("selectedMemberId---" + selectedMemberId);

        model.addAttribute("selectedMemberName",selectedMemberName);
        model.addAttribute("selectedMemberId",selectedMemberId);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('선택이 완료되었습니다.');");
        out.println("window.opener.location.href = '/admin/lecture/modify?selectedMemberId="+selectedMemberId+"&selectedMemberName="
                +selectedMemberName+  "&lecture_idx="+lecture_idx+"';");
        out.println("window.close();");
        out.println("</script>");


    }

    @PostMapping("/registLecture")
    public String lectureRegistPOST(LectureDTO dto, @RequestParam("file") MultipartFile file/*,
                                    @RequestParam("video") MultipartFile video*/) throws Exception {

        log.info("------------------------------------");
        log.info("lectureRegistPOST : " + dto.toString());
        log.info("Image File Name: " + file.getOriginalFilename());
/*        log.info("Video File Name: " + video.getOriginalFilename());*/
        log.info("------------------------------------");

        // 할인된 가격 계산
        int salePrice = dto.getLecture_price() - (dto.getLecture_price() * dto.getLecture_sale() / 100);
        dto.setLecture_sale_price(salePrice);

        // 이미지 파일 처리
        String uploadFolder = "C:\\java4\\spring\\springweb\\woolim\\src\\main\\webapp\\resources\\img\\lecture";
        String fileRealName = file.getOriginalFilename();
        String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."));
        UUID uuid = UUID.randomUUID();
        String newName = uuid.toString();

        File saveFile = new File(uploadFolder + "\\" + newName + fileExt);

        try {
            file.transferTo(saveFile);

            BufferedImage bo_image = ImageIO.read(saveFile);
            double ratio = 3;
            int width = (int) (bo_image.getWidth() / ratio);
            int height = (int) (bo_image.getHeight() / ratio);

            BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
            Graphics2D graphics2D = bt_image.createGraphics();
            graphics2D.drawImage(bo_image, 0, 0, width, height, null);

            ImageIO.write(bt_image, fileExt.substring(1), saveFile); // 확장자에서 점(.) 제거
        } catch (IOException e) {
            log.error("Error uploading image file: ", e);
        }


        dto.setLecture_image(newName + fileExt);
        log.info("lectureRegistPOST2 : " + dto.toString());
        int insertResult = lectureAdminService.insertLecture(dto);
        if (insertResult > 0) {
            return "redirect:/admin/lecture/list?success=true";
        } else {
            return "redirect:/admin/lecture/list?success=false";
        }
    }

    @PostMapping("/deleteImage")
    @ResponseBody
    public Map<String, Object> deleteLecture(@RequestBody Map<String, Object> requestData) {
        Map<String, Object> response = new HashMap<>();
        try {
            String lectureIdxStr = (String) requestData.get("lecture_idx");
            int lectureIdx = Integer.parseInt(lectureIdxStr);
            log.info("lecureIdx" + lectureIdx);
            // 삭제 로직 호출
            int isDeleted = lectureAdminService.deleteLectureImage(lectureIdx);

            if (isDeleted >0) {
                response.put("success", true);
            } else {
                response.put("success", false);
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", e.getMessage());
        }
        return response;
    }
    @PostMapping("/modifyLecture")
    public String lectureModifyPOST(LectureDTO dto, @RequestParam("file") MultipartFile file , @Param("lectureImageValue") String lectureImageValue /*,
                                    @RequestParam("video") MultipartFile video*/) throws Exception {

        log.info("------------file----------------"+ file);
        log.info("------------lectureImageValue----------------"+ lectureImageValue);
        log.info("lectureModifyPOST : " + dto.toString());
        // 할인된 가격 계산
        int salePrice = dto.getLecture_price() - (dto.getLecture_price() * dto.getLecture_sale() / 100);
        dto.setLecture_sale_price(salePrice);
        if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")){
            log.info("Image File Name: " + file.getOriginalFilename());
            /*        log.info("Video File Name: " + video.getOriginalFilename());*/
            log.info("--------1111111111111---------------");


            // 이미지 파일 처리
            String uploadFolder = "C:\\java4\\spring\\springweb\\woolim\\src\\main\\webapp\\resources\\img\\lecture";
            String fileRealName = file.getOriginalFilename();
            String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."));
            UUID uuid = UUID.randomUUID();
            String newName = uuid.toString();

            File saveFile = new File(uploadFolder + "\\" + newName + fileExt);

            try {
                file.transferTo(saveFile);

                BufferedImage bo_image = ImageIO.read(saveFile);
                double ratio = 3;
                int width = (int) (bo_image.getWidth() / ratio);
                int height = (int) (bo_image.getHeight() / ratio);

                BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
                Graphics2D graphics2D = bt_image.createGraphics();
                graphics2D.drawImage(bo_image, 0, 0, width, height, null);

                ImageIO.write(bt_image, fileExt.substring(1), saveFile); // 확장자에서 점(.) 제거
            } catch (IOException e) {
                log.error("Error uploading image file: ", e);
            }


            dto.setLecture_image(newName + fileExt);
            log.info("lectureRegistPOST2 : " + dto.toString());
            int insertResult = lectureAdminService.modifyLectureFile(dto);
            if (insertResult > 0) {
                return "redirect:/admin/lecture/list?success=true";
            } else {
                return "redirect:/admin/lecture/list?success=false";
            }
        } else if(lectureImageValue != null && !lectureImageValue.equals("")){
            log.info("--------22222222222222---------------");
            dto.setLecture_image(lectureImageValue);
            log.info("--------  dto.setLecture_image(lectureImageValue);---------------" +   dto.getLecture_image());
            int insertResult = lectureAdminService.modifyLecture(dto);
            if (insertResult > 0) {
                return "redirect:/admin/lecture/list?success=true";
            } else {
                return "redirect:/admin/lecture/list?success=false";
            }
        } else {
            log.info("--------3333333333---------------");
            int insertResult = lectureAdminService.modifyLecture(dto);
            return "redirect:/admin/lecture/list?success=false";
        }

    }

    @PostMapping("/videoRegist")
    public String videoRegistPost(MultipartHttpServletRequest files ,String lecture_idx , String video_content) {
        log.info("------------------------------------");

        log.info("Image File Name: " + files);
        /*        log.info("Video File Name: " + video.getOriginalFilename());*/
        log.info("------------------------------------");


        // 이미지 파일 처리
        String uploadFolder = "C:\\java4\\spring\\springweb\\woolim\\src\\main\\webapp\\resources\\img\\video";
        List<MultipartFile> list = files.getFiles("files");
        for(int i=0; i<list.size(); i++){
            String fileRealName = list.get(i).getOriginalFilename();
            long size  = list.get(i).getSize();
            String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length()); // 확장자명
            log.info("============================");
            log.info("uploadFolder : " + uploadFolder);
            log.info("fileRealName : " + fileRealName);
            log.info("size : " + size);
            log.info("fileExt : " + fileExt);

            //새로운 파일명 생성
            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String newName = uuids[0];

            log.info("uuid : " + uuid);
            log.info("uuids : " + uuids);
            log.info("newName : " + newName);
            log.info("lecture_idx : " + lecture_idx);

            File saveFile = new File(uploadFolder + "\\" + newName + fileExt);
            int idx = Integer.parseInt(lecture_idx);
            VideoDTO dto = new VideoDTO();
            dto.setLecture_idx(idx);
            dto.setVideo_title(fileRealName);
            dto.setVideo_file(newName + fileExt);
            dto.setVideo_content(video_content);
            try {
                list.get(i).transferTo(saveFile);
                int iResult = lectureAdminService.addVideo(dto);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            }
            catch(Exception e) {
                e.printStackTrace();
            }
        }

        return "redirect:/admin/lecture/modify?lecture_idx="+ lecture_idx;
    }
    @PostMapping("/videoDelete")
    @ResponseBody
    public String deleteVideo(@RequestParam("video_idx") int video_idx) {
        try {
            lectureAdminService.deleteVideo(video_idx);
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }

}
