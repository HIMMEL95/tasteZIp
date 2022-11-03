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
	
	public List<Reservation> mypageReservationList(ReservationVo vo){ return sqlSession.selectList(namespace + ".mypageReservationList", vo); }
}
