package com.MyBlog.entity;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.google.common.collect.ImmutableMap;

public class trainData {
private String key_check_isChange;
private String leftTicket;
private String repeat_submit_token;
private String trainUserName;
private String trainPassWord;
private String fromStationTelecode;
private String toStationTelecode;
private String stationTrainCode;
private String train_no;
private String train_location;
private String seatType;
private String train_date;
private String tour_flag;
private String trainStartDateTime;
private String trainNeedDateTime;
private String purpose_codes;
private String fromStationName;
private String toStationTeleName;
private String start_time;
private String trainQueryDate;
private Set<String> taskTrainQueryDate=new HashSet<>();
private String passengerTicketStr;
private String oldPassengerStr;
private boolean isStart=false;
private boolean isComplete=false;
private String remark;
private String email;
private  List<String> msgList=new LinkedList<>();
private Integer executeCount=0;
private LocalDateTime lastExecuteTime=LocalDateTime.now();
private Long delayTime=0L;


/*
private String sex_code;
private String sex_name;
private String passenger_id_type_code;
private String passenger_id_no;
private String passenger_id_type_name;
*/
public final static String REPEAT_SUBMIT_TOKENinitDc="var globalRepeatSubmitToken = '";
public final static String key_check_isChangeinitDc="'key_check_isChange':'";
public final static String leftTicketStrinitDc="'leftTicketStr':'";
public final static String CLeftTicketUrlStr="var CLeftTicketUrl = '";
public static Map<String,String> seatMap=ImmutableMap.<String, String>builder()
.put("9","商务座")
.put("M","一等座")
.put("O","二等座")
.put("6","高级软卧")
.put("4","软卧")
.put("3","硬卧")
.put("2","软座")
.put("1","硬座")
.build();

public String getKey_check_isChange() {
	return key_check_isChange;
}
public void setKey_check_isChange(String key_check_isChange) {
	this.key_check_isChange = key_check_isChange;
}

public String getRepeat_submit_token() {
	return repeat_submit_token;
}
public void setRepeat_submit_token(String repeat_submit_token) {
	this.repeat_submit_token = repeat_submit_token;
}
public String getTrainUserName() {
	return trainUserName;
}
public void setTrainUserName(String trainUserName) {
	this.trainUserName = trainUserName;
}
public String getTrainPassWord() {
	return trainPassWord;
}
public void setTrainPassWord(String trainPassWord) {
	this.trainPassWord = trainPassWord;
}
public String getLeftTicket() {
	return leftTicket;
}
public void setLeftTicket(String leftTicket) {
	this.leftTicket = leftTicket;
}
public String getFromStationTelecode() {
	return fromStationTelecode;
}
public void setFromStationTelecode(String fromStationTelecode) {
	this.fromStationTelecode = fromStationTelecode;
}
public String getToStationTelecode() {
	return toStationTelecode;
}
public void setToStationTelecode(String toStationTelecode) {
	this.toStationTelecode = toStationTelecode;
}
public String getStationTrainCode() {
	return stationTrainCode;
}
public void setStationTrainCode(String stationTrainCode) {
	this.stationTrainCode = stationTrainCode;
}
public String getTrain_no() {
	return train_no;
}
public void setTrain_no(String train_no) {
	this.train_no = train_no;
}
public String getTrain_location() {
	return train_location;
}
public void setTrain_location(String train_location) {
	this.train_location = train_location;
}
public String getSeatType() {
	return seatType;
}
public void setSeatType(String seatType) {
	this.seatType = seatType;
}
public String getTrain_date() {
	return train_date;
}
public void setTrain_date(String train_date) {
	this.train_date = train_date;
}
public String getTour_flag() {
	return tour_flag;
}
public void setTour_flag(String tour_flag) {
	this.tour_flag = tour_flag;
}
public String getPurpose_codes() {
	return purpose_codes;
}
public void setPurpose_codes(String purpose_codes) {
	this.purpose_codes = purpose_codes;
}
public String getFromStationName() {
	return fromStationName;
}
public void setFromStationName(String fromStationName) {
	this.fromStationName = fromStationName;
}
public String getToStationTeleName() {
	return toStationTeleName;
}
public void setToStationTeleName(String toStationTeleName) {
	this.toStationTeleName = toStationTeleName;
}
public String getStart_time() {
	return start_time;
}
public void setStart_time(String start_time) {
	this.start_time = start_time;
}

public String getPassengerTicketStr() {
	return passengerTicketStr;
}
public void setPassengerTicketStr(String passengerTicketStr) {
	this.passengerTicketStr = passengerTicketStr;
}
public String getOldPassengerStr() {
	return oldPassengerStr;
}
public void setOldPassengerStr(String oldPassengerStr) {
	this.oldPassengerStr = oldPassengerStr;
}
public boolean getIsStart() {
	return isStart;
}

public boolean isStart() {
	return isStart;
}
public void setStart(boolean isStart) {
	this.isStart = isStart;
}
public boolean getIsComplete() {
	return isComplete;
}
public boolean isComplete() {
	return isComplete;
}
public void setComplete(boolean isComplete) {
	this.isComplete = isComplete;
}
public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
}
public List<String> getMsgList() {
	List<String> list=new ArrayList<>(msgList);
	
	Collections.reverse(list);
	return list;
}
public void setMsgList(List<String> msgList) {
	this.msgList = msgList;
}
public void addMsgList(String msg) {

		
	msgList.add(msg);
	
	if(msgList.size()>50) {
		for(int i=0;i<25;i++) {
			msgList.remove(0);
		}
	}

}
public int getExecuteCount() {
	return executeCount;
}
public void setExecuteCount(int executeCount) {
	this.executeCount = executeCount;
}
public synchronized void addExecuteCount() {
	 executeCount++;
}
public String getTrainQueryDate() {
	return trainQueryDate;
}
public void setTrainQueryDate(String trainQueryDate) {
	this.trainQueryDate = trainQueryDate;
}
public LocalDateTime getLastExecuteTime() {
	return lastExecuteTime;
}
public void setLastExecuteTime(LocalDateTime lastExecuteTime) {
	this.lastExecuteTime = lastExecuteTime;
}
public Long getDelayTime() {
	return delayTime;
}
public void setDelayTime(Long delayTime) {
	this.delayTime = delayTime;
}
public String getShowlastExecuteTime() {

	return lastExecuteTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
}
public String getTrainStartDateTime() {
	return trainStartDateTime;
}
public void setTrainStartDateTime(String trainStartDateTime) {
	this.trainStartDateTime = trainStartDateTime;
}
public String getTrainNeedDateTime() {
	return trainNeedDateTime;
}

public String getTrainDate() {
	return train_date+" "+trainStartDateTime;
}
public void setTrainNeedDateTime(String trainNeedDateTime) {
	this.trainNeedDateTime = trainNeedDateTime;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}



}
