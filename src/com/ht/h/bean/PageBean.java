package com.ht.h.bean;

/**
 * ��ҳModel��
 * @author 
 *
 */
public class PageBean {

	private int page; // ��ǰҳ
	private int pageSize; // һҳ��ʾ�ĸ���
	@SuppressWarnings("unused")
	private int start;	//从第几条记录�?始查
	private int total;	//����������
	private int count;	//��ҳ��
	
	
	public PageBean(int page, int pageSize) {
		super();
		this.page = page;
		this.pageSize = pageSize;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getStart() {
		return (page-1)*pageSize;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCount() {
		count=total%pageSize==0 ? total/pageSize : total/pageSize+1;
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
