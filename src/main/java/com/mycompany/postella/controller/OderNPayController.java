package com.mycompany.postella.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.mycompany.postella.dto.Payment;
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
	
	/**
	 * 바로 구매 시 주문/결제 페이지 불러오기
	 * 
	 * @param quantity
	 * 			수량
	 * @param prdNo
	 * 			상품 옵션 식별 번호
	 * @param model
	 * @param session
	 * 			HttpSession
	 * @return	orderNpay/orderNpay
	 */
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
	
	/**
	 * 장바구니에서 구매 시 주문/결제 페이지 불러오기
	 * @param model
	 * @param session
	 * 			HttpSession
	 * @return orderNpay/orderNpay
	 */
	@RequestMapping("/orderFromCart")
	public String orderFromCart(@RequestParam(name="prd-no") String prd_no, @RequestParam(name="crt-qty") String quantity, Model model, HttpSession session) {
	    //사용자 식별 번호로 주문 정보 가져오기
	    Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
	    List<Cart> orderCart = (List<Cart>) session.getAttribute("cartItems");
	    
	    //prd_no 잘라서 저장하기
	    String[]  prdArray = prd_no.split(",");
	    
	    //quantity 잘라서 저장하기
	    String[]  quantityArray = quantity.split(",");
	    
	    //상품 리스트
	    List<Product> products = new ArrayList<>(); 
	    for(int i=0; i<prdArray.length; i++) {
	    	products.add(productService.getInfo(Integer.parseInt(prdArray[i])));
	    	products.get(i).setPg_name(productGroupService.getTitle(products.get(i).getPg_no()));
	    	products.get(i).setQuantity(Integer.parseInt(quantityArray[i]));
	    }
	    setOrderInfo(user, products, model);
	    
	    session.setAttribute("productList", products);
	    
	    return "orderNpay/orderNpay"; 
	}
	
	/**
	 * 구매자 정보 불러오기
	 * 
	 * @param user
	 * 			사용자 객체
	 * @param products
	 * 			주문 할 상품 리스트
	 * @param model
	 */
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
	
	/**
	 * 주소 변경하기 페이지 보여주기
	 * 
	 * @param session
	 * 			HttpSession
	 * @param model
	 * @return orderNpay/changeAddress
	 */
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
	
	/**
	 * 배송지 추가 처리
	 * 
	 * @param deliverAddress
	 * 				배송지 식별 번호
	 * @param session
	 * 			HttpSession
	 * @return redirect:/changeAddress
	 */
	@PostMapping("/addAddress")
	public String addAddressBook(DeliverAddress deliverAddress, HttpSession session) {
		//구매자 정보
	    Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
	    int us_no = user.getUs_no();
	    
	    //insert를 위해 추가적인 속성 넣어주기
	    deliverAddress.setUs_no(us_no);
	    deliverAddress.setDa_type("C");
	    
	    try {
	    	//기본 배송지로 추가 할 경우
	    	if(deliverAddress.getDa_main().equals("on")) {
		    	deliverAddress.setDa_main("Y");
		    	daService.cleanMainAdr(us_no);
		    	daService.putAddress(deliverAddress);
		    }
	    } catch (Exception e) {
	    	//기본 배송지로 추가 하지 않을 경우
	    	deliverAddress.setDa_main("N");
	    	daService.putAddress(deliverAddress);
		}
	    
		return "redirect:/changeAddress";
	}
	
	/**
	 * 배송지 추가 페이지 보여주기
	 * 
	 * @param model
	 * @return orderNpay/addAddress
	 */
	@GetMapping("/addAddress")
    public String addAddress(Model model) {
        
        return "orderNpay/addAddress"; 
    }
	
	/**
	 * 배송 요청 선택 페이지
	 * 
	 * @param model
	 * @return orderNpay/deliveryRequest
	 */
	@GetMapping("/deliveryRequest")
    public String addressRequest(Model model) {
        
        return "orderNpay/deliveryRequest"; 
    }
	
	/**
	 * 배송지 수정 페이지
	 * 
	 * @param model
	 * @return orderNpay/editAddress
	 */
	@GetMapping("/editAddress")
    public String editAddress(int da_no, Model model) {
        DeliverAddress da = daService.getAddress(da_no);
        model.addAttribute("address", da);
        return "orderNpay/editAddress"; 
    }
	
	/**
	 * 
	 * @param deliverAddress
	 * 			배송지 객체
	 * @param session
	 * 			HttpSession
	 * @return redirect:/changeAddress
	 */
	@PostMapping("/editAddress")
	public String saveEditedAddress(DeliverAddress deliverAddress, HttpSession session) {
		//구매자 정보
	    Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
	    int us_no = user.getUs_no();
	   
	    //기본 배송지로 수정 할 경우
	    if(deliverAddress.getDa_main().equals("on")) {
	    	deliverAddress.setDa_main("Y");
	    	daService.cleanMainAdr(us_no);
	    	daService.editAddress(deliverAddress);
	    } else {
	    	deliverAddress.setDa_main("N");
	    	daService.editAddress(deliverAddress);
	    }
	    
        return "redirect:/changeAddress"; 
    }
	
	/**
	 * 결제 정보 DB에 저장하기
	 * 
	 * @param session
	 * 			HttpSession
	 * @return ResponseEntity<String>
	 */
	@PostMapping("/insertOrder")
	@ResponseBody
    public ResponseEntity<String> insertOrder(HttpSession session, @RequestParam String payType, @RequestParam int usedPoint) {
		//세션에서 사용자 정보 가져오기
		Users user = (Users) session.getAttribute("userLogin");
	    int us_no = user.getUs_no();
	    
	    //세션에서 상품 리스트 정보 가져오기
	    List<Product> prdList = (List<Product>) session.getAttribute("productList");
	    
	    //Order 테이블의 값 설정
	    Orders order = new Orders();
	    order.setUs_no(us_no);
	    Date currentTime = new Date();
	    order.setOd_date(currentTime);
	    order.setOd_status("ODC");
	    order.setOd_item_cnt(prdList.size());
	    int od_no = ordersService.putOrder(order);
	    
	    //OrderDetail 테이블의 값 설정
	    List<OrderDetail> odList = new ArrayList<>();
	    for (Product product : prdList) {
	        OrderDetail orderDetail = new OrderDetail();
	        orderDetail.setPrd_no(product.getPrd_no());
	        orderDetail.setOd_detail_qty(product.getQuantity());
	        orderDetail.setOd_detail_price(product.getPrd_price());
	        orderDetail.setOd_no(od_no);
	        odList.add(orderDetail);
	    }
	    ordersService.putOrderDetail(odList);
	    
	    //Payment 테이블의 값 설정
	    Payment payment = new Payment();
	    payment.setOd_no(od_no);
	    payment.setPay_date(currentTime);
	    payment.setPay_method(payType);
	   
	    ordersService.putPayment(payment);
	    
	    
	    //포인트 잔액 업데이트하기
	    Map<String, Object> mapForPoint = new HashMap<>();
	    int newPoint = user.getUs_point() - usedPoint; 
	    mapForPoint.put("us_no", us_no);
	    mapForPoint.put("newPoint", newPoint);
	    ordersService.changePoint(mapForPoint);
	    
	    
	    return ResponseEntity.ok("success");
    }
	
	/**
	 * 주소 삭제하기
	 * 
	 * @param da_no
	 * 			배송지 식별 번호
	 * @return redirect:/changeAddress
	 */
	@RequestMapping("/deleteAddress")
    public String deleteAddress(int da_no) {
        daService.removeAddress(da_no);
        return "redirect:/changeAddress"; 
    }
	
}
