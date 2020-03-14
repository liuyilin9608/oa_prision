package cn.oa.lzh.model.entity.archive;

import java.io.Serializable;

import javax.persistence.*;

import cn.oa.lzh.model.entity.process.ProcessList;


/**
 * 借调档案表
 * 
 */
@Entity
@Table(name="archive_borrow")
public class ArchiveBorrow implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="borrow_id")
	private Long borrowId;

	@Column(name="type_id")
	private int typeId;
	
	@Column(name="borrow_days")
	private int borrowDays;

	@Column(name="borrow_reason")
	private String borrowReason;
	
	@Column(name="arch_advice")
	private String archAdvice;

	@OneToOne(cascade=CascadeType.ALL)  //流程id
	@JoinColumn(name="pro_id")
	private ProcessList proId;

	@Transient
	private String auditor; //审核人

	public void setProId(ProcessList proId) {
		this.proId = proId;
	}

	public Long getBorrowId() {
		return borrowId;
	}

	public void setBorrowId(Long borrowId) {
		this.borrowId = borrowId;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public int getBorrowDays() {
		return borrowDays;
	}

	public void setBorrowDays(int borrowDays) {
		this.borrowDays = borrowDays;
	}

	public String getBorrowReason() {
		return borrowReason;
	}

	public void setBorrowReason(String borrowReason) {
		this.borrowReason = borrowReason;
	}

	public String getArchAdvice() {
		return archAdvice;
	}

	public void setArchAdvice(String archAdvice) {
		this.archAdvice = archAdvice;
	}

	public String getAuditor() {
		return auditor;
	}

	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ArchiveBorrow [borrowId=" + borrowId + ", typeId="+ typeId
				+ ", borrowDays=" + borrowDays + ", borrowReason="
				+ borrowReason + ", archAdvice=" + archAdvice + ", proId="
				+ proId + ", auditor=" + auditor + "]";
	}
	

}