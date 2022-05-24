package com.fd.s1.board.event;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fd.s1.util.Pager;

@Controller
@RequestMapping("/event/*")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@PostMapping("fileDelete")
	public ModelAndView setFileDelete(EventFilesVO fileVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = eventService.setFileDelete(fileVO);
		mv.addObject("result",result);
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("list")
	public ModelAndView getList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		pager.setPerPage(6);
		Long count = eventService.getTotal(pager);
		
		List<EventVO> ar = eventService.getList(pager, count);
		mv.addObject("list",ar);
		
		mv.addObject("count",count);
		mv.addObject("pager",pager);
		mv.setViewName("board/event/list");
		return mv;
	}
	
	//이벤트리스트 ajax
	@GetMapping("list1")
	public ModelAndView getList1(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		pager.setPerPage(6);
		Long count = eventService.getTotal(pager);
		
		List<EventVO> ar = eventService.getList(pager, count);
		mv.addObject("list",ar);
		
		mv.addObject("count",count);
		mv.addObject("pager",pager);
		mv.setViewName("board/event/eventList");
		System.out.println(pager.getStartRow());
		System.out.println(pager.getPerPage());
		return mv;
	}
	
	
	
	@GetMapping("add")
	public ModelAndView setAdd(@ModelAttribute EventVO eventVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/event/add");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(@Valid EventVO eventVO,BindingResult bindingResult,MultipartFile[] files, Event_couponVO ecVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
//		String [] str = eventSchedule1.split("/");
//		System.out.println(str[0]);
//		System.out.println(str[1]);
//		System.out.println(str[2]);		

//		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//		System.out.println(sdf.format(eventSchedule1));

//			String   s = "2020/01/01";

//			DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

//			Date d = (Date) sdf.parse(eventSchedule1);

//			System.out.println(d);


		
//		System.out.println("couponId : "+couponId);
		if(bindingResult.hasErrors()) {
			mv.setViewName("board/event/add");
			return mv;
		}
		int result = eventService.setAdd(eventVO,files);
		if(ecVO != null) {
			System.out.println(ecVO.getCouponId());
			System.out.println(eventVO.getEventNum());
			System.out.println(ecVO.getEventSchedule());
			eventService.setEventCouponAdd(ecVO);
		}

//		System.out.println("EventNum : "+eventVO.getEventNum());
				
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(EventVO eventVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		eventVO = eventService.getDetail(eventVO);
		mv.addObject("vo",eventVO);
		mv.setViewName("board/event/detail");
		return mv;
	}
	
	@PostMapping("delete")
	public  ModelAndView setDelete(EventVO eventVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(eventVO.getEventNum());
		int result = eventService.setDelete(eventVO);
		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("update")
	public  ModelAndView setUpdate(@ModelAttribute EventVO eventVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		eventVO = eventService.getDetail(eventVO);
		mv.addObject("eventVO",eventVO);
		mv.setViewName("board/event/update");
		return mv;
	}
	
	@PostMapping("update")
	public  ModelAndView setUpdate(@Valid EventVO eventVO,BindingResult bindingResult,MultipartFile[] files)throws Exception{
		ModelAndView mv = new ModelAndView();
		if(bindingResult.hasErrors()) {
			mv.setViewName("board/event/update");
			return mv;
		}
		eventService.setFileAdd(eventVO, files);
		eventService.setUpdate(eventVO);
		mv.setViewName("redirect:./list");
		return mv;
	}
}
