package project.JanJan;
import java.util.ArrayList;
import java.util.List;

import project.JanJan.DAO.AlcoholDao;
import project.JanJan.VO.Alcohol;


public class filterMethod {
	public List<Alcohol> priceFilter(String s){
		List<Alcohol> alList = new ArrayList<Alcohol>();
		AlcoholDao dao = new AlcoholDao();
		
		if (s != null && !s.isEmpty()) {
			int price = Integer.parseInt(s);
		    for (Alcohol a : dao.getAllList()) {
		        int alcoholPrice = a.getPrice();
		        if (price == 1 && alcoholPrice <= 10000) {
		            alList.add(a);
		        } else if (price == 2 && alcoholPrice > 10000 && alcoholPrice <= 30000) {
		            alList.add(a);
		        } else if (price == 3 && alcoholPrice > 30000 && alcoholPrice <= 50000) {
		            alList.add(a);
		        } else if (price == 4 && alcoholPrice > 50000 && alcoholPrice <= 100000) {
		            alList.add(a);
		        } else if (price == 5 && alcoholPrice > 100000 && alcoholPrice <= 200000) {
		            alList.add(a);
		        }
		    }
		} else {
		    alList = dao.getAllList();
		}
		
		
		
		return alList;
	}
}
