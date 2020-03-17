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

	@Column(name="archno")
	private String archno;

	@Column(name="title")
	private String title;
	
	@Column(name="borrow_days")
	private int borrowDays;

	@Column(name="borrow_reason")
	private String borrowReason;
	
	@Column(name="arch_advice")
	private String archAdvice;

	@Column(name="manager_advice")
	private String managerAdvice;
	
	@OneToOne(cascade=CascadeType.ALL)  //流程id
	@JoinColumn(name="pro_id")
	private ProcessList proId;

	@Transient
	private String auditor; //审核人

	public Long getBorrowId() {
		return borrowId;
	}

	public void setBorrowId(Long borrowId) {
		this.borrowId = borrowId;
	}

	public String getArchno() {
		return archno;
	}

	public void setArchno(String archno) {
		this.archno = archno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getManagerAdvice() {
		return managerAdvice;
	}

	public void setManagerAdvice(String managerAdvice) {
		this.managerAdvice = managerAdvice;
	}

	public ProcessList getProId() {
		return proId;
	}

	public void setProId(ProcessList proId) {
		this.proId = proId;
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
		return "ArchiveBorrow [borrowId=" + borrowId + ", archno=" + archno
				+ ", title=" + title + ", borrowDays=" + borrowDays
				+ ", borrowReason=" + borrowReason + ", archAdvice="
				+ archAdvice + ", managerAdvice=" + managerAdvice + ", proId="
				+ proId + ", auditor=" + auditor + "]";
	}
}