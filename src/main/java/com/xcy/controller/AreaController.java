package com.xcy.controller;

import com.xcy.entry.Area;
import com.xcy.mapper.AreaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AreaController {

   @Autowired
   AreaMapper areaMapper;

    @RequestMapping("/provinceServlet")
    @ResponseBody
    public List<Area> provinceServlet() {
        List<Area> areaList = areaMapper.provinceServlet();
       // System.out.println(areaList);

        return areaList;
    }

    @RequestMapping("/cityServlet")
    @ResponseBody
    public List<Area> cityServlet(int id) {
        List<Area> areaCityList = areaMapper.cityServlet(id);
        return areaCityList;
    }

    @RequestMapping("/countyServlet")
    @ResponseBody
    public List<Area> countyServlet(int id) {
        List<Area> areaCountyList = areaMapper.countyServlet(id);
        return areaCountyList;
    }
}
