package com.xmg.pss.service.impl;

import java.util.List;

import lombok.Setter;

import com.xmg.pss.domain.Department;
import com.xmg.pss.mapper.DepartmentMapper;
import com.xmg.pss.mapper.EmployeeMapper;
import com.xmg.pss.service.IDepartmentService;

public class DepartmentServiceImpl implements IDepartmentService {

	@Setter
	private DepartmentMapper deptMapper;

	@Setter
	private EmployeeMapper empMapper;

	@Override
	public void save(Department dept) {
		deptMapper.save(dept);
	}

	@Override
	public void delete(Long id) {
		//在删除对应部门之前,需要将其关联的数据先删掉或者是将其外键列设置null
		empMapper.updateByDeptId(id);
		
		deptMapper.delete(id);
	}

	@Override
	public void update(Department dept) {
		deptMapper.update(dept);
	}

	@Override
	public Department get(Long id) {
		return deptMapper.get(id);
	}

	@Override
	public List<Department> list() {
		return deptMapper.list();
	}

}
