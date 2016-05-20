package com.rainbow.web.reply;

import java.util.List;


public interface ReplyService {
		public int insert(ReplyDTO reply); 
		public List<ReplyDTO> getList(ReplyDTO reply);
		public List<ReplyDTO> getBySeq(ReplyDTO reply);
		public int count(ReplyDTO reply);
		public int update(ReplyDTO reply);
		public int delete(ReplyDTO reply);
}
