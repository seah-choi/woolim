package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.annotations.Param;
import org.fullstack4.woolim.criteria.Criteria;
import org.fullstack4.woolim.criteria.PageMakerDTO;
import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.service.lecture.LectureServiceIf;
import org.fullstack4.woolim.service.lectureAdmin.LectureAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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

        /*log.info("---lectureDTOS-------" + lectureDTOS);*/
        log.info("------lectureDTOS-------" + lectureDTOS);

        model.addAttribute("list",lectureDTOS);
        model.addAttribute("pageMaker",pageMakerDTO);
        model.addAttribute("cri",cri);

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
        log.info("selectedMemberName---" + selectedMemberName);
        log.info("selectedMemberId---" + selectedMemberId);

        model.addAttribute("selectedMemberName",selectedMemberName);
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

        // 비디오 파일 처리
       /* String uploadFolder1 = "C:\\java4\\spring\\springweb\\woolim\\src\\main\\webapp\\resources\\img\\video";
        String fileRealName1 = video.getOriginalFilename();
        String fileExt1 = fileRealName1.substring(fileRealName1.lastIndexOf("."));
        UUID uuid1 = UUID.randomUUID();
        String newName1 = uuid1.toString();

        File saveFile1 = new File(uploadFolder1 + "\\" + newName1 + fileExt1);

        try {
            video.transferTo(saveFile1);
        } catch (IOException e) {
            log.error("Error uploading video file: ", e);
        }

        dto.setLecture_video(newName1 + fileExt1);
*/
        dto.setLecture_image(newName + fileExt);
        log.info("lectureRegistPOST2 : " + dto.toString());
        int insertResult = lectureAdminService.insertLecture(dto);
        if (insertResult > 0) {
            return "redirect:/admin/lecture/list?success=true";
        } else {
            return "redirect:/admin/lecture/list?success=false";
        }
    }

}
