package kr.co.segwangYouth.memberManagement.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

//@Repository("memberManagementMapper")
//@MapperScan("kr.co.segwangYouth.mapper")
@Mapper
public interface MemberManagementMapper {

    public List<Map> selectMemberList();
    
    public List<Map> selectCodeList(String classCode);
    
    public List<Map> selectMemberCount();
	 
}
