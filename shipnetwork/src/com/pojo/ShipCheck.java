package com.pojo;

import java.util.List;

public class ShipCheck {

	private String id;
	private String mmsi; // 9位码
	private String name; // 船名
	private String site; // 监测站点
	private String direction; // 方向  0上 1下
	private String checkTime; // 监测时间
	private String dvrStartTime; // 录像开始时间
	private String dvrEndTime; // 录像截止时间
	private String ais; // AIS状态  0无1有
	private String report; // 报港  0异常1正常
	private String arrearage; // 欠费  0无1有
	private String overdue; // 过期  0无1有
	private String peccancy; // 违章 0无1有
	private String blacklist; // 黑名单 0否1是
	private List<ShipPhoto> photos; // 船抓拍图片

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMmsi() {
		return mmsi;
	}

	public void setMmsi(String mmsi) {
		this.mmsi = mmsi;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}

	public String getDvrStartTime() {
		return dvrStartTime;
	}

	public void setDvrStartTime(String dvrStartTime) {
		this.dvrStartTime = dvrStartTime;
	}

	public String getDvrEndTime() {
		return dvrEndTime;
	}

	public void setDvrEndTime(String dvrEndTime) {
		this.dvrEndTime = dvrEndTime;
	}

	public String getAis() {
		return ais;
	}

	public void setAis(String ais) {
		this.ais = ais;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public String getArrearage() {
		return arrearage;
	}

	public void setArrearage(String arrearage) {
		this.arrearage = arrearage;
	}

	public String getOverdue() {
		return overdue;
	}

	public void setOverdue(String overdue) {
		this.overdue = overdue;
	}

	public String getPeccancy() {
		return peccancy;
	}

	public void setPeccancy(String peccancy) {
		this.peccancy = peccancy;
	}

	public String getBlacklist() {
		return blacklist;
	}

	public void setBlacklist(String blacklist) {
		this.blacklist = blacklist;
	}

	public List<ShipPhoto> getPhotos() {
		return photos;
	}

	public void setPhotos(List<ShipPhoto> photos) {
		this.photos = photos;
	}

}
