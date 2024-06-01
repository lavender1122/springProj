package kr.or.ddit.vo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

import lombok.Data;

@Data
public class ProductVO {
	@NotBlank(message = "상품아이디를 입력해주세요")
	private String productId;
	@NotBlank(message = "상품명을 입력해수제요")
	private String pname;
	@Range(min=1,message = "상품 가격을 입력해주세요")
	private int unitPrice;
	@NotBlank
	private String description;
	private String manufacturer;
	private String category;
	private int unitsInStock;
	private String condition;
	private String filename;
	private int quantity;
}
