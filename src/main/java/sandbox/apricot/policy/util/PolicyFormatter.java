package sandbox.apricot.policy.util;

import sandbox.apricot.policy.dto.response.PolicyDetailDTO;

public class PolicyFormatter {

    // DTO의 모든 필드에 개행 문자를 <br>로 변환하는 로직
    public static PolicyDetailDTO formatPolicyDetail(PolicyDetailDTO policyDetailDTO) {
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

    // 유틸리티 메서드: 개행 문자를 <br>로 변환
    private static String formatText(String text) {
        if (text != null) {
            return text.replace("\n", "<br>").replace("\r\n", "<br>");
        }
        return null;
    }

}
