package cn.oa.lzh.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.converter.Converter;

/**
 * String类型转换成date方法
 */
@Configuration
public class StringtoDate implements Converter<String, Date> {
    SimpleDateFormat sdf = new SimpleDateFormat();
    private List<String> patterns = new ArrayList<>();
    @Override
    public Date convert(String source) {
        patterns.add("yyyy-MM-dd HH:mm:ss");
        patterns.add("yyyy-MM-dd HH:mm");
        patterns.add("yyyy-MM-dd");
        patterns.add("HH:mm");
        patterns.add("yyyy-MM");
        Date date = null;
        for (String p : patterns) {
            try {
                sdf.applyPattern(p);
                date = sdf.parse(source);
                break;
            } catch (ParseException e) {
            }
        }
        if (date == null) {
            throw new IllegalArgumentException("日期格式错误！[" + source + "]");
        }
        return date;
    }
    public void setPatterns(List<String> patterns) {
        this.patterns = patterns;
    }

	public static void main(String[] args) {
		String date = "2019-09-24 12:24:55";
		Date date1 = new Date();
		StringtoDate std = new StringtoDate();
		date1 = std.convert(date);
		System.out.println(date1);
	}
}
