package cn.oa.lzh.model.entity.archive;

import javax.persistence.*;
import java.util.Date;


/**
 * 档案表
 * 
 */
@Entity
@Table(name = "archive")
public class Archive{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="arch_id")
	private Long archId;
	
	@Column(name="title") 
    private String title;
	
	@Column(name="subtitle")
	private String subtitle;
	
	@Column(name="classno")
	private String classno;
	
	@Column(name="roomno")
	private String roomno;
	
	@Column(name="totelno")
	private String totelno;
	
	@Column(name="minino")
	private String minino;

	@Column(name="entityno")
	private String entityno;
	
	@Column(name="archno")
	private String archno;
	
	@Column(name="retention")
	private String retention;
	
	@Column(name="security_level")
	private int securityLevel;
	
	@Column(name="note")
	private String note;
	
	@Column(name="first_resp")
	private String firstResp;
	
	@Column(name="other_resp")
	private String otherResp;

	@Column(name = "page")
	private int page;

	@Column(name="norm")
	private String norm;

	@Column(name="begin_time")
	private Date beginTime;

	@Column(name="end_time")
	private Date endTime;

	@Column(name="keyword")
	private String keyword;

	@Column(name="input_time")
	private Date inputTime;

	public Long getArchId() {
		return archId;
	}

	public void setArchId(Long archId) {
		this.archId = archId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getClassno() {
		return classno;
	}

	public void setClassno(String classno) {
		this.classno = classno;
	}

	public String getRoomno() {
		return roomno;
	}

	public void setRoomno(String roomno) {
		this.roomno = roomno;
	}

	public String getTotelno() {
		return totelno;
	}

	public void setTotelno(String totelno) {
		this.totelno = totelno;
	}

	public String getMinino() {
		return minino;
	}

	public void setMinino(String minino) {
		this.minino = minino;
	}

	public String getEntityno() {
		return entityno;
	}

	public void setEntityno(String entityno) {
		this.entityno = entityno;
	}

	public String getArchno() {
		return archno;
	}

	public void setArchno(String archno) {
		this.archno = archno;
	}

	public String getRetention() {
		return retention;
	}

	public void setRetention(String retention) {
		this.retention = retention;
	}

	public int getSecurityLevel() {
		return securityLevel;
	}

	public void setSecurityLevel(int securityLevel) {
		this.securityLevel = securityLevel;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getFirstResp() {
		return firstResp;
	}

	public void setFirstResp(String firstResp) {
		this.firstResp = firstResp;
	}

	public String getOtherResp() {
		return otherResp;
	}

	public void setOtherResp(String otherResp) {
		this.otherResp = otherResp;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getNorm() {
		return norm;
	}

	public void setNorm(String norm) {
		this.norm = norm;
	}

	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Date getInputTime() {
		return inputTime;
	}

	public void setInputTime(Date inputTime) {
		this.inputTime = inputTime;
	}

	@Override
	public String toString() {
		return "Archive [archId=" + archId + ", title=" + title + ", subtitle="
				+ subtitle + ", classno=" + classno + ", roomno=" + roomno
				+ ", totelno=" + totelno + ", minino=" + minino + ", entityno="
				+ entityno + ", archno=" + archno + ", retention=" + retention
				+ ", securityLevel=" + securityLevel + ", note=" + note
				+ ", firstResp=" + firstResp + ", otherResp=" + otherResp
				+ ", page=" + page + ", norm=" + norm + ", beginTime="
				+ beginTime + ", endTime=" + endTime + ", keyword=" + keyword
				+ ", inputTime=" + inputTime + "]";
	}
	
	
}
	

	
	

	

	

	

	

	

	

	

	


