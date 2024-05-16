package jmu.ssc.supershopping.controller;

import jmu.ssc.supershopping.pojo.Product;
import jmu.ssc.supershopping.pojo.SortFirst;
import jmu.ssc.supershopping.pojo.User;
import jmu.ssc.supershopping.service.ProductService;
import jmu.ssc.supershopping.service.SortFirstService;
import jmu.ssc.supershopping.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller

public class ProductController {
    @Resource
    private ProductService productService;

    @Resource
    private SortFirstService sortService;

    @Resource
    private UserService userService;


    @RequestMapping(value = "/main",method = RequestMethod.GET)
    public String index(Model model,HttpServletRequest request) throws Exception {

        //查询一级目录和二级目录
        List<SortFirst> cList = sortService.findSort();
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("cList", cList);

        //查询热门商品
        List<Product> pList= productService.findPopularProduct();
        System.out.println(pList);
        httpSession.setAttribute("pList", pList);

        //查询最新商品
        List<Product> nList = productService.findNewProduct();
        model.addAttribute("nList", nList);

        List<Product> mList =productService.findgoodProduct();
        model.addAttribute("mList",mList);

        return "/main";
    }

    //根据产品ID查找产品信息
    @RequestMapping("/productFindById")
    public String productFindById(@RequestParam int pid, Model model,HttpServletRequest request, HttpSession session) throws Exception {
        Product product = productService.getProductById(pid);
        int p=pid;
        if (session.getAttribute("USER_SESSION")!=null) {
            User use = (User) session.getAttribute("USER_SESSION");
            String userName = use.getUser_name();
            userService.recordVisit(userName, p, request.getRemoteAddr());
            productService.incrementClickCount(p);
        }


        System.out.println(product);

        model.addAttribute("product", product);



        return "product";
    }

    //查询商品
    @RequestMapping("/searchProduct")
    public String searchProduct(@RequestParam String condition,Model model,HttpServletRequest request,HttpSession session){
        //搜索商品
        List<Product> srList = productService.getProductByName(condition);
        model.addAttribute("srList", srList);
        if (session.getAttribute("USER_SESSION")!=null) {
            User use = (User) session.getAttribute("USER_SESSION");
            String userName = use.getUser_name();
            userService.recordSearch(userName,request.getRemoteAddr(),condition);
        }


        return "searchProduct";
    }
}
