package com.hezc.web;


import com.hezc.bean.Goods;
import com.hezc.dao.Goodsdao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GoodsServlet", value = "/Goods")
public class GoodsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");

        String flag=request.getParameter("flag");
        Goodsdao Goodsdao=new Goodsdao();
        int psize=3;
        if(flag==null||"list".equals(flag)){
            String pnos=request.getParameter("pno");
            if(pnos==null||pnos.equals("")){
                pnos="1";
            }
            int pno=Integer.parseInt(pnos);
            int start=(pno-1)*psize;
            int count= Goodsdao.count();
            int pcount=(count+psize-1)/psize;
            List<Goods> list=Goodsdao.getall(start,psize);
            request.setAttribute("pno",pno);
            request.setAttribute("pcount",pcount);
            request.setAttribute("list",list);
            request.getRequestDispatcher("list.jsp").forward(request,response);
        } else if ("delete".equals(flag)) {
            Integer id =Integer.parseInt(request.getParameter("id"));
            Integer pno=Integer.parseInt(request.getParameter("pno"));
            Goodsdao.delete(id);
            response.sendRedirect("Goods?pno="+pno);

        } else if ("insert".equals(flag)) {
            String name= request.getParameter("name");
            Double price=Double.parseDouble(request.getParameter("price"));
            String intro=request.getParameter("intro");
            Integer type_id=Integer.parseInt(request.getParameter("type_id"));

            Goods goods=new Goods();
            goods.setName(name);
            goods.setIntro(intro);
            goods.setPrice(price);
            goods.setType_id(type_id);

            Goodsdao.insert(goods);

            response.sendRedirect("Goods");


        }else if ("get".equals(flag)) {
            String name=request.getParameter("name");

            List<Goods> list=Goodsdao.get(name);
            request.setAttribute("list",list);
            request.getRequestDispatcher("list.jsp").forward(request,response);

        } else if ("edit".equals(flag)) {
            Integer id=Integer.parseInt(request.getParameter("id"));
            Integer pno=Integer.parseInt(request.getParameter("pno"));
            Goods getbyid = Goodsdao.getbyid(id);
            request.setAttribute("g",getbyid);

            request.getRequestDispatcher("edit.jsp").forward(request,response);

        } else if ("update".equals(flag)) {
            String name= request.getParameter("name");
            Double price=Double.parseDouble(request.getParameter("price"));
            String intro=request.getParameter("intro");
            Integer type_id=Integer.parseInt(request.getParameter("type_id"));

            Goods goods=new Goods();
            goods.setName(name);
            goods.setIntro(intro);
            goods.setPrice(price);
            goods.setType_id(type_id);

            goods.setId(Integer.parseInt(request.getParameter("id")));

            Goodsdao.update(goods);
            response.sendRedirect("Goods");

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
this.doGet(request,response);
    }
}
