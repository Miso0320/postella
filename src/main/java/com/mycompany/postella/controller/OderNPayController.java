package com.mycompany.postella.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.postella.dto.DeliverAddress;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.Users;
import com.mycompany.postella.service.DeliverAddressService;
import com.mycompany.postella.service.ProductGroupService;
import com.mycompany.postella.service.productService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OderNPayController {
	
	@Autowired
	DeliverAddressService daService;
	
	@Autowired
	productService productService;
	
	@Autowired
	ProductGroupService productGroupService;
	
	@RequestMapping("/orderFromDetailView")
	public String orderFromDetailView(@RequestParam(name="quantity", required=false) String quantity, @RequestParam(name="prdNo", required=false) String prdNo, Model model, HttpSession session) {
		
		//상품번호와 수량
		model.addAttribute("quantity", quantity);
	    model.addAttribute("prdNo", prdNo);
	    
	    //사용자 식별 번호로 주문 정보 가져오기
	    Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
	    setOrderInfo(user, model);
	    
	    //상품 리스트
	    List<Product> products = new ArrayList<>();
	    Product selectedPrd = productService.getInfo(Integer.parseInt(prdNo));
	    selectedPrd.setQuantity(Integer.parseInt(quantity));
	    selectedPrd.setPg_name(productGroupService.getTitle(selectedPrd.getPg_no()));
	    products.add(selectedPrd);
	    model.addAttribute("products",products);
	    
	    return "orderNpay/orderNpay"; 
	}
	
	@RequestMapping("/orderFromCart")
	public String orderFromCart(@RequestParam("products") List<Product> products, Model model, HttpSession session) {
	    //사용자 식별 번호로 주문 정보 가져오기
	    Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
	    setOrderInfo(user, model);
	    
	    //상품 리스트
	    for(int i=0; i<products.size(); i++) {
	    	products.get(i).setPg_name(productGroupService.getTitle(products.get(i).getPg_no()));
	    }
	    model.addAttribute("products",products);
	    
	    return "orderNpay/orderNpay"; 
	}
	
	public void setOrderInfo(Users user, Model model) {
		//구매자 정보
		model.addAttribute("user",user);
		
		//받는 사람 정보 (default는 기본 배송지)
		DeliverAddress basicDa = daService.getBasicAddress(user.getUs_no());
	    model.addAttribute("basicDa",basicDa);
	    
	    //배송 예정일 가져오기
  		LocalDate today = LocalDate.now();
  		LocalDate deliverDay = today.plusDays(2);
  		DateTimeFormatter fomatter = DateTimeFormatter.ofPattern("MM/dd");
  		String StrDeliverDay = fomatter.format(deliverDay);
  		model.addAttribute("deliverDay", StrDeliverDay);
	}
	
	@GetMapping("/changeAddress")
	public String changeAddress(HttpSession session, Model model) {
		
		//구매자 정보
	    Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
	    int us_no = user.getUs_no();
		
	    //전체 배송지
	    List<DeliverAddress> daList = daService.getAddressList(us_no);
	    model.addAttribute("daList", daList);
	    
		return "orderNpay/changeAddress"; 
	}
	
	@PostMapping("/addAddress")
	public String addAddressBook(@ModelAttribute("deliverAddress") DeliverAddress deliverAddress, HttpSession session) {
		//구매자 정보
	    Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
	    int us_no = user.getUs_no();
	    
	    //insert를 위해 추가적인 속성 넣어주기
	    deliverAddress.setUs_no(us_no);
	    deliverAddress.setDa_type("C");
	    
		daService.putAddress(deliverAddress);
		
		return "redirect:/changeAddress";
	}
	
	
	@GetMapping("/addAddress")
    public String addAddress(Model model) {
        
        return "orderNpay/addAddress"; 
    }
	
	@GetMapping("/deliveryRequest")
    public String addressRequest(Model model) {
        
        return "orderNpay/deliveryRequest"; 
    }
	
	@GetMapping("/editAddress")
    public String editAddress(Model model) {
        
        return "orderNpay/editAddress"; 
    }
	
}
