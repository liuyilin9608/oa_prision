package cn.oa.lzh.model.entity.note;

import cn.oa.lzh.model.entity.user.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Catalog.class)
public abstract class Catalog_ {

	public static volatile SingularAttribute<Catalog, String> catalogName;
	public static volatile SingularAttribute<Catalog, Long> catalogId;
	public static volatile SingularAttribute<Catalog, User> user;
	public static volatile SingularAttribute<Catalog, Integer> parentId;

}

