package com.catcm.skill.service;

import java.util.List;

import com.catcm.skill.pojo.Dict;

public interface DictService {
	public List<Dict> getDictList(Dict dict);
	public List<Dict> getDictList(int from, int length,Dict dict);
	public int getCount(Dict dict);
	public void delDict(String id);
	public void saveDict(Dict dict);
}
