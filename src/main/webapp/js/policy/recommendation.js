document.addEventListener('DOMContentLoaded', function () {
  const hiddenBackground = document.querySelector('.hidden-background');
  if (hiddenBackground) {
    hiddenBackground.addEventListener('click', closeRecommendModal);
  }
});

function openRecommendModal() {
  const hiddenBackground = document.querySelector('.hidden-background');
  const recommendModal = document.querySelector('.recommendation-modal');
  const chatbot = document.querySelector('.chatbot-overlay');
  const body = document.body

  hiddenBackground.style.display = 'block';
  recommendModal.style.display = 'block';
  chatbot.style.display = 'none'; //챗봇 아이콘 안보이도록
  body.style.position = 'fixed'; //body 안움직이도록
  $.ajax({
    url: '/api/v1/recommendation',
    type: 'GET',
    cache: false,
    success: function (response) {
      // 응답 데이터가 올바르게 들어오는지 확인합니다.
      if (!response.data) {
        console.error('응답 데이터가 없습니다.', response);
        return;
      }

      const data = response.data; // data를 정의
      const listByDistrictPolicyCnt = data.listByDistrictPolicyCnt;
      const listByDistrictPolicyScore = data.listByDistrictPolicyScore;
      const listByDistrictPolicyScrapOfScrapGroup = data.listByDistrictPolicyScrapOfScrapGroup;

      updateChartData(listByDistrictPolicyCnt, listByDistrictPolicyScore);

      $('#recommendation-title').text(
          `살구가 추천 드리는 \'${data.nickName}\'님의 지역구 추천 정보 입니다.`);

      // 지역구 별 혜택수를 기준으로 한 추천 결과
      // $('#reason1-title').text('지역구 별 혜택수를 기준으로 한 추천 결과 입니다.');
      $('#reason1-title').text(
          `\'${data.nickName}\'님이 관심 가지는 분야와 비슷한 혜택을 가장 많이 제공해줘요!`);
      const topPolicyCnt = listByDistrictPolicyCnt
      .sort((a, b) => b.districtScore - a.districtScore)
      .slice(0, 3);
      $('#policy-cnt-results').html(`
        <div class="recommend-district">
        <div class="title">
        추천 지역구는 <h2 style="color:#F9973E; display:inline"> ${topPolicyCnt[0].districtCode}</h2> 입니다.<br>
        </div>
        <div class="rank">
        <div class="medal">
        <img src="../assets/img/silverMedal.png" width="50px">
        <div class="districtCode">
        ${topPolicyCnt[1].districtCode} 
        </div>
        <div class="districtScore">
        ${topPolicyCnt[1].districtScore} 점<br>
        </div>
        </div>
        <div class="medal">      
         <img src="../assets/img/goldMadal.png" width="50px">
         <div class="dirtrictCode">
          ${topPolicyCnt[0].districtCode}
          </div>
          <div class="districtScore">
           ${topPolicyCnt[0].districtScore} 점<br>
           </div>
        </div>
        <div class="medal">
           <img src="../assets/img/bronzeMedal.png" width="50px">
           <div class="dirtrictCode">
          ${topPolicyCnt[2].districtCode}
          </div>
          <div class="districtScore">
          ${topPolicyCnt[2].districtScore} 점
          </div>
         </div>
         </div>
      `);

      // 사용자들의 혜택 평가 점수를 기준으로 한 추천 결과
      $('#reason2-title').text('사용자들에게 인기있는 혜택을 추천한 결과에요!');
      const topPolicyScore = listByDistrictPolicyScore
      .sort((a, b) => b.districtScore - a.districtScore)
      .slice(0, 3);
      $('#policy-score-results').html(
          `
  <div class="recommend-district">   
      <div class="title">
        추천 지역구는 <h2 style="color:#F9973E; display:inline"> ${topPolicyScore[0].districtCode}</h2> 입니다.<br>
        </div>
        <div class="rank">
        <div class="medal">
        <img src="../assets/img/silverMedal.png" width="50px">
        <div class="districtCode">
        ${topPolicyScore[1].districtCode} 
        </div>
        <div class="districtScore">
        ${topPolicyScore[1].districtScore} 점<br>
        </div>
        </div>
        <div class="medal">      
         <img src="../assets/img/goldMadal.png" width="50px">
         <div class="dirtrictCode">
          ${topPolicyScore[0].districtCode}
          </div>
          <div class="districtScore">
           ${topPolicyScore[0].districtScore} 점<br>
           </div>
        </div>
        <div class="medal">
           <img src="../assets/img/bronzeMedal.png" width="50px">
           <div class="dirtrictCode">
          ${topPolicyScore[2].districtCode}
          </div>
          <div class="districtScore">
          ${topPolicyScore[2].districtScore} 점
          </div>
         </div>
      `);

      // 사용자들의 혜택 평가 점수를 기준으로 한 추천 결과
      $('#reason3-title').text(`\'${data.nickName}\'님과 비슷한 사용자들의 추천 결과에요!`);
      const groupInfo1 = listByDistrictPolicyScrapOfScrapGroup[0];
      const groupInfo2 = listByDistrictPolicyScrapOfScrapGroup[1];
      const groupInfo3 = listByDistrictPolicyScrapOfScrapGroup[2];

      $('#similar-group-results').html(`
        \<\'${data.nickName}\'님은 \'${groupInfo1.comparisonAgeRange} ${groupInfo1.comparisonGender}\' 회원들과 비슷한 관심을 보이고 있습니다.\><br><br>
       <div class="recommend-district">   
         <div class="title">
        추천 지역구는 <h2 style="color:#F9973E; display:inline"> ${groupInfo1.districtCode}</h2> 입니다.<br>
        </div>
        <div class="rank">
        <div class="medal">
        <img src="../assets/img/silverMedal.png" width="50px">
        <div class="districtCode">
        ${groupInfo2.districtCode} 
        </div>
        </div>
        <div class="medal">      
         <img src="../assets/img/goldMadal.png" width="50px">
         <div class="dirtrictCode">
          ${groupInfo1.districtCode}
          </div>
        </div>
        <div class="medal">
           <img src="../assets/img/bronzeMedal.png" width="50px">
           <div class="dirtrictCode">
          ${groupInfo3.districtCode}
          </div>
         </div>
      `);

      viewChart();
    },
    error: function (xhr, status, error) {
      console.error('AJAX Error:', status, error);
      alert('지역구 추천 폼을 로드하는데 문제가 있습니다.');
      window.location.href = '/';
    }
  });
}

function updateChartData(policyCntData, policyScoreData) {
  // 지역구 이름과 점수 추출
  const policyCntDataDistrictNames1 = [];
  const policyCntDataDistrictScores1 = [];
  const policyCntDataDistrictNames2 = [];
  const policyCntDataDistrictScores2 = [];

  // 데이터를 두 개의 차트에 맞게 나누기
  policyCntData.forEach((item, index) => {
    if (index < 12) { // 첫 번째 차트에 12개 지역구 데이터 추가
      policyCntDataDistrictNames1.push(item.districtCode);
      policyCntDataDistrictScores1.push(item.districtScore);
    } else { // 두 번째 차트에 나머지 데이터 추가
      policyCntDataDistrictNames2.push(item.districtCode);
      policyCntDataDistrictScores2.push(item.districtScore);
    }
  });

  console.log(policyCntDataDistrictNames1)
  console.log(policyCntDataDistrictScores1)
  console.log(policyCntDataDistrictNames2)
  console.log(policyCntDataDistrictScores2)

  const policyScoreDataDistrictNames1 = [];
  const policyScoreDataDistrictScores1 = [];
  const policyScoreDataDistrictNames2 = [];
  const policyScoreDataDistrictScores2 = [];

  policyScoreData.forEach((item, index) => {
    if (index < 12) { // 첫 번째 차트에 12개 지역구 데이터 추가
      policyScoreDataDistrictNames1.push(item.districtCode);
      policyScoreDataDistrictScores1.push(item.districtScore);
    } else { // 두 번째 차트에 나머지 데이터 추가
      policyScoreDataDistrictNames2.push(item.districtCode);
      policyScoreDataDistrictScores2.push(item.districtScore);
    }
  });

  // 첫 번째 차트 데이터 업데이트
  chartConfig1.graphset[0].scaleX.labels = policyCntDataDistrictNames1;
  chartConfig1.graphset[0].series[0].values = policyCntDataDistrictScores1; // 데이터 1
  chartConfig1.graphset[0].series[1].values = policyScoreDataDistrictScores1; // 데이터 2

  // 두 번째 차트 데이터 업데이트
  chartConfig2.graphset[0].scaleX.labels = policyCntDataDistrictNames2;
  chartConfig2.graphset[0].series[0].values = policyCntDataDistrictScores2; // 데이터 1
  chartConfig2.graphset[0].series[1].values = policyScoreDataDistrictScores2; // 데이터 2
}

function viewChart() {
  // 차트 1 렌더링
  zingchart.render({
    id: 'chart1',
    data: chartConfig1,
    height: '100%',
    width: '100%',
  });

  // 차트 2 렌더링
  zingchart.render({
    id: 'chart2',
    data: chartConfig2,
    height: '100%',
    width: '100%',
  });
}

function closeRecommendModal() {
  const hiddenBackground = document.querySelector('.hidden-background');
  const recommendModal = document.querySelector('.recommendation-modal');
  const chatbot = document.querySelector('.chatbot-overlay');
  const body = document.body

  hiddenBackground.style.display = 'none';
  recommendModal.style.display = 'none';
  chatbot.style.display = 'flex';
  body.style.position = 'static';
}

ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9"];

// 공통 범례 설정
let legendConfig = {
  align: 'right',
  verticalAlign: 'top',
  margin: '20 50 0 0',
  padding: '5px',
  borderRadius: '5px',
  item: {
    color: '#5D7D9A',
    fontFamily: 'Jua'
  },
};

if (typeof window.legendConfig === 'undefined') {
  window.legendConfig = {
    layout: '3x2',
    align: 'right',
    verticalAlign: 'top',
    margin: '5 20 0 0',
    padding: '5px',
    borderRadius: '5px',
    header: {
      text: 'Legend',
      color: '#5D7D9A',
      padding: '10px',
    },
    item: {
      color: '#5D7D9A',
    },
  };
}

// 첫 번째 차트 설정
let chartConfig1 = {
  graphset: [{
    type: 'bar',
    plot: {
      stacked: true,
      barWidth: '30%',
      tooltip: {
        visible: true
      },
      animation: {
        effect: "11",
        method: "3",
        sequence: "ANIMATION_BY_PLOT_AND_NODE",
        speed:10
      }
    },
    scaleX: {
      labels: [],
      item: {
        color: '#6C6C6C',
        angle: '-90',
        fontFamily: 'Jua'
      },
      lineColor: '#D8D8D8',
      tick: {
        visible: false,
      },
    },
    scaleY: {
      values: '0:21:1',
      label: {
        padding: '20 0 0 0',
        text: '추천 점수',
        color: '#6C6C6C',
        fontFamily: 'Jua'
      },
      guide: {
        lineStyle: 'solid',
      },
      item: {
        color: '#6C6C6C',
      },
      lineColor: '#D8D8D8',
      tick: {
        lineColor: '#D8D8D8',
      },
    },
    legend: legendConfig,
    series: [
      {
        values: [],
        backgroundColor: '#F9973E',
        text: '많은 혜택을 가진 지역구',
        fontFamily: 'Jua'
      },
      {
        values: [],
        backgroundColor: '#ffc18d',
        text: '좋은 혜택을 가진 지역구',
        fontFamily: 'Jua'
      }
    ]
  }]
};

let chartConfig2 = {
  graphset: [{
    type: 'bar',
    plot: {
      stacked: true,
      barWidth: '30%',
      tooltip: {
        visible: true
      },
      animation: {
        effect: "11",
        method: "3",
        sequence: "ANIMATION_BY_PLOT_AND_NODE",
        speed:10
      }
    },
    scaleX: {
      labels: [],
      item: {
        color: '#6C6C6C',
        angle: '-90',
        fontFamily: 'Jua'
      },
      lineColor: '#D8D8D8',
      tick: {
        visible: false,
      },
    },
    scaleY: {
      values: '0:21:1',
      label: {
        padding: '20 0 0 0',
        text: '추천 점수',
        color: '#6C6C6C',
        fontFamily: 'Jua'
      },
      guide: {
        lineStyle: 'solid',
      },
      item: {
        color: '#6C6C6C',
      },
      lineColor: '#D8D8D8',
      tick: {
        lineColor: '#D8D8D8',
      },
    },
    legend: legendConfig,
    series: [
      {
        values: [],
        backgroundColor: '#F9973E',
        text: '많은 혜택을 가진 지역구',
        fontFamily: 'Jua'
      },
      {
        values: [],
        backgroundColor: '#ffc18d',
        text: '좋은 혜택을 가진 지역구',
        fontFamily: 'Jua'
      }
    ]
  }]
};