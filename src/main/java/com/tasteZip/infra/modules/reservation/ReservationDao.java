package com.tasteZip.infra.modules.reservation;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class ReservationDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.tasteZip.infra.modules.reservation.ReservationMapper";
	
	// list
	public List<Reservation> selectListMyRV(ReservationVo vo){ return sqlSession.selectList(namespace + ".selectListMyRV", vo); }
	
	
	// xdmin list
	public List<Reservation> selectList(ReservationVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	
	//selectOne
	public Reservation selectOneMyRV(ReservationVo vo) {
		Reservation result = sqlSession.selectOne(namespace + ".selectOneMyRV", vo);
		return result;
	}

	//selectone Count
	public int selectOneCount(ReservationVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	//list uele
	public int ueleteList(String ifrvSeq) {
		return sqlSession.update(namespace + ".ueleteList", ifrvSeq);
	}
		
}

