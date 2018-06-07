package com.xmg.pss.service;

import java.util.List;

import com.xmg.pss.domain.Department;

public interface IDepartmentService {
	void save(Department dept);

	void delete(Long id);

	void update(Department dept);

	Department get(Long id);

	List<Department> list();
}
