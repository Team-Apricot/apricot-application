package sandbox.apricot.recommendation.util;

import java.util.HashMap;
import java.util.Map;

public class DataPreprocess {

    private static final Map<String, String> DISTRICT_CODE_MAP = new HashMap<>();

    static {
        DISTRICT_CODE_MAP.put("01", "종로구");
        DISTRICT_CODE_MAP.put("02", "중구");
        DISTRICT_CODE_MAP.put("03", "용산구");
        DISTRICT_CODE_MAP.put("04", "성동구");
        DISTRICT_CODE_MAP.put("05", "광진구");
        DISTRICT_CODE_MAP.put("06", "동대문구");
        DISTRICT_CODE_MAP.put("07", "중랑구");
        DISTRICT_CODE_MAP.put("08", "성북구");
        DISTRICT_CODE_MAP.put("09", "강북구");
        DISTRICT_CODE_MAP.put("10", "도봉구");
        DISTRICT_CODE_MAP.put("11", "노원구");
        DISTRICT_CODE_MAP.put("12", "은평구");
        DISTRICT_CODE_MAP.put("13", "서대문구");
        DISTRICT_CODE_MAP.put("14", "마포구");
        DISTRICT_CODE_MAP.put("15", "양천구");
        DISTRICT_CODE_MAP.put("16", "강서구");
        DISTRICT_CODE_MAP.put("17", "구로구");
        DISTRICT_CODE_MAP.put("18", "금천구");
        DISTRICT_CODE_MAP.put("19", "영등포구");
        DISTRICT_CODE_MAP.put("20", "동작구");
        DISTRICT_CODE_MAP.put("21", "관악구");
        DISTRICT_CODE_MAP.put("22", "서초구");
        DISTRICT_CODE_MAP.put("23", "강남구");
        DISTRICT_CODE_MAP.put("24", "송파구");
        DISTRICT_CODE_MAP.put("25", "강동구");
    }

    // 점수 정규화 메서드
    public static Double normalizeScore(Double score, Double maxScore) {
        return (score / maxScore) * 10;
    }

    // 지역 코드 변환 메서드
    public static String getDistrictNameByCode(String districtCode) {
        return DISTRICT_CODE_MAP.getOrDefault(districtCode, "알 수 없는 지역");
    }

}
