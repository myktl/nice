package com.xcy.mapper;


import com.xcy.entry.Area;

import java.util.List;

public interface AreaMapper {

    List<Area> provinceServlet();

    List<Area> cityServlet(int id);

    List<Area> countyServlet(int id);
}
