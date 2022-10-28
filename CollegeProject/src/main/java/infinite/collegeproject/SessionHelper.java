package infinite.collegeproject;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

public class SessionHelper {
   
	public static SessionFactory getConnection() {
		Configuration cfgConfiguration=new AnnotationConfiguration().configure();
		SessionFactory sf=cfgConfiguration.buildSessionFactory();
		return sf;
	}
}
