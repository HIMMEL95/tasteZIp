package com.tasteZip.infra.modules.reservation;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tasteZip.infra.modules.member.Member;
import com.tasteZip.infra.modules.member.MemberVo;


@Repository
public class ReservationDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.tasteZip.infra.modules.reservation.ReservationMapper";
	
	public int uelete(Reservation dto) { return sqlSession.update(namespace + ".uelete", dto); }
	public int delete(ReservationVo vo) { return sqlSession.delete(namespace + ".delete", vo); }
	
	// list
	public List<Reservation> selectListMyRV(ReservationVo vo){ return sqlSession.selectList(namespace + ".selectListMyRV", vo); }
	
	
	// xdmin list
	public List<Reservation> selectList(ReservationVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	
	//selectOne
	public Reservation selectOneMyRV(ReservationVo vo) {
		Reservation result = sqlSession.selectOne(namespace + ".selectOneMyRV", vo);
		return result;
	}
	
	public Reservation selectOne(ReservationVo vo) {
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}
	
	// 주문 select
	public Reservation selectRV(ReservationVo vo) {
		return sqlSession.selectOne(namespace + ".selectRV", vo);
	}

	//selectone Count
	public int selectOneCount(ReservationVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	//list uele
	public int ueleteList(String ifrvSeq) {
		return sqlSession.update(namespace + ".ueleteList", ifrvSeq);
	}
	
	// 주문
	public int insertRV(Reservation dto) {
		return sqlSession.insert(namespace + ".insertRV", dto);
	}
		
}

