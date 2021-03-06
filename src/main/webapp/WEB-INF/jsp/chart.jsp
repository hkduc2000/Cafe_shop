<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "/template/header.jsp"%>

<h2 style="text-align: center;">THỐNG KÊ DOANH THU</h2>
<h3>I. Thống kê doanh thu theo ngày</h3>
<div style="text-align: center;">
    <div id="chart1" class="mx-auto p-4" 
         style="background-color:#fff; width: 80%; height: 40vw;">

    </div>
    <br>
        <button onclick="drawNewChart(1)" class="btn btn-outline-info" style="display: inline-block;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
            </svg>
        </button>
        <button onclick="drawNewChart(-1)" class="btn btn-outline-info" style="display: inline-block;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
            </svg>
        </button>
</div>
<h3>II. Thống kê doanh thu theo tháng</h3>
<div style="text-align: center;">
    <div id="chart2" class="mx-auto p-4" 
         style="background-color:#fff; width: 80%; height: 40vw;">

    </div>
    <br>
        <button onclick="drawNewChart1(1)" class="btn btn-outline-info" style="display: inline-block;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
            </svg>
        </button>
        <button onclick="drawNewChart1(-1)" class="btn btn-outline-info" style="display: inline-block;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
            </svg>
        </button>
</div>
<h3>III. Thống trọng doanh thu theo năm</h3>
<div style="text-align: center;">
    <div id="chart3" class="mx-auto p-4" 
         style="background-color:#fff; width: 80%; height: 40vw;">
    </div>
</div>

<h3>IV. Tỉ trọng doanh thu theo loại sản phẩm</h3>
<div style="text-align: center;">
    <div id="chart4" class="mx-auto p-4" 
         style="background-color:#fff; width: 80%; height: 40vw;">
    </div>
</div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages': ['bar','corechart']});
    google.charts.setOnLoadCallback(function () {
        buildData();
        drawChart(data[0],'chart1');
        drawChart(data1[0], 'chart2');
        drawChart(data2,'chart3');
        drawCategoryChart();
    });

    var input = [
    <c:forEach items="${revenueInfDay}" var="inf">
        ['${inf.getFormattedDay()}', ${inf.revenue}],
    </c:forEach>
    ];  
    var input1 = [
    <c:forEach items="${revenueInfMonth}" var="inf">
        ['${inf.month}/${inf.year}', ${inf.revenue}],
    </c:forEach>
    ];  
    var page = 0;
    var page1 = 0;
    var data = [];
    var data1 = [];
    var data2 ;
    function buildData() {
        var i = ${revenueInfDay.size()};
        while (i > 0) {
            j = Math.max(i - 10, 0);
            var temp = input.slice(j,j+10);
            temp.unshift(['Ngày','Doanh thu']);
            data.push(new google.visualization.arrayToDataTable(temp));
            i = j;
        }
        
        i = ${revenueInfMonth.size()};
        while (i > 0) {
            j = Math.max(i - 10, 0);
            var temp = input1.slice(j,j+10);
            temp.unshift(['Ngày','Doanh thu']);
            data1.push(new google.visualization.arrayToDataTable(temp));
            i = j;
        }
        data2 = new google.visualization.arrayToDataTable([
        ['Ngày','Doanh thu'],
        <c:forEach items="${revenueInfYear}" var="inf">
            ['${inf.year}', ${inf.revenue}],
        </c:forEach>
        ]);
    }
    
    function drawChart(data, chartid) {
        var options = {
            legend: {position: 'none'},
            chart: {
                title: 'Doanh thu',
                subtitle: 'Tính theo từng ngày'},
            axes: {
                x: {
                    0: {side: 'bot', label: 'Thống kê doanh thu (đơn vị VNĐ)'}
                }
            },

            bar: {groupWidth: "90%"}
        };

        var chart = new google.charts.Bar(document.getElementById(chartid));
        // Convert the Classic options to Material options.
        chart.draw(data, google.charts.Bar.convertOptions(options));
    }
    ;
    
    function drawNewChart(state){
        if (page === data.length-1 && state===1) return;
        if (page === 0 && state===-1) return;
        page += state;
        drawChart(data[page],'chart1');
    }
    
    function drawNewChart1(state){
        if (page1 === data1.length-1 && state===1) return;
        if (page1 === 0 && state===-1) return;
        page1 += state;
        drawChart(data1[page1],'chart2');
    }
    
    
    function drawCategoryChart() {

        var data = google.visualization.arrayToDataTable([
          ['Sản phẩm', 'Doanh thu'],
      <c:forEach items="${revenueInfCategory}" var="inf">
          ['${inf.category}', ${inf.revenue}],
      </c:forEach>
        ]);

        var options = {
          title: 'Tỉ trọng doạnh thu các loại sản phẩm'
        };

        var chart = new google.visualization.PieChart(document.getElementById('chart4'));

        chart.draw(data, options);
    }
</script>
<%@ include file = "/template/footer.jsp"%>