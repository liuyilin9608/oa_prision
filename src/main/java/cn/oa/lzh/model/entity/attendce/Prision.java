package cn.oa.lzh.model.entity.attendce;

import java.util.Date;

import javax.persistence.*;
/**
 * 犯人表
 * @author ThinkPad
 *
 */
@Entity
@Table(name="prision")
public class Prision {

	@Id
	@Column(name="prision_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long prisionId;		//犯人编号
	
	@Column(name = "prision_name")
	private String prisionName;		//犯人姓名 
	
	@Column(name = "prision_area")
	private int prisionArea;		//监区号 
	

	@Column(name = "prision_room")
	private int prisionRoom ;		//房间号

	@Column(name = "sex")
	private String sex;		//性别 

	@Column(name = "birthday")
	private Date birthday;		//生日 

	@Column(name = "intime")
	private Date intime;		//入狱时间 

	@Column(name = "inreason")
	private String inreason;//入狱原因  

	@Column(name = "prision_term_old")
	private int prisionTermOld;		//原刑期  
	
	@Column(name = "prision_term_new")
	private int prisionTermNew;		//现刑期  
	
	@Column(name = "change_term")
	private int changeTerm;		//现刑期  

	@Column(name = "change_reason")
	private String changeReason;//增减刑原因  

	@Column(name = "health")
	private String health;		//健康状况
	
	@Column(name = "education")
	private String education;	//受教育状况

	@Column(name = "work")
	private String work;		//工作情况

	@Column(name = "remark")
	private String remark;		//其它备注
	
	@Column(name = "is_lock")
	private int isLock;	  
	
	@Column(name = "police_id")
	private Long policeId;		//部门电话  

	public Long getPrisionId() {
		return prisionId;
	}

	public void setPrisionId(Long prisionId) {
		this.prisionId = prisionId;
	}

	public String getPrisionName() {
		return prisionName;
	}

	public void setPrisionName(String prisionName) {
		this.prisionName = prisionName;
	}

	public int getPrisionArea() {
		return prisionArea;
	}

	public void setPrisionArea(int prisionArea) {
		this.prisionArea = prisionArea;
	}

	public int getPrisionRoom() {
		return prisionRoom;
	}

	public void setPrisionRoom(int prisionRoom) {
		this.prisionRoom = prisionRoom;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Date getIntime() {
		return intime;
	}

	public void setIntime(Date intime) {
		this.intime = intime;
	}

	public String getInreason() {
		return inreason;
	}

	public void setInreason(String inreason) {
		this.inreason = inreason;
	}

	public int getPrisionTermOld() {
		return prisionTermOld;
	}

	public void setPrisionTermOld(int prisionTermOld) {
		this.prisionTermOld = prisionTermOld;
	}

	public int getPrisionTermNew() {
		return prisionTermNew;
	}

	public void setPrisionTermNew(int prisionTermNew) {
		this.prisionTermNew = prisionTermNew;
	}

	public int getChangeTerm() {
		return changeTerm;
	}

	public void setChangeTerm(int changeTerm) {
		this.changeTerm = changeTerm;
	}

	public String getChangeReason() {
		return changeReason;
	}

	public void setChangeReason(String changeReason) {
		this.changeReason = changeReason;
	}

	public String getHealth() {
		return health;
	}

	public void setHealth(String health) {
		this.health = health;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getIsLock() {
		return isLock;
	}

	public void setIsLock(int isLock) {
		this.isLock = isLock;
	}

	public Long getPoliceId() {
		return policeId;
	}

	public void setPoliceId(Long policeId) {
		this.policeId = policeId;
	}

	@Override
	public String toString() {
		return "Prision [prisionId=" + prisionId + ", prisionName="
				+ prisionName + ", prisionArea=" + prisionArea
				+ ", prisionRoom=" + prisionRoom + ", sex=" + sex
				+ ", birthday=" + birthday + ", intime=" + intime
				+ ", inreason=" + inreason + ", prisionTermOld="
				+ prisionTermOld + ", prisionTermNew=" + prisionTermNew
				+ ", changeTerm=" + changeTerm + ", changeReason="
				+ changeReason + ", health=" + health + ", education="
				+ education + ", work=" + work + ", remark=" + remark
				+ ", isLock=" + isLock + ", policeId=" + policeId + "]";
	}
}

