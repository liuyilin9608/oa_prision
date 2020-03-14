package cn.oa.lzh.model.entity.document;


import javax.persistence.*;

import cn.oa.lzh.model.entity.process.ProcessList;


/**
 * 公文表
 * 
 */
@Entity
@Table(name="document")
public class Document {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="document_id")
	private Long documentId;  
	
	@Column(name="title")     //题目
	private String title;
	
	@Column(name="theme")     //主题
	private String theme;
	
	@Column(name="manager_advice") //上级领导意见
	private String managerAdvice;
	
	@Column(name="admin_advice")   //行政办公室主任意见
	private String adminAdvice;

	@Column(name="print_remark")       //印刷备注
	private int printRemark;
	
	@OneToOne(cascade=CascadeType.ALL)  //流程id
	@JoinColumn(name="pro_id")
	private ProcessList proId;
	
	@Transient
	private String auditor; //审核人

	public Long getDocumentId() {
		return documentId;
	}

	public void setDocumentId(Long documentId) {
		this.documentId = documentId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getManagerAdvice() {
		return managerAdvice;
	}

	public void setManagerAdvice(String managerAdvice) {
		this.managerAdvice = managerAdvice;
	}

	public String getAdminAdvice() {
		return adminAdvice;
	}

	public void setAdminAdvice(String adminAdvice) {
		this.adminAdvice = adminAdvice;
	}

	public int getPrintRemark() {
		return printRemark;
	}

	public void setPrintRemark(int printRemark) {
		this.printRemark = printRemark;
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

	@Override
	public String toString() {
		return "Document [documentId=" + documentId + ", title=" + title
				+ ", theme=" + theme + ", managerAdvice=" + managerAdvice
				+ ", adminAdvice=" + adminAdvice + ", printRemark="
				+ printRemark + ", proId=" + proId + ", auditor=" + auditor
				+ "]";
	}
}