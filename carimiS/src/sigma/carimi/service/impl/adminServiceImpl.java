package sigma.carimi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sigma.carimi.model.logDTO;

import sigma.carimi.service.adminDAO;

import sigma.carimi.service.adminService;

@Service
public class adminServiceImpl implements adminService{
	
	@Autowired
	private adminDAO adminDAO;

	@Override
	@Transactional(readOnly=true)
	public List<logDTO> loglist() throws Exception {
		return adminDAO.loglist();
	}
	@Override
	public int logAll() throws Exception {
		return adminDAO.logAll();
	}
	@Override
	public int logToday() throws Exception {
		return adminDAO.logToday();
	}
	
}
