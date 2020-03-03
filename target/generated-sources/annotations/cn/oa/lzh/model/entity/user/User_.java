package cn.oa.lzh.model.entity.user;

import cn.oa.lzh.model.entity.attendce.Attends;
import cn.oa.lzh.model.entity.role.Role;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(User.class)
public abstract class User_ {

	public static volatile SingularAttribute<User, Role> role;
	public static volatile SingularAttribute<User, String> idCard;
	public static volatile SingularAttribute<User, Long> modifyUserId;
	public static volatile SingularAttribute<User, String> eamil;
	public static volatile SingularAttribute<User, Date> hireTime;
	public static volatile SingularAttribute<User, String> salary;
	public static volatile SingularAttribute<User, Integer> holiday;
	public static volatile SingularAttribute<User, String> lastLoginIp;
	public static volatile SingularAttribute<User, Integer> isLock;
	public static volatile SingularAttribute<User, String> userEdu;
	public static volatile SingularAttribute<User, String> bank;
	public static volatile SingularAttribute<User, String> password;
	public static volatile SingularAttribute<User, Date> modifyTime;
	public static volatile SingularAttribute<User, String> school;
	public static volatile SingularAttribute<User, Long> fatherId;
	public static volatile SingularAttribute<User, String> address;
	public static volatile SingularAttribute<User, String> sex;
	public static volatile SingularAttribute<User, Date> birth;
	public static volatile SingularAttribute<User, String> userTel;
	public static volatile SingularAttribute<User, Dept> dept;
	public static volatile SingularAttribute<User, String> userName;
	public static volatile SetAttribute<User, Attends> aSet;
	public static volatile SingularAttribute<User, Long> userId;
	public static volatile SingularAttribute<User, String> themeSkin;
	public static volatile SingularAttribute<User, String> realName;
	public static volatile SingularAttribute<User, Date> lastLoginTime;
	public static volatile SingularAttribute<User, String> pinyin;
	public static volatile SingularAttribute<User, String> userSign;
	public static volatile SingularAttribute<User, String> imgPath;
	public static volatile SingularAttribute<User, Position> position;
	public static volatile SingularAttribute<User, Boolean> superman;

}

