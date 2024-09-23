ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];

document.addEventListener('DOMContentLoaded', function() {

  $.ajax({
    url: 'api/v1/policy/word-cloud',
    method: 'GET',
    success: function (api) {
      const words = api.data
      .filter(data => data.districtName !== "서울시")
      .map(data => ({
        text: data.districtName,
        count: data.policyCnt,
      }));

      var myConfig = {
        "graphset": [{
          "type": "wordcloud",
          backgroundColor: 'rgba(249,151,62,0)',
          options: {
            colorType: 'palette',
            palette: ['#F9973E', '#375E97', '#FB6542', '#3F681C', '#FFBB00', '#FB7252'], //색상지정
            aspect: 'spiral', //중앙 원형
            maxFontSize: 80, //최대 글씨 크기
            minFontSize: 20, //최소 글씨 크기
            textSpacing: 0.1, //글짜 간격
            "style": {
              borderRadius: 10,
              fontFamily: 'Jua',
              //padding: '5px 10px',
              hoverState: {
                alpha: 1,
                backgroundColor: 'rgba(249,151,62,0)',
                borderColor: 'none',
                fontColor: 'black',
                textAlpha: 1,
              },

              "tooltip": {
                visible: true,
                text: '%text: %hits',
                alpha: 0.9,
                backgroundColor: 'purple',
                borderColor: 'none',
                borderRadius: 2,
                fontColor: 'white',
                fontSize: 12,
                textAlpha: 1,
              }
            },
            "words": words
          }
        }]
      };

      zingchart.render({
        id: 'myChart',
        data: myConfig,
        height: '100%',
        width: '100%',
      });

      zingchart.bind('myChart', 'label_click', function(e) {
        if (e.label) {
          const district = e.label.text;
          const districtCode = districtMapping[district];
          window.location.href = `${window.location.origin}/policy?districtCode=${encodeURIComponent(districtCode)}`;
        }
      });

      const rankPolicyDistricts = document.getElementById('rank-policy-districts');
      let currentIndex = 0;

      // 인기 지역구를 혜택 수로 정렬하여 표시할 배열
      const sortedDistricts = words.sort((a, b) => b.count - a.count); // 혜택 수로 내림차순 정렬

      // 지역구 표시 함수
      const showDistrict = () => {
        rankPolicyDistricts.textContent =  `${currentIndex + 1}. ${words[currentIndex].text}`; // 번호와 지역구 이름 표시
        rankPolicyDistricts.classList.add('fade-in');

        // 애니메이션이 끝난 후 다음 지역구로 전환
        setTimeout(() => {
          rankPolicyDistricts.classList.remove('fade-in');
        }, 2000); // 2s 후 사라짐

        currentIndex = (currentIndex + 1) % sortedDistricts.length; // 인덱스 순환
      };

      // 애니메이션 적용
      setInterval(showDistrict, 3000); // 3초마다 지역구 변경
      showDistrict(); // 시작 시 첫 번째 지역구 표시

    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.error('Error fetching word cloud data:', textStatus, errorThrown);
    }
  });
});
