ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];

document.addEventListener('DOMContentLoaded', function() {
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
        "words": [
          // { //나중에 사용
          //     "text": "서울시",
          //     "count": "1000"
          //   },
          {
            "text": "강서구",
            "count": "342"
          },
          {
            "text": "동대문구",
            "count": "296"
          },
          {
            "text": "종로구",
            "count": "212"
          },
          {
            "text": "중구",
            "count": "201"
          },
          {
            "text": "용산구",
            "count": "183"
          },
          {
            "text": "성동구",
            "count": "130"
          },
          {
            "text": "광진구",
            "count": "405"
          },
          {
            "text": "중랑구",
            "count": "121"
          },
          {
            "text": "성북구",
            "count": "117"
          },
          {
            "text": "강북구",
            "count": "110"
          },
          {
            "text": "도봉구",
            "count": "103"
          },
          {
            "text": "노원구",
            "count": "98"
          },
          {
            "text": "은평구",
            "count": "95"
          },
          {
            "text": "서대문구",
            "count": "92"
          },
          {
            "text": "마포구",
            "count": "91"
          },
          {
            "text": "양천구",
            "count": "89"
          },
          {
            "text": "구로구",
            "count": "88"
          },
          {
            "text": "금천구",
            "count": "87"
          },
          {
            "text": "영등포구",
            "count": "85"
          },
          {
            "text": "동작구",
            "count": "83"
          },
          {
            "text": "관악구",
            "count": "81"
          },
          {
            "text": "서초구",
            "count": "79"
          },
          {
            "text": "강남구",
            "count": "78"
          },
          {
            "text": "송파구",
            "count": "75"
          },
          {
            "text": "강동구",
            "count": "73"
          },
        ]
      }
    }]
  };

  zingchart.render({
    id: 'myChart',
    data: myConfig,
    height: '100%',
    width: '100%',
  });
});
