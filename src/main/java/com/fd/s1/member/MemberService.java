package com.fd.s1.member;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fd.s1.coupon.UserCouponVO;
import com.fd.s1.util.PhoneCheckVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	public int delMem(MemberVO memberVO)throws Exception{
		return memberMapper.delMem(memberVO);
	}
	
	public int setPwChange(MemberVO memberVO)throws Exception{
		return memberMapper.setPwChange(memberVO);
	}
	public int setUpdate(MemberVO memberVO)throws Exception{
		return memberMapper.setUpdate(memberVO);
	}
	
	public MemberVO idCheck(MemberVO memberVO)throws Exception{
		return memberMapper.idCheck(memberVO);
	}
	
	public int delPhoneCheck(LocalDate time)throws Exception{
		return memberMapper.delPhoneCheck(time);
	}
	public int updateCount(PhoneCheckVO phoneCheckVO)throws Exception{
		return memberMapper.updateCount(phoneCheckVO);
	}
	public List<PhoneCheckVO> hourNumber(PhoneCheckVO phoneCheckVO)throws Exception{
		return memberMapper.hourNumber(phoneCheckVO);
	}
	public PhoneCheckVO numCheck(PhoneCheckVO phoneCheckVO)throws Exception{
		return memberMapper.numCheck(phoneCheckVO);
	}
	
	public int setNumCheck(PhoneCheckVO phoneCheckVO)throws Exception{
		return memberMapper.setNumCheck(phoneCheckVO);
	}
	
	public MemberVO phoneCheck(MemberVO memberVO)throws Exception{
		return memberMapper.phoneCheck(memberVO);
	}
	
	public MemberVO findId(MemberVO memberVO)throws Exception{
		return memberMapper.findId(memberVO);
	}
	
	public MemberVO findPw(MemberVO memberVO)throws Exception{
		return memberMapper.findPw(memberVO);
	}
	
	public int join(MemberVO memberVO)throws Exception{
		return memberMapper.join(memberVO);
	}
	
	public MemberVO login(MemberVO memberVO)throws Exception{
		return memberMapper.login(memberVO);
	}
	public int setUserLog(MemberVO memberVO)throws Exception{		
		return memberMapper.setUserLog(memberVO);
	}	
	
	
	public int setCpRegister(UserCouponVO userCouponVO)throws Exception{
		
//		int result = memberMapper.cpCheck(userCouponVO);
//		return result;
		
		return memberMapper.setCpRegister(userCouponVO);
	}
	
	public List<UserCouponVO> getUserCoupon(UserCouponVO userCouponVO)throws Exception{
		return memberMapper.getUserCoupon(userCouponVO);
	}
	
}
