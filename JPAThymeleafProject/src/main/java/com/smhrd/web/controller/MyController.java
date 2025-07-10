package com.smhrd.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.smhrd.web.entity.DataMember;
import com.smhrd.web.repo.DataMemberRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyController {

    // DB 연결과 관련되 기능을 mapping 사용
    @Autowired
    DataMemberRepository repository;

    @PostMapping("/login-process")
    public String main(DataMember member, HttpSession session) {
       DataMember loginDataMember =  repository.findByIdAndPw(member.getId(), member.getPw());
        // HttpSession 을 사용 하고 싶다면 파라미터로 수집
        session.setAttribute("login", loginDataMember);
        return "redirect:/main";
    }

    @PostMapping("/join-process")
    public String joinProcess(DataMember member,  HttpSession session) {
        // 중복처리
        // if (repository.findById(member.getId()).isPresent()) {
        // redirectAttributes.addFlashAttribute("duplicateId", true);
        // return "redirect:/join"; // join.jsp로 리다이렉트
        // }

        if (repository.findById(member.getId()).isPresent()) {
            session.setAttribute("duplicateId", true); // 세션에 저장
            return "redirect:/join";
        }
        repository.save(member);
        return "redirect:/";
    }

   
}
