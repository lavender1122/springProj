package kr.or.ddit.vo;


import java.util.ArrayList;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

//POHO가 약해짐
@Data
public class MemberVO {
	private String userId;
	private String userName="hongkd";
	private String password="1234";
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private int    coin;
	private String gender;
    private String nationality;
    private String cars;
    private String[] carArray;
    private ArrayList<String> carList;
    private String hobby;
    private String[] hobbyArray;
    private ArrayList<String> hobbyList;
    private String developer;
    private boolean foreigner;
    
    //중첩된(nested) 자바빈즈
    private Address address;
}
