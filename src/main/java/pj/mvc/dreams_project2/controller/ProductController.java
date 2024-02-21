package pj.mvc.dreams_project2.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pj.mvc.dreams_project2.HomeController;
import pj.mvc.dreams_project2.service.ProductServiceImpl;
import pj.mvc.dreams_project2.util.ImageUploadHandler;

// hojin
//@MultipartConfig(location="D:\\dev\\workspace\\dreams_project_2\\src\\main\\webapp\\resource\\upload",
//fileSizeThreshold=1024*1024, maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)

//minjin
@MultipartConfig(location="D:\\드림즈_스프링_1\\dreams_proejct_spring\\src\\main\\webapp\\resources\\upload\\",
fileSizeThreshold=1024*1024, maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)


@Controller
public class ProductController extends HttpServlet {
   
      private static final long serialVersionUID = 1L;
      
      //hojin
      //private static final String IMG_UPLOAD_DIR= "D:\\dev\\workspace\\dreams_project_2\\src\\main\\webapp\\resource\\upload";
      
      //minjin
      private static final String IMG_UPLOAD_DIR= "D:\\드림즈_스프링_1\\dreams_proejct_spring\\src\\main\\webapp\\resources\\upload\\";
          
       public ProductController() {
           super();
       }
       
       ImageUploadHandler uploader = null; // 작성
   
   @Autowired
   private ProductServiceImpl service;
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   @RequestMapping("product_list.pc")
   public String product_list(HttpServletRequest req, HttpServletResponse res, Model model)
         throws ServletException, IOException {
      logger.info("ProductController - product_list.pc");
      
      service.productListAction(req, res, model);
      
      return "page_5/admin/product";
   }
   
   // 상품 추가화면 
   @RequestMapping("insertProduct.pc")
   public String insertProduct(HttpServletRequest req, HttpServletResponse res, Model model)
         throws ServletException, IOException {
      logger.info("ProductController - insertProduct.pc");
      
      return "page_5/admin/insertProduct";
   }
   
   // 상품 추가 처리
   @RequestMapping("insertProductAction.pc")
   public String insertProductAction(HttpServletRequest req, HttpServletResponse res, Model model)
         throws ServletException, IOException {
      logger.info("ProductController - insertProductAction.pc");
      
      //추가 : 서비스 호출전에 추가
      String contentType = req.getContentType();
      if(contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
         uploader = new ImageUploadHandler();
         uploader.setUploadPath(IMG_UPLOAD_DIR);
         uploader.imageUpload(req, res);
      
      service.productInsertAction(req, res, model);
      
      
      }
      return "page_5/admin/insertProduct";
   }
   
   // 상품 수정 페이지
   @RequestMapping("detailProduct.pc")
   public String detailProduct(HttpServletRequest req, HttpServletResponse res, Model model)
         throws ServletException, IOException {
      logger.info("ProductController - detailProduct.pc");
      
      service.productDetailAction(req, res, model);
      
      return "page_5/admin/detailProduct";
   }
   
   // 상품수정처리
   @RequestMapping("updateAction.pc")
   public String updateAction(HttpServletRequest req, HttpServletResponse res, Model model)
         throws ServletException, IOException {
      logger.info("ProductController - updateAction.pc");
      
      // 추가 : 서비스 호출전에 추가
      String contentType = req.getContentType();
      if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
         uploader = new ImageUploadHandler();
         uploader.setUploadPath(IMG_UPLOAD_DIR);
         uploader.imageUpload(req, res);
      }

      service.productUpdateAction(req, res, model);
      
      return "page_5/admin/updateAction";
   }
   
   
   
}