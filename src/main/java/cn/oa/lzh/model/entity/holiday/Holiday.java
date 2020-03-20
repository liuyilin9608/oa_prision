package cn.oa.lzh.model.entity.holiday;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import cn.oa.lzh.model.entity.process.ProcessList;
import cn.oa.lzh.model.entity.user.User;


@Table
@Entity(name="holiday")
//请假表
public class Holiday {
	@Id
	@Column(name="holiday_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long holidayId;
	
	@Column(name="type_id")
	private Long typeId;  //请假类型
	
	@Column(name="leave_days")
	private int leaveDays; //请假天数
	
	@Column(name="leave_reason")
	private String leaveReason;//请假原因
	
	
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="pro_id")
	private ProcessList proId;
	
	@Column(name="manager_advice")
	private String managerAdvice;//经理意见及说明
	
	@Transient
	private String auditor; //审核人
	
	@OneToOne
	@JoinColumn(name="hand_user")
	private User handUser; //工作交接人员
	
	@Transient
	private String handuser;//交接人员

	public String getHanduser() {
		return handuser;
	}

	public void setHanduser(String handuser) {
		this.handuser = handuser;
	}

	public Long getHolidayId() {
		return holidayId;
	}

	public void setHolidayId(Long holidayId) {
		this.holidayId = holidayId;
	}

	public Long getTypeId() {
		return typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public int getLeaveDays() {
		return leaveDays;
	}

	public void setLeaveDays(int leaveDays) {
		this.leaveDays = leaveDays;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}

	public User getHandUser() {
		return handUser;
	}

	public void setHandUser(User handUser) {
		this.handUser = handUser;
	}

	public ProcessList getProId() {
		return proId;
	}

	public void setProId(ProcessList proId) {
		this.proId = proId;
	}

	public String getManagerAdvice() {
		return managerAdvice;
	}

	public void setManagerAdvice(String managerAdvice) {
		this.managerAdvice = managerAdvice;
	}

	public String getAuditor() {
		return auditor;
	}

	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}

	@Override
	public String toString() {
		return "Holiday [holidayId=" + holidayId + ", typeId=" + typeId
				+ ", leaveDays=" + leaveDays + ", leaveReason=" + leaveReason
				+ ", handUser=" + handUser + ", proId=" + proId
				+ ", managerAdvice=" + managerAdvice + ", auditor=" + auditor
				+ "]";
	}
	
}