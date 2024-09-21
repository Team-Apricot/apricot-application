ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];

document.addEventListener('DOMContentLoaded', function() {

  $.ajax({
    url: 'api/v1/policy/word-cloud',
    method: 'GET',
    success: function (api) {
      const words = api.data.map(data => ({
        text: data.districtName,
        count: data.policyCnt
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
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.error('Error fetching word cloud data:', textStatus, errorThrown);
    }
  });
});
