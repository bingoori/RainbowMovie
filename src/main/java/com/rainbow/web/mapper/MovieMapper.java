package com.rainbow.web.mapper;

import java.util.List;

import com.rainbow.web.movie.MovieDTO;

public interface MovieMapper {
	public int insert(MovieDTO movie);
	public List<MovieDTO> selectList(MovieDTO movie);
	public List<MovieDTO> selectByName(MovieDTO movie);
	public List<MovieDTO> selectBySearch(MovieDTO movie);
	public MovieDTO selectBySeq(MovieDTO movie);
	public int count();
	public int countBySearch(MovieDTO movie);
	public int update(MovieDTO movie);
	public int delete(MovieDTO movie);
}
