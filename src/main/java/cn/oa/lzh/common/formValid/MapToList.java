package cn.oa.lzh.common.formValid;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
//将map中的value放入list中
public class MapToList<T> {
	public List<Object> mapToList(T data){
		Map<Object, Object> map=(Map<Object, Object>) data;
		Collection<Object> collects=map.values();
		final int size=collects.size();
		List<Object> list=new ArrayList<Object>(collects);
		return list;
	}

}
