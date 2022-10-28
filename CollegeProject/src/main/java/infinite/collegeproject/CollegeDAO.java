package infinite.collegeproject;

import java.sql.Date;
import java.util.List;

import javax.swing.table.TableStringConverter;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;






public class CollegeDAO {
    
	SessionFactory sFactory;
	Session session;
	
	public Date convertDate(java.util.Date dt) {
		java.sql.Date sqlDate=new Date(dt.getTime());
		return sqlDate;
	}
	
	public List countFbValue(String instructor ,String subject){
		sFactory=SessionHelper.getConnection();
		session=sFactory.openSession();
		Query query=session.createQuery("Select fbValue,count(*) from FeedBack where instructor=:instructor AND subject=:subject group by FbValue").setParameter("instructor",instructor).setParameter("subject", subject);
		List<Object> count=query.list();
		return count;
	}
	public String fidGenerate() {
		sFactory=SessionHelper.getConnection();
		session=sFactory.openSession();
		Criteria cr=session.createCriteria(FeedBack.class);
		List<FeedBack> fList=cr.list();
		if(fList.size()==0) {
			return "F001";
		}else {
		int id=Integer.parseInt(fList.get(fList.size() - 1).getfId().substring(1));
		String fid=String.format("F%03d", ++id);
		return fid;
		}
	}
	
	public String cidGenerate() {
		sFactory=SessionHelper.getConnection();
		session=sFactory.openSession();
		Criteria cr=session.createCriteria(CourseList.class);
		List<CourseList> cList=cr.list();
		if(cList.size()==0) {
			return "C001";
		}else {
		int id=Integer.parseInt(cList.get(cList.size() - 1).getCourseNo().substring(1));
		String cid=String.format("C%03d", ++id);
		return cid;
		}
	}
	
	public List<Subjects> showInstructor(){
		sFactory=SessionHelper.getConnection();
		session=sFactory.openSession();
		Criteria cr = session.createCriteria(Subjects.class).setProjection(
			       Projections.distinct(Projections.property("instructor")));
		List<Subjects> insList=cr.list();
		return insList;
    }
	
	public List<Subjects> showSubjects(String inst){
		sFactory=SessionHelper.getConnection();
		session=sFactory.openSession();
		Criteria cr=session.createCriteria(Subjects.class);
		cr.add(Restrictions.eq("instructor", inst));
		Projection projection=Projections.property("subject");
		 cr.setProjection(projection);
		List<Subjects> subList=cr.list();
		return subList;
			
}
	
	public String addFeedBack(FeedBack fb) {
		sFactory=SessionHelper.getConnection();
		session=sFactory.openSession();
		String fid=fidGenerate();
		fb.setfId(fid);
		Transaction tr=session.beginTransaction();
		session.save(fb);
		tr.commit();
		return "FeedBack submit successfully";
	}
	public String addSubject(Subjects subject) {
		sFactory=SessionHelper.getConnection();
		session=sFactory.openSession();
		Transaction tr=session.beginTransaction();
		session.save(subject);
		tr.commit();
		return "Subject added ";
		
	}
	public String addCourse(CourseList course) {
		sFactory=SessionHelper.getConnection();
		session=sFactory.openSession();
		String cno=cidGenerate();
		course.setCourseNo(cno);
		Transaction tr=session.beginTransaction();
		session.save(course);
		tr.commit();
		return "Course added";
	}
}
