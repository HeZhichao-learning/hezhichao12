package com.hezc.dao;

import com.hezc.bean.Goods;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class Goodsdao {
    QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());


    public int count(){

        Long r=0l;
        String sql="select count(*) from goods";
        try {
            r=runner.query(sql,new ScalarHandler<>());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return r.intValue();
    }
    public List<Goods> getall(int start, int psize){

        String sql="select g.*,t.name typename from goods g,type t where g.type_id=t.id limit ?,?";
        List<Goods> list=null;

        try {
            list=runner.query(sql,new BeanListHandler<>(Goods.class),start,psize);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    return list;

    }
    public  void delete(int id){
        String sql="delete from goods where id=?";
        try {
            runner.update(sql,id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void  insert (Goods g){
        String sql="insert into goods(name,price,intro,type_id) values (?,?,?,?)";
        try {
            runner.update(sql,g.getName(),g.getPrice(),g.getIntro(),g.getType_id());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public Goods checkname(String name){
        String sql="select * from student where name=?";
        try {
            return  runner.query(sql,new BeanHandler<>(Goods.class),name);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public List<Goods> get(String name){
        String sql="select g.*,t.name typename from goods g,type t where g.type_id=t.id and g.name like ?";
        String name1="%"+name+"%";
        try {
            return runner.query(sql,new BeanListHandler<>(Goods.class),name1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Goods getbyid(int id){
        String sql="select g.*,t.name typename from goods g,type t where g.type_id=t.id and g.id=?";
        Goods goods=null;
        try {
            goods=runner.query(sql,new BeanHandler<>(Goods.class),id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }return goods;
    }
    public void update(Goods g){
        String sql="update goods set name=?,price=?,intro=?,type_id=? where id=?";
        try {
            runner.update(sql,g.getName(),g.getPrice(),g.getIntro(),g.getType_id(),g.getId());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


}
