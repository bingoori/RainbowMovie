package com.rainbow.web.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.web.mapper.ReplyMapper;


@Service
public class ReplyServiceImpl implements ReplyService{
	private static final Logger logger = LoggerFactory.getLogger(ReplyService.class);
	@Autowired SqlSession sqlSession; 
	@Autowired ReplyDTO reply;
	
	
	@Override
	public int insert(ReplyDTO reply) {
		logger.info("=== ReplyService : insert() === ");
		logger.info(" writerName = {}",reply.getWriterName());
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		return mapper.insert(reply);
	}

	@Override
	public List<ReplyDTO> getList(ReplyDTO reply) {
		logger.info("=== RecordService : getList() === ");
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		return mapper.getList();
	}

	@Override
	public List<ReplyDTO> getBySeq(ReplyDTO reply) {
		logger.info("=== RecordService : getByRelySeq() === ");
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		return mapper.selectBySeq(reply);
	}
	
	@Override
	public int count(ReplyDTO reply) {
		logger.info("=== replyService : count() === ");
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		return mapper.count(reply);
	}

	@Override
	public int update(ReplyDTO reply) {
		logger.info("replyService-update() 진입 후 댓글 = {}",reply.getReplyContent());
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = mapper.update(reply);
		return result;
	}

	@Override
	public int delete(ReplyDTO reply) {
		// 댓글 삭제
		logger.info("replyService-delete() 진입 후 댓글 = {}",reply.getReplyContent());
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = mapper.delete(reply);
		return result;
	
	}

	

}
