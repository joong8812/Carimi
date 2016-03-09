package sigma.carimi.service;

import java.util.List;
import sigma.carimi.model.*;

public interface planService {
	planDTO selPlan(planDTO pdto) throws Exception;
	planDTO cardPlan(planDTO pdto) throws Exception;
	boolean addPlan(planDTO pdto) throws Exception;
	boolean delPlan(planDTO pdto) throws Exception;
	boolean updPlan(planDTO pdto) throws Exception;
	List<planDTO> listPlan(planDTO pdto) throws Exception;
	List<planDTO> eventPlan(planDTO pdto) throws Exception;
}
