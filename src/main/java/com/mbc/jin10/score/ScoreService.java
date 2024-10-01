package com.mbc.jin10.score;

import java.util.ArrayList;

public interface ScoreService {

	void scoresave(String name, int kor, int eng, int math);

	ArrayList<ScoreDTO> scoreout();

	void delete(int snumber);

	ScoreDTO update(int snumber);

	void update2(String name, int snumber, int eng, int math, int snumber2);

	ArrayList<ScoreDTO> searchname(String svalue);

	ArrayList<ScoreDTO> searchsnumber(String svalue);

}
