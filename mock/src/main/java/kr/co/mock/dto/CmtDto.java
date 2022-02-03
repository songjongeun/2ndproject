package kr.co.mock.dto;

public class CmtDto {
	
		private int c_id,f_id;

		private String userid,content,writeday;

		
		public int getC_id() {
			return c_id;
		}
		public void setC_id(int c_id) {
			this.c_id = c_id;
		}
		public int getF_id() {
			return f_id;
		}
		public void setF_id(int f_id) {
			this.f_id = f_id;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;

		}
		public String getWriteday() {
			return writeday;
		}
		public void setWriteday(String writeday) {
			this.writeday = writeday;
		}
}
