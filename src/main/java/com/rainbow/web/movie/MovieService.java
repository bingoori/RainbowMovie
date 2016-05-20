package com.rainbow.web.movie;

import java.util.List;

public interface MovieService {
	public int input(MovieDTO movie);
	public List<MovieDTO> getList(MovieDTO movie);
	public List<MovieDTO> getByName(MovieDTO movie);
	public List<MovieDTO> getBySearch(MovieDTO movie);
	public MovieDTO getBySeq(MovieDTO movie);
	public int count();
	public int countBySearch(MovieDTO movie);
	public int update(MovieDTO movie);
	public int remove(MovieDTO movie);	
}
