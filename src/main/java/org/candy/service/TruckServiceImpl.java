package org.candy.service;

import java.util.List;

import org.candy.domain.Criteria;
import org.candy.domain.TruckVO;
import org.candy.domain.UserTruckVO;
import org.candy.mapper.TruckMapper;
import org.candy.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class TruckServiceImpl implements TruckService{

	@Setter(onMethod_= {@Autowired})
	private TruckMapper mapper;
	
	@Setter(onMethod_= {@Autowired})
	private UserMapper userMapper;
	
	@Override
	public List<TruckVO> list(Criteria cri) {
	
		return mapper.list(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
	
		return mapper.getTotal(cri);
	}

	@Override
	@Transactional
	public void register(TruckVO vo) {
		
		mapper.register(vo);
		

		String[] files = vo.getFiles();
		log.info("d詐獣陥........"+vo.getFullname());
		if(files==null) {return ;}
		
		for(String fileName :files) {
			
			if(fileName.equals(vo.getFullname())) {
				
				mapper.addAttachRepresent(fileName);
				log.info("ぞぞぞぞぞ");
			}
			else{
				mapper.addAttach(fileName);}
		}
		
		//vo.fullname
	}

	@Override
	public TruckVO read(int fno) {
	
		return mapper.read(fno);
	}

	@Override
	@Transactional
	public void remove(int fno) {
		mapper.deleteAttach(fno);
		mapper.remove(fno);
	}


	@Override
	@Transactional
	public void modify(TruckVO vo) {
		
		log.info("modify vo........"+vo);
		mapper.deleteAttach(vo.getFno());
		
		
		String[] files = vo.getFiles();
		log.info("d詐獣陥........"+vo.getFullname());
		if(files==null) {return ;}
		
		for(String fileName :files) {
			
			if(fileName.equals(vo.getFullname())) {
				
				mapper.replaceAttachRepresent(fileName, vo.getFno());
				log.info("ぞぞぞぞぞ");
			}
			else{
				mapper.replaceAttach(fileName, vo.getFno());}
		}

		mapper.modify(vo);
	}

	/*@Override
	public int updateReviewCnt(Integer fno, int amount) {		
		return mapper.updateReviewCnt(fno,amount);
		
	}

	@Override
	public void updateViewCnt(Integer fno) {
		 mapper.updateViewCnt(fno);
		
	}*/

	@Override
	public List<String> getAttach(Integer fno) {

		return mapper.getAttach(fno);
	}

	@Override
	public void openClose(String uid, String value) {
		
		mapper.openClose(uid, value);
		
	}

	@Override
	public UserTruckVO readMyTruck(String uid) {
		
		return mapper.readMyTruck(uid);
	}

	
	
}
