package sigma.carimi.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sigma.carimi.model.*;
import sigma.carimi.service.*;


@Service
public class planServiceImpl implements planService{
	
	@Autowired
	private planDAO planDAO;

	@Override
	public planDTO selPlan(planDTO pdto) throws Exception {
		return planDAO.selPlan(pdto);
	}

	@Override
	public planDTO cardPlan(planDTO pdto) throws Exception {
		return planDAO.cardPlan(pdto);
	}

	@Override
	public boolean addPlan(planDTO pdto) throws Exception {
		return planDAO.addPlan(pdto);
	}

	@Override
	public boolean delPlan(planDTO pdto) throws Exception {
		return planDAO.delPlan(pdto);
	}

	@Override
	public boolean updPlan(planDTO pdto) throws Exception {
		return planDAO.updPlan(pdto);
	}

	@Override
	public List<planDTO> listPlan(planDTO pdto) throws Exception {
		return planDAO.listPlan(pdto);
	}

	@Override
	public List<planDTO> eventPlan(planDTO pdto) throws Exception {
		return planDAO.eventPlan(pdto);
	}
	
	
}
