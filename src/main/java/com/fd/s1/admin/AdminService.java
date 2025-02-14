package com.fd.s1.admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fd.s1.coupon.CouponIssuanceLogVO;
import com.fd.s1.coupon.CouponMapper;
import com.fd.s1.coupon.CouponVO;
import com.fd.s1.coupon.UserCouponVO;
import com.fd.s1.email.EmailVO;
import com.fd.s1.member.MemberVO;
import com.fd.s1.shop.ShopVO;
import com.fd.s1.util.FileManager;
import com.fd.s1.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private CouponMapper couponMapper;		
	@Autowired
	private FileManager fileManager;
	
	public ShopVO getShopDetail(ShopVO shopVO) throws Exception {
		return adminMapper.getShopDetail(shopVO);
	}
	
	public List<ShopVO> getShopMaster() throws Exception {
		return adminMapper.getShopMaster();
	}
	
	//관리자 shop관리 - 리스트
	public List<ShopVO> getShop(Pager pager, Long count)throws Exception{
		pager.makeRow();
		pager.makeNum(count);		
		return adminMapper.getShop(pager);
	}
	
	//관리자 shop관리 - add
	public int setShopAdd(ShopVO shopVO) throws Exception{	
		return adminMapper.setShopAdd(shopVO);
	}
	
	//관리자 shop관리 - shopId 유효검사
	public int getShopId(MemberVO memberVO) throws Exception{	
		int result = adminMapper.getShopId(memberVO);
		if(result!=1) {
			return -1;
		}
		result = adminMapper.getShopExistence(memberVO);
		if(result!=0) {
			return -2;
		}
		return 1;
	}
	

	//관리자 shop관리 - delete
	public int setShopDelete(ShopVO shopVO) throws Exception{	
		return adminMapper.setShopDelete(shopVO);
	}
	
	//관리자 shop관리 - update
	public int setShopUpdate(ShopVO shopVO) throws Exception{	
		return adminMapper.setShopUpdate(shopVO);
	}
	
	//관리자 shop관리 - count
	public Long getShopListCount(Pager pager) throws Exception{	
		return adminMapper.getShopTotalCount(pager);
	}
	
	
	//관리자 멤버관리 - 리스트
	public List<MemberVO> getMember(Pager pager)throws Exception{

		pager.makeRow();
		pager.makeNum(adminMapper.getTotalCount(pager));
		System.out.println(pager.getPerPage());
		
		return adminMapper.getMember(pager);
	}
	
	//관리자 멤버관리 - count
	public Long getListCount(Pager pager) throws Exception{	
		return adminMapper.getTotalCount(pager);
	}
	
	public int setMemberGrade(MemberVO memberVO)throws Exception{

		if(memberVO != null) {
			return adminMapper.setMemberGrade(memberVO);
		}
		
		return 0;
	}

	
	//관리자 쿠폰관리 - 리스트
	public List<CouponVO> getCoupon(Pager pager, Long count)throws Exception{		
		pager.makeRow();
		pager.makeNum(count);
		System.out.println(pager.getPerPage());
		return adminMapper.getCoupon(pager);
	}
	
	//관리자 쿠폰관리 - count
	public Long getCouponListCount(Pager pager) throws Exception{	
		return adminMapper.getCouponTotalCount(pager);
	}
	
	//관리자 쿠폰관리 - add
	public int setCouponAdd(CouponVO couponVO) throws Exception{	
		return adminMapper.setCouponAdd(couponVO);
	}
	
	//관리자 유저쿠폰발급 - couponId 유효검사
	public int getCouponId(CouponVO couponVO) throws Exception{	
		return adminMapper.getCouponId(couponVO);
	}
	
	//관리자 쿠폰관리 - delete
	public int setCouponDelete(CouponVO couponVO) throws Exception{	
		return adminMapper.setCouponDelete(couponVO);
	}
	
	
	//관리자 쿠폰로그 - count
	public Long getCouponLogCount(Pager pager) throws Exception{	
		return adminMapper.getCouponLogCount(pager);
	}
	
	//관리자 쿠폰로그 - 리스트
	public List<CouponIssuanceLogVO> getCouponLog(Pager pager, Long count)throws Exception{		
		pager.makeRow();
		pager.makeNum(count);
		System.out.println(pager.getPerPage());
		return adminMapper.getCouponLog(pager);
	}
	
	
	
	
	
	public List<BannerFileVO> getBannerFileList() throws Exception {
		return adminMapper.getBannerFileList();
	}
	
	public int setBannerFileAdd(MultipartFile [] files) throws Exception {
		int result = 0;
		if(files != null) {
			for(MultipartFile f : files) {
				if(f.isEmpty()) {
					continue;
				}
				String fileName = fileManager.fileSave(f, "resources/upload/banner/");
				BannerFileVO bannerFileVO = new BannerFileVO();
				bannerFileVO.setFileName(fileName);
				bannerFileVO.setOriName(f.getOriginalFilename());
				result = adminMapper.setBannerFileAdd(bannerFileVO);
				if(result < 1) {
					throw new Exception();
				}
			}
		}
		return result;
	}
	
	public int setBannerFileDelete(BannerFileVO bannerFileVO) throws Exception {
		String fileName = bannerFileVO.getFileName();
		String path = "resources/upload/banner/";
		int result = 0;
		boolean check = fileManager.remove(fileName, path);
		if(check) {
			result = adminMapper.setBannerFileDelete(bannerFileVO);
		}
		return result;
	}
	
	//관리자 이메일 - count
	public Long getEmailListCount(Pager pager) throws Exception{	
		return adminMapper.getEmailTotalCount(pager);
	}
	
	//관리자 이메일 - 리스트
	public List<EmailVO> getEmail(Pager pager, Long count)throws Exception{		
		pager.makeRow();
		pager.makeNum(count);
		System.out.println(pager.getPerPage());
		return adminMapper.getEmail(pager);
	}
	
	//관리자 이메일멤버 - userEmail
	public Long getUserEmailCount(Pager pager) throws Exception{	
		return adminMapper.getUserEmailCount(pager);
	}
	//관리자 이메일멤버 - userEmail
	public List<MemberVO> getEmailMList(Pager pager) throws Exception{	
		return adminMapper.getEmailMList(pager);
	}
	
	
	
	public String [] getAll()throws Exception{
		return adminMapper.getAll();
	}
	public String [] getSeller()throws Exception{
		return adminMapper.getSeller();
	}
	public String [] getUser()throws Exception{
		return adminMapper.getUser();
	}
	
	
	
	//관리자 이메일 - send
	public Long setSend(EmailVO emailVO, MemberVO memberVO, String user, String password)throws Exception{		
		System.out.println(222);
//       String user = memberVO.getEmail(); // 네이버일 경우 네이버 계정, gmail경우 gmail 계정    	
//       String password = ""; // 패스워드        
        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });


        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user));            //수신자메일주소
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailVO.getReceiver())); 

        // Subject
        message.setSubject(emailVO.getTitle()); //메일 제목을 입력

        // Text
//        message.setText(emailVO.getContents());    //메일 내용을 입력
        message.setContent(emailVO.getContents(),"text/html; charset=euc-kr");
        // send the message
        System.out.println(4);
        
        Transport.send(message); ////전송
        System.out.println("message sent successfully...");
		
		
		
		System.out.println("받는이 : "+emailVO.getReceiver());
		return adminMapper.setSend(emailVO);
	}

	
	public Long setCouponCreate(UserCouponVO userCouponVO, CouponIssuanceLogVO couponLogVO) throws Exception {
		
		String [] randCharacter = {	"0","1","2","3","4",
									"5","6","7","8","9",
									"A","B","C","D","E",
									"F","G","H","I","J",
									"K","L","M","N","O",
									"P","Q","R","S","T",
									"U","V","W","X","Y","Z"};

		Random rd = new Random();

		int cpLength = 8;//쿠폰 글자수
		Long cur =couponLogVO.getCount();//생성 쿠폰 갯수
		Long result=-1L;
		StringBuffer couponNumTotal = new StringBuffer();
		
		while(0<cur) {
			StringBuffer sb = new StringBuffer();
			for(int i=0;i<cpLength;i++) {
				sb.append(randCharacter[rd.nextInt(36)]);//randCharacter[rd.nextInt(36)]
			}
			couponNumTotal.append(sb.toString()+",");
//			System.out.println("couponNUM : "+sb.toString());
			userCouponVO.setCouponNum(sb.toString());
			result = couponMapper.getOverlap(userCouponVO);// --여기 바꿔야함
			if(result==0) {
				userCouponVO.setCouponNum(sb.toString());				
				userCouponVO.setActiveDate(30L);//수신한 쿠폰번호는 30일동안 등록가능
				result = couponMapper.setUserCoupon(userCouponVO);				
//				System.out.println("에러나오는것");				
				cur--;
			}
//			else if(result==-5L){return result;}
			else {
				System.out.println("실패");
			}
		}
		couponLogVO.setCouponNum(couponNumTotal.toString());
		adminMapper.setCouponLog(couponLogVO);
		return result;
	}

	
	//관리자 생성유저쿠폰 삭제 + 쿠폰발급로그 삭제 - delete
	public int setUserCouponDelete(CouponIssuanceLogVO couponLogVO) throws Exception{	
		
		couponLogVO = adminMapper.getUserCoupon(couponLogVO);
		
		String [] str = couponLogVO.getCouponNum().split(",");
		int result=0;
		for(int i =0;i<str.length;i++) {
			UserCouponVO userCouponVO = new UserCouponVO();
			userCouponVO.setCouponNum(str[i]);
			result = adminMapper.setUserCouponDelete(userCouponVO);
		}
		
		result = adminMapper.setCouponLogDelete(couponLogVO);		
		return result;
	}
	
	public List<ShopVO> getShopList() throws Exception {
		return adminMapper.getShopList();
	}
	
	//관리자 분석 - 전체 점포 매출
	public List<AnalysisVO> getSalesTrend()throws Exception{		
		return adminMapper.getSalesTrend();
	}	
	
	//관리자 분석 - Hour Active User
	public List<AnalysisVO> getHAU()throws Exception{		
		return adminMapper.getHAU();
	}
	
	//관리자 분석 - 점포별 매출&주문건수
	public List<AnalysisVO> getShopSalesTrend()throws Exception{		
		return adminMapper.getShopSalesTrend();
	}	
	//관리자 분석 - 일반회원 성비
	public List<AnalysisVO> getGender()throws Exception{		
		return adminMapper.getGender();
	}	
	//관리자 분석 - 일반회원 나이대
	public List<AnalysisVO> getAge()throws Exception{		
		return adminMapper.getAge();
	}	
	
}
