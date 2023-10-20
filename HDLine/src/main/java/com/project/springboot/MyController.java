package com.project.springboot;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.springboot.noticeboard.NoticeBoardDAO;

import jakarta.servlet.http.HttpServletRequest;



@Controller
public class MyController {
	
	@Autowired
	NoticeBoardDAO notidao;
	
	@RequestMapping("/")
	public @ResponseBody String root() throws Exception{
        return "HDLine";
    }
	
	@RequestMapping("/member/board")
	public String modelboard(HttpServletRequest request,Model model) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		//파라미터 저장
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		if (searchWord!= null) {
			//검색어가 있는 경우 Map에 파라미터를 저장한다.
			map.put("searchField",searchField);
			map.put("searchWord", searchWord);
		}
		
		//총 게시물 카운트
		int totalCount = notidao.selectCount(map);
		
		model.addAttribute("boardlist",notidao.selectListpage(null));
		
//		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
//		int blocPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		//페이지당 갯수
		int pageSize = 10;
		//나타낼 블럭수
		int blockPage = 5;
		
		int pageNum = 1;
		//파라미터로 넘어오는 pageNum이 있다면 값을 얻어온다.
		String pageTemp = request.getParameter("pageNum");
		//값이 있다면 정수로 변환한 후 페이지 번호로 지정한다.
		if(pageTemp!= null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		//게시물 구간을 계산한다.
		int start = (pageNum-1)*pageSize+1;
		int end = pageNum*pageSize;
		
		//계산된 값은 Model로 전달되기 위해 Map컬렉션에 저장한다.
		map.put("start",start);
		map.put("end",end);
		return "modelAppealBoardList";
	}
}
