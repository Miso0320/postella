package com.mycompany.postella.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.postella.dto.Cart;
import com.mycompany.postella.dto.DeliverAddress;
import com.mycompany.postella.dto.OrderDetail;
import com.mycompany.postella.dto.Orders;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.Users;
import com.mycompany.postella.dto.Wish;
import com.mycompany.postella.interceptor.Login;
import com.mycompany.postella.service.DeliverAddressService;
import com.mycompany.postella.service.OrdersService;
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
	
	@Autowired
	OrdersService ordersService;
	
	@RequestMapping("/orderFromDetailView")
	public String orderFromDetailView(@RequestParam(name="quantity", required=false) String quantity, @RequestParam(name="prdNo", required=false) String prdNo, Model model, HttpSession session) {
		
		//상품번호와 수량
		model.addAttribute("quantity", quantity);
	    model.addAttribute("prdNo", prdNo);
	    
	    //로그인한 유저 정보 가져오기
	    Users user = (Users) session.getAttribute("userLogin"); 
	    
	    //상품 리스트
	    List<Product> products = new ArrayList<>();
	    Product selectedPrd = productService.getInfo(Integer.parseInt(prdNo));
	    selectedPrd.setQuantity(Integer.parseInt(quantity));
	    selectedPrd.setPg_name(productGroupService.getTitle(selectedPrd.getPg_no()));
	    products.add(selectedPrd);
	   
	    setOrderInfo(user, products, model);
	    session.setAttribute("productList", products);
	    
	    return "orderNpay/orderNpay"; 
	}
	
	@RequestMapping("/orderFromCart")
	public String orderFromCart(Model model, HttpSession session) {
	    //사용자 식별 번호로 주문 정보 가져오기
	    Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
	    List<Cart> orderCart = (List<Cart>) session.getAttribute("cartItems");
	    
	    //상품 리스트
	    List<Product> products = new ArrayList<>(); 
	    for(int i=0; i<orderCart.size(); i++) {
	    	products.add(productService.getInfo(orderCart.get(i).getPrd_no()));
	    	products.get(i).setPg_name(productGroupService.getTitle(products.get(i).getPg_no()));
	    	products.get(i).setQuantity(orderCart.get(i).getCrt_qty());
	    }
	    setOrderInfo(user, products, model);
	    
	    session.setAttribute("productList", products);
	    
	    return "orderNpay/orderNpay"; 
	}
	
	public void setOrderInfo(Users user, List<Product> products, Model model) {
		//구매자 정보
		model.addAttribute("user",user);
		
		//받는 사람 정보 (default는 기본 배송지)
		DeliverAddress basicDa = daService.getBasicAddress(user.getUs_no());
	    model.addAttribute("basicDa",basicDa);
	    
	    //배송 예정일 가져오기 (2일 뒤)
  		LocalDate today = LocalDate.now();
  		LocalDate deliverDay = today.plusDays(2);
  		DateTimeFormatter fomatter = DateTimeFormatter.ofPattern("MM/dd");
  		String StrDeliverDay = fomatter.format(deliverDay);
  		model.addAttribute("deliverDay", StrDeliverDay);
  		
  		//상품 리스트
  		model.addAttribute("products",products);
  		
  		//총 상품 개수, 가격
  		int totalPrice = 0;
  		int totalCnt = products.size();
  		for(int i=0; i<products.size(); i++) {
  			totalPrice += products.get(i).getPrd_price() * products.get(i).getQuantity();
	    }
  		model.addAttribute("totalPrice",totalPrice);
  		model.addAttribute("totalCnt",totalCnt);
  		
  		//할인 쿠폰
  		int couponDc = 0;
  		model.addAttribute("couponDc",couponDc);
  		
  		//적립금
  		int point = 0;
  		model.addAttribute("point",point);
  		
  		//배송비
  		int shippingFee;
  		if(totalPrice >= 50000) {
  			shippingFee = 0;
  		} else {
  			shippingFee = 3000;
  		}
  		model.addAttribute("shippingFee",shippingFee);
  		
  		//입금 기한 (24시간 이내)
  		LocalDateTime depositLimit  = LocalDateTime.now().plusDays(1);
  		String formattedDepositLimit = depositLimit.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH시 mm분"));
  		model.addAttribute("depositDay", formattedDepositLimit);
  		
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
	
	//배송지 추가
	@PostMapping("/addAddress")
	public String addAddressBook(@ModelAttribute("deliverAddress") DeliverAddress deliverAddress, HttpSession session) {
		//구매자 정보
	    Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
	    int us_no = user.getUs_no();
	    
	    //insert를 위해 추가적인 속성 넣어주기!
	    deliverAddress.setUs_no(us_no);
	    deliverAddress.setDa_type("C");
	    
		daService.putAddress(deliverAddress);
		
		return "redirect:/changeAddress";
	}
	
	//배송지 추가 페이지
	@GetMapping("/addAddress")
    public String addAddress(Model model) {
        
        return "orderNpay/addAddress"; 
    }
	
	//배송 요청 선택 페이지
	@GetMapping("/deliveryRequest")
    public String addressRequest(Model model) {
        
        return "orderNpay/deliveryRequest"; 
    }
	
	//배송지 수정 페이지
	@GetMapping("/editAddress")
    public String editAddress(Model model) {
        
        return "orderNpay/editAddress"; 
    }
	
	//결제하기 버튼 (Orders, Order_Detail 추가)
	@PostMapping("/insertOrder")
	@ResponseBody
    public ResponseEntity<String> insertOrder(HttpSession session) {
		//세션에서 사용자 정보 가져오기
		Users user = (Users) session.getAttribute("userLogin");
	    int us_no = user.getUs_no();
	    
	    //세션에서 상품 리스트 정보 가져오기
	    List<Product> prdList = (List<Product>) session.getAttribute("productList");
	    List<OrderDetail> odList = new ArrayList<>();
	    
	    
	    //OrderDetail 테이블의 값 설정
	    for (Product product : prdList) {
	        OrderDetail orderDetail = new OrderDetail();
	        orderDetail.setPrd_no(product.getPrd_no());
	        orderDetail.setOd_detail_qty(product.getQuantity());
	        orderDetail.setOd_detail_price(product.getPrd_price());
	        odList.add(orderDetail);
	    }
	    
	    //Order 테이블의 값 설정
	    Orders order = new Orders();
	    order.setUs_no(us_no);
	    Date currentTime = new Date();
	    order.setOd_date(currentTime);
	    order.setOd_status("ODC");
	    order.setOd_item_cnt(prdList.size());
	    
	    //DB에 INSERT하기
	    ordersService.putOrderAndOrderDetail(order, odList);
	    
	    return ResponseEntity.ok("success");
    }
	
	//기존에 있는 주소를 기본 배송지로 변경
	@PostMapping("/updateAddressMain")
	public ResponseEntity<String> updateAddressMain(@RequestParam("da_no") int da_no) {

		daService.changeMainAdr(da_no);
        
        return ResponseEntity.ok("Success");
	}

	
}
