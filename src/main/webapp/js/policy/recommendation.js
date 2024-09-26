function openRecommendModal() {
  const hiddenBackground = document.querySelector('.hidden-background');
  const recommendModal = document.querySelector('.recommendation-modal');
  const mainContent = document.querySelector('.mainContent');

  hiddenBackground.style.display = 'block';
  recommendModal.style.display = 'block';
  mainContent.style.pointerEvents = 'none';

  $.ajax({
    url: '/recommendations',
    type: 'GET',
    success: function (data) {
      $('#recommendation-modal-content').html(data);
      $('#recommendation-modal').show();
    },
    error: function (xhr, status, error) {
      console.error('AJAX Error:', status, error);
      alert('지역구 추천 폼을 로드하는데 문제가 있습니다.');
      window.location.href = '/';
    }
  });
}

function closeRecommendModal() {
  const hiddenBackground = document.querySelector('.hidden-background');
  const recommendModal = document.querySelector('.recommendation-modal');
  const mainContent = document.querySelector('.mainContent');

  hiddenBackground.style.display = 'none';
  recommendModal.style.display = 'none';
  mainContent.style.pointerEvents = 'auto';
}

ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9"];

// 공통 범례 설정
let legendConfig = {
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

// 첫 번째 차트 설정
let chartConfig1 = {
  graphset: [{
    type: 'bar',
    title: {
      text: '서울 지역구 관심도 (1/2)',
      align: 'left',
      color: '#5D7D9A',
      padding: '30 0 0 35',
    },
    plot: {
      stacked: true,
      barWidth: '25%',
      tooltip: {
        visible: true
      }
    },
    scaleX: {
      labels: [
        '종로구', '중구', '용산구', '성동구', '광진구',
        '동대문구', '중랑구', '성북구', '강북구', '도봉구',
        '노원구', '은평구', '서대문구'
      ],
      label: {
        color: '#6C6C6C',
        text: '서울 지역구 (1/2)'
      },
      item: {
        color: '#6C6C6C',
        angle: '-45'
      },
      lineColor: '#D8D8D8',
      tick: {
        visible: false,
      },
    },
    scaleY: {
      values: '0:100:20',
      label: {
        padding: '20 0 0 0',
        text: '관심도 (점수)',
        color: '#6C6C6C',
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
    legend: legendConfig, // 범례 추가
    series: [
      {
        values: [11, 15, 41, 24, 20, 23, 10, 5, 35, 28, 30, 30, 10],
        backgroundColor: '#F9973E',
        text: '데이터 1'
      },
      {
        values: [16, 14, 8, 20, 17, 22, 24, 20, 17, 18, 30, 22, 19],
        backgroundColor: '#ffc18d',
        text: '데이터 2'
      }
    ]
  }]
};

// 두 번째 차트 설정
let chartConfig2 = {
  graphset: [{
    type: 'bar',
    title: {
      text: '서울 지역구 관심도 (2/2)',
      align: 'left',
      color: '#5D7D9A',
      padding: '30 0 0 35',
    },
    plot: {
      stacked: true,
      barWidth: '25%',
      tooltip: {
        visible: true
      }
    },
    scaleX: {
      labels: [
        '마포구', '양천구', '강서구', '구로구', '금천구',
        '영등포구', '동작구', '관악구', '서초구', '강남구',
        '송파구', '강동구'
      ],
      label: {
        color: '#6C6C6C',
        text: '서울 지역구 (2/2)'
      },
      item: {
        color: '#6C6C6C',
        angle: '-45'
      },
      lineColor: '#D8D8D8',
      tick: {
        visible: false,
      },
    },
    scaleY: {
      values: '0:100:20',
      label: {
        padding: '20 0 0 0',
        text: '관심도 (점수)',
        color: '#6C6C6C',
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
    legend: legendConfig, // 범례 추가
    series: [
      {
        values: [10, 10, 16, 5, 30, 8, 10, 11, 28, 13, 28, 23],
        backgroundColor: '#F9973E',
        text: '데이터 1'
      },
      {
        values: [10, 12, 14, 22, 20, 17, 19, 16, 18, 14, 22, 20],
        backgroundColor: '#ffc18d',
        text: '데이터 2'
      }
    ]
  }]
};

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