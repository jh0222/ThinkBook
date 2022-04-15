var xhr = new XMLHttpRequest();
var url = 'http://api.data.go.kr/openapi/tn_pubr_public_lbrry_api'; /*URL*/
var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'R993xA19ngOTkIaRADWtpTD%2BtY%2BjeUuczNaruh0F9Brm0g5sNBXwJ1bZ5bmVlLRu4kdSBy8MAHmFq%2BrYdkLoQ%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('0'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('100'); /**/
queryParams += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('xml'); /**/
queryParams += '&' + encodeURIComponent('LBRRY_NM') + '=' + encodeURIComponent('꿈이있는나무작은도서관'); /**/
queryParams += '&' + encodeURIComponent('CTPRVN_NM') + '=' + encodeURIComponent('전라북도'); /**/
queryParams += '&' + encodeURIComponent('SIGNGU_NM') + '=' + encodeURIComponent('전주시'); /**/
queryParams += '&' + encodeURIComponent('LBRRY_SE') + '=' + encodeURIComponent('작은도서관'); /**/
queryParams += '&' + encodeURIComponent('CLOSE_DAY') + '=' + encodeURIComponent('매주일요일, 법정공휴일'); /**/
queryParams += '&' + encodeURIComponent('WEEKDAY_OPER_OPEN_HHMM') + '=' + encodeURIComponent('10:00'); /**/
queryParams += '&' + encodeURIComponent('WEEKDAY_OPER_COLSE_HHMM') + '=' + encodeURIComponent('18:00'); /**/
queryParams += '&' + encodeURIComponent('SAT_OPER_OPER_OPEN_HHMM') + '=' + encodeURIComponent('10:00'); /**/
queryParams += '&' + encodeURIComponent('SAT_OPER_CLOSE_HHMM') + '=' + encodeURIComponent('15:00'); /**/
queryParams += '&' + encodeURIComponent('HOLIDAY_OPER_OPEN_HHMM') + '=' + encodeURIComponent('00:00'); /**/
queryParams += '&' + encodeURIComponent('HOLIDAY_CLOSE_OPEN_HHMM') + '=' + encodeURIComponent('00:00'); /**/
queryParams += '&' + encodeURIComponent('SEAT_CO') + '=' + encodeURIComponent('100'); /**/
queryParams += '&' + encodeURIComponent('BOOK_CO') + '=' + encodeURIComponent('12574'); /**/
queryParams += '&' + encodeURIComponent('PBLICTN_CO') + '=' + encodeURIComponent('0'); /**/
queryParams += '&' + encodeURIComponent('NONE_BOOK_CO') + '=' + encodeURIComponent('0'); /**/
queryParams += '&' + encodeURIComponent('LON_CO') + '=' + encodeURIComponent('5'); /**/
queryParams += '&' + encodeURIComponent('LON_DAYCNT') + '=' + encodeURIComponent('14'); /**/
queryParams += '&' + encodeURIComponent('RDNMADR') + '=' + encodeURIComponent('전라북도 전주시 완산구 새터로 122-11'); /**/
queryParams += '&' + encodeURIComponent('OPER_INSTITUTION_NM') + '=' + encodeURIComponent('(사)물댄동산'); /**/
queryParams += '&' + encodeURIComponent('PHONE_NUMBER') + '=' + encodeURIComponent('063-229-6511'); /**/
queryParams += '&' + encodeURIComponent('PLOT_AR') + '=' + encodeURIComponent(''); /**/
queryParams += '&' + encodeURIComponent('BULD_AR') + '=' + encodeURIComponent('347'); /**/
queryParams += '&' + encodeURIComponent('HOMEPAGE_URL') + '=' + encodeURIComponent(''); /**/
queryParams += '&' + encodeURIComponent('LATITUDE') + '=' + encodeURIComponent('35.8351264'); /**/
queryParams += '&' + encodeURIComponent('LONGITUDE') + '=' + encodeURIComponent('127.1206937649'); /**/
queryParams += '&' + encodeURIComponent('REFERENCE_DATE') + '=' + encodeURIComponent('2020-08-31'); /**/
queryParams += '&' + encodeURIComponent('instt_code') + '=' + encodeURIComponent('4640000'); /**/
queryParams += '&' + encodeURIComponent('instt_nm') + '=' + encodeURIComponent('전라북도 전주시'); /**/
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
    }
};

xhr.send('');