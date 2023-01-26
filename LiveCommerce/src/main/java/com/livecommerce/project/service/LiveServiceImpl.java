package com.livecommerce.project.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.livecommerce.project.mapper.LiveMapper;
import com.livecommerce.project.vo.LiveVO;
import com.livecommerce.project.vo.ProductVO;
import com.livecommerce.project.vo.VideoVO;
/**
 * @author 신기원
 * @since 2023.01.17
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.17     신기원              최초 생성, 라이브 목록
 * 2023.01.19     신기원              실시간 영상 상세정보
 * 2023.01.21     신기원              실시간 영상 뷰 + 1 업데이트
 * 2023.01.21     신기원              라이브 등록
 * 2023.01.22	    김나형		    영상별 상품리스트
 * 2023.01.24	    신기원		  Video(모든 영상) 목록 조회
 * 2023.01.25	    신기원		   영상 다시보기
 * 2023.01.26	    신기원		  스케줄러로 라이브 상태 변경, 라이브 영상 저장하기, 라이브 수정하기
 * </pre>
 */

@Service
@Transactional(readOnly = true)
public class LiveServiceImpl implements LiveService{
	
	@Autowired
	private LiveMapper liveMapper;
	
	
	//라이브되는 영상 리스트
	@Override
	public List<LiveVO> liveList() {
		return liveMapper.liveList();
	}


	//실시간 영상 상세정보 받아오기
	@Override
	public LiveVO getLiveInfo(String liveId) {
		return liveMapper.getLiveInfo(liveId);
	}
	
	@Override
	public LiveVO getReplayInfo(String liveId) {
		return liveMapper.getReplayInfo(liveId);
	}


	@Override
	public void setLiveView(LiveVO liveVO) {
		liveMapper.setLiveView(liveVO);
	}


	@Override
	public int getLiveView(LiveVO liveVO) {
		
		return liveMapper.getLiveView(liveVO);
	}
	
	@Override
	public List<ProductVO> getLiveProductList(int ps_index){
		return liveMapper.getLiveProductList(ps_index);
	}
	
	// 라이브 생성과 라이브 ID 생성
	@Override
	public int createLive(LiveVO liveVO) throws ParseException {
		System.out.println(liveVO);
		int id = createName();
        String liveId = "live_"+Integer.toString(id);
        liveVO.setLiveId(liveId);
        
        //상태 설정
        String status = liveStatus(liveVO);
        liveVO.setLiveStatus(status);
		return liveMapper.createLive(liveVO);
	}
	
	@Override
	public int updateLive(LiveVO liveVO) throws ParseException {
		String status = liveStatus(liveVO);
        liveVO.setLiveStatus(status);
		return liveMapper.updateLive(liveVO);
	}
	
	private int createName() {
		LocalDateTime  nowDate = LocalDateTime .now();
        DateTimeFormatter dayFormat = DateTimeFormatter.ofPattern("yyMMdd");
        DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("HHmmss");
        String day = nowDate.format(dayFormat);
        String time = nowDate.format(timeFormat);
        return Math.abs(Integer.parseInt(day)-Integer.parseInt(time));
	}


	//등록 및 수정하는 라이브 날짜로 라이브 상태 변경하기
    public String liveStatus(LiveVO live) throws ParseException {
        LocalDateTime  localDate = LocalDateTime .now();
        DateTimeFormatter dayFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat dateFormat2 = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
        String nowDateTime = dayFormat.format(localDate);
        Date today = dateFormat2.parse(nowDateTime);
        Date startDate = dateFormat2.parse(live.getLiveStartTime()+":00");
        Date endDate = dateFormat2.parse(live.getLiveEndTime()+":00");
        
        int start = today.compareTo(startDate);  
        int end = today.compareTo(endDate);
        //1:크다(1) , 같다(0), 작다(-1)
        if(start < 0) {  //현재날짜는 시작 이전 날짜인가? 
            return "0";
        }else if(start>0 && end<0) { //시작날짜 < 현재날짜 > 종료날짜 => 라이브중 //입력한 날짜가 라이브중인 날짜이면
            Map<String,Object> liveMap = new HashMap<>();
            liveMap.put("mId",live.getMId());
            liveMap.put("liveId",live.getLiveId());
            liveMap.put("nowDateTime", nowDateTime);
            //라이브중인 게시물이 있는지 확인
            int count =  liveMapper.countLive1Status(liveMap);
            if(count>=1) {
                return "3";     //라이브중인 게시물이 있으면 라이브 불가로 상태 변경
            }else{
                return "1";
            }
        }else {         //종료
            return "2";
        }
    }
    
    //회원 ID에 따른 라이브 목록 조회
    @Override
    public List<LiveVO> myLiveList(String mId){
    	return liveMapper.myLiveList(mId);
    }


    //모든 영상 조회하기
	@Override
	public List<LiveVO> allVideoList() {
		return liveMapper.allVideoList();
	}


	@Override
	public String saveLiveVideo(String liveId) {
		//video Id 설정 
		String videoName = "";
		//파일 시스템 video 목록
		String[] files = videoFiles("C:/Users/kosa/Videos/live");
		//DB의 video 목록
		List<String> videos = liveMapper.onlyVideoList();
		
		//DB에 없는 video 이름으로 저장
		for(String name : files) {
			name = name.replaceAll("\\.\\w+$", "");
			if(!videos.contains(name)) {
				videoName = name;
			}
		}
		System.out.println(videoName);
		
		VideoVO videoVO = new VideoVO();
        String videoId = "video_" + Integer.toString(createName()); 
        videoVO.setVid(videoId);
        videoVO.setVname(videoName);
//        liveMapper.createVideo(video);
        
        LiveVO live = new LiveVO();
        live.setLiveId(liveId);
        live.setVideoId(videoId);
//		liveMapper.updateLiveVideo(live);
		if(liveMapper.createVideo(videoVO) == 0 || liveMapper.updateLiveVideo(live) == 0) {
			return null;
		}
		return "success";
	}
	
	public String[] videoFiles(String url){
		File dir = new File(url);
		return dir.list();
	}


	@Override
	public void updateLiveStatus() {
		liveMapper.updateLiveStatus();
	}


	


}
