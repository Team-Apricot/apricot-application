package sandbox.apricot.policy.service;

import java.util.List;
import org.springframework.stereotype.Service;
import sandbox.apricot.policy.dto.PolicyDetailDTO;
import sandbox.apricot.policy.mapper.PolicyDetailMapper;

@Service
public class PolicyDetailService {

    private final PolicyDetailMapper detailMapper;

    // 생성자 주입을 통한 DetailMapper 사용
    public PolicyDetailService(PolicyDetailMapper detailMapper) {
        this.detailMapper = detailMapper;
    }

    // 유틸리티 메서드: 개행 문자를 <br>로 변환
    private String formatText(String text) {
        if (text != null) {
            return text.replace("\n", "<br>").replace("\r\n", "<br>");
        }
        return text;
    }

    // DTO의 모든 필드에 개행 문자를 <br>로 변환하는 로직
    public PolicyDetailDTO formatPolicyDetail(PolicyDetailDTO policyDetailDTO) {
        policyDetailDTO.setPolicyCode(formatText(policyDetailDTO.getPolicyCode()));
        policyDetailDTO.setCategoryCode(formatText(policyDetailDTO.getCategoryCode()));
        policyDetailDTO.setDistrictCode(formatText(policyDetailDTO.getDistrictCode()));
        policyDetailDTO.setPolicyName(formatText(policyDetailDTO.getPolicyName()));
        policyDetailDTO.setPolicyContent(formatText(policyDetailDTO.getPolicyContent()));
        policyDetailDTO.setSupportContent(formatText(policyDetailDTO.getSupportContent()));

        policyDetailDTO.setPrdRpttSecd(formatText(policyDetailDTO.getPrdRpttSecd()));
        policyDetailDTO.setSchedule(formatText(policyDetailDTO.getSchedule()));
        policyDetailDTO.setPolicyStartDate(formatText(policyDetailDTO.getPolicyStartDate()));
        policyDetailDTO.setPolicyEndDate(formatText(policyDetailDTO.getPolicyEndDate()));

        policyDetailDTO.setAgeInfo(formatText(policyDetailDTO.getAgeInfo()));

        policyDetailDTO.setMajorRqisCn(formatText(policyDetailDTO.getMajorRqisCn()));
        policyDetailDTO.setEmpmSttsCn(formatText(policyDetailDTO.getEmpmSttsCn()));
        policyDetailDTO.setSplzRlmRqisCn(formatText(policyDetailDTO.getSplzRlmRqisCn()));
        policyDetailDTO.setAccrRqisCn(formatText(policyDetailDTO.getAccrRqisCn()));
        policyDetailDTO.setPrcpCn(formatText(policyDetailDTO.getPrcpCn()));
        policyDetailDTO.setAditRscn(formatText(policyDetailDTO.getAditRscn()));
        policyDetailDTO.setPrcpLmttTrgtCn(formatText(policyDetailDTO.getPrcpLmttTrgtCn()));
        policyDetailDTO.setRqutProcCn(formatText(policyDetailDTO.getRqutProcCn()));
        policyDetailDTO.setPstnPaprCn(formatText(policyDetailDTO.getPstnPaprCn()));
        policyDetailDTO.setJdgnPresCn(formatText(policyDetailDTO.getJdgnPresCn()));

        policyDetailDTO.setRqutUrla(formatText(policyDetailDTO.getRqutUrla()));
        policyDetailDTO.setRfcSiteUrla1(formatText(policyDetailDTO.getRfcSiteUrla1()));
        policyDetailDTO.setRfcSiteUrla2(formatText(policyDetailDTO.getRfcSiteUrla2()));

        policyDetailDTO.setMngtMson(formatText(policyDetailDTO.getMngtMson()));
        policyDetailDTO.setMngtMrofCherCn(formatText(policyDetailDTO.getMngtMrofCherCn()));
        policyDetailDTO.setCherCtpcCn(formatText(policyDetailDTO.getCherCtpcCn()));

        policyDetailDTO.setCnsgNmor(formatText(policyDetailDTO.getCnsgNmor()));
        policyDetailDTO.setTintCherCn(formatText(policyDetailDTO.getTintCherCn()));
        policyDetailDTO.setTintCherCtpcCn(formatText(policyDetailDTO.getTintCherCtpcCn()));

        policyDetailDTO.setEtct(formatText(policyDetailDTO.getEtct()));

        return policyDetailDTO;
    }

    // youth_policy_detail 테이블에서 모든 정책 정보를 가져오는 메서드
    public List<PolicyDetailDTO> getPolicyDetails() {
        return detailMapper.getPolicyDetails();
    }

    // yout_policy_detail 테이블에서 특정 정책 코드를 가져오는 메서드
    public PolicyDetailDTO getPolicyDetailsByCode(String policyCode) {
        PolicyDetailDTO policyDetailDTO = detailMapper.getPolicyDetailsByPolicyCode(policyCode);
        return formatPolicyDetail(policyDetailDTO);

    }

}
