package com.fd.s1.board.event;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fd.s1.util.FileManager;
import com.fd.s1.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class EventService {

	@Autowired
	private EventMapper eventMapper;
	@Autowired
	private FileManager fileManager;
	
	public int setFileAdd(EventVO eventVO,MultipartFile[] files)throws Exception {
		int result = 1;
		if(files!=null) {
			for(MultipartFile mf : files) {
				if(mf.isEmpty()) {
					continue;
				}
				String fileName = fileManager.fileSave(mf, "resources/upload/board/event/");
				EventFilesVO eventFilesVO = new EventFilesVO();
				eventFilesVO.setFileName(fileName);
				eventFilesVO.setOriName(mf.getOriginalFilename());
				eventFilesVO.setEventNum(eventVO.getEventNum());
				int result1 = eventMapper.setFileAdd(eventFilesVO);
				if(result1<1) {
					result = 0;
				}
			}
		}
		return result;
	}
	
	public int setFileDelete(EventFilesVO fileVO)throws Exception {
		String fileName = fileVO.getFileName();
		int result = eventMapper.setFileDelete(fileVO);
		if(result>0) {
			boolean result1 = fileManager.remove(fileName, "resources/upload/board/event/");
			if(!result1) {
				throw new SQLException();
			}
		}
		return result;
	}

	public List<EventVO> getList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(eventMapper.getTotal());
		return eventMapper.getList(pager);
	}

	public EventVO getDetail(EventVO eventVO) throws Exception {
		return eventMapper.getDetail(eventVO);
	}

	public int setAdd(EventVO eventVO, MultipartFile[] files) throws Exception {
		int result = eventMapper.setAdd(eventVO);
		if (files != null && result>0) {
			for (MultipartFile mf : files) {
				if(mf.isEmpty()) {
					continue;
				}
				String fileName = fileManager.fileSave(mf, "resources/upload/board/event/");
				EventFilesVO eventFilesVO = new EventFilesVO();
				eventFilesVO.setEventNum(eventVO.getEventNum());
				eventFilesVO.setFileName(fileName);
				eventFilesVO.setOriName(mf.getOriginalFilename());
				int result1 = eventMapper.setFileAdd(eventFilesVO);
				if (result1 < 1) {
					throw new SQLException();
				}
			}
		}
		return result;
	}

	public int setUpdate(EventVO eventVO) throws Exception {
		return eventMapper.setUpdate(eventVO);
	}

	public int setDelete(EventVO eventVO) throws Exception {
		int result = eventMapper.setDelete(eventVO);
		if (result > 0) {
			List<EventFilesVO> ar = eventMapper.getFileList(eventVO);
			if (ar.size() > 0) {
				for (EventFilesVO vo : ar) {
					boolean check = fileManager.remove(vo.getFileName(), "resources/upload/board/event/");
					if (check) {
						eventMapper.setFileDelete(vo);
					}
				}
			}
		}
		return result;
	}

}
