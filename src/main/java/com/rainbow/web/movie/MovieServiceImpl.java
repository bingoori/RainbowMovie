package com.rainbow.web.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.web.mapper.MovieMapper;

@Service
public class MovieServiceImpl implements MovieService{
	private static final Logger logger = LoggerFactory.getLogger(MovieService.class);
	@Autowired MovieDTO movie;
	@Autowired SqlSession session;
	
	@Override
	public int input(MovieDTO movie) {
		logger.info("MovieService-input{}");
		MovieMapper mapper = session.getMapper(MovieMapper.class);
		return mapper.insert(movie);
	}
	
	@Override
	public List<MovieDTO> getList(MovieDTO movie) {
		logger.info("MovieService-getList{}");
		MovieMapper mapper = session.getMapper(MovieMapper.class);
		return mapper.selectList(movie);
	}
	
	@Override
	public List<MovieDTO> getByName(MovieDTO movie) {
		logger.info("MovieService-getByName{}");
		MovieMapper mapper = session.getMapper(MovieMapper.class);
		return mapper.selectByName(movie);
	}

	@Override
	public List<MovieDTO> getBySearch(MovieDTO movie) {
		logger.info("MovieService-getBySearch{}");
		MovieMapper mapper = session.getMapper(MovieMapper.class);
		return mapper.selectBySearch(movie);
	}
	
	@Override
	public MovieDTO getBySeq(MovieDTO movie) {
		logger.info("MovieService-getBySeq{}");
		MovieMapper mapper = session.getMapper(MovieMapper.class);
		return mapper.selectBySeq(movie);
	}

	@Override
	public int count() {
		logger.info("MovieService-count{}");
		MovieMapper mapper = session.getMapper(MovieMapper.class);
		return mapper.count();
	}
	
	@Override
	public int countBySearch(MovieDTO movie) {
		logger.info("MovieService-countBySearch{}");
		MovieMapper mapper = session.getMapper(MovieMapper.class);
		return mapper.countBySearch(movie);
	}

	@Override
	public int update(MovieDTO movie) {
		logger.info("MovieService-update{}");
		MovieMapper mapper = session.getMapper(MovieMapper.class);
		return mapper.update(movie);
	}

	@Override
	public int remove(MovieDTO movie) {
		logger.info("MovieService-remove{}");
		MovieMapper mapper = session.getMapper(MovieMapper.class);
		return mapper.delete(movie);
	}

}
