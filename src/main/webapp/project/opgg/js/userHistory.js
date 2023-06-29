window.addEventListener("DOMContentLoaded", function() {
    const dropBtn = this.document.querySelectorAll(".teamDropBtn");
    const btnArrow = this.document.querySelectorAll(".teamDropBtn img");
    const teamHistory = this.document.querySelectorAll(".contentTeamHistory");

    dropBtn.forEach((e, i) => {
        dropBtn[i].onclick = function() {
            teamHistory[i].classList.toggle("show");
            btnArrow[i].classList.toggle("clicked");
        }
    });
    
    const redArrow = this.document.querySelectorAll(".contentUserHistoryRd .teamDropBtn img");
    redArrow.forEach((e) => {
        e.setAttribute("src", "https://s-lol-web.op.gg/images/icon/icon-arrow-down-red.svg?v=1686296929496");
    });
    
    const damAll =  this.document.querySelectorAll(".damAll");
    const damTxtAll =  this.document.querySelectorAll(".damTxtAll");

    for(let i=0; i<damAll.length; i++) {
        damAll[i].addEventListener("mouseover", () => {
            damTxtAll[i].style.display = "block";
        });
        damAll[i].addEventListener("mouseleave", () => {
            damTxtAll[i].style.display = "none";
        });
    }
    
})

// -----------------------------------------------

const answerArray = ['Win', 'Lost'];

$.fn.createBarchart = function (optionvariables) {
    var chartContainer = $(this);
    var defaults = {
        'maxWidth': 200
    };
    var options = $.extend({}, defaults, optionvariables);
    var self = $(this),
        graphContainer = self.parent().find('.graph-container .graph'),
        barChart = $('<ul/>', { class: 'bar-chart' });
        
    barChart.appendTo(chartContainer);
    
    $.each(answerArray, function(index, value) {
        var chartAnswer = $('<li/>', { class: 'answer-' + index }),
            answerLabel = $('<span/>', { class: 'label', text: value }),
            percentageValue = percentageArray[index].toString(),
            answerPercentage = $('<span/>', { class: 'percentage', text: percentageValue.replace('.', ',') + '%' }),
            barTrack = $('<span/>', { class: 'bar-track' }),
            bar = $('<span />', { class: 'bar', style: 'width: ' + percentageValue + '%;' });
        
        chartAnswer.appendTo(barChart);
        answerLabel.appendTo(chartAnswer);
        answerPercentage.appendTo(chartAnswer);
        barTrack.appendTo(chartAnswer);
        bar.appendTo(barTrack);
    });

    barChart.chart(
        {
            graphContainer: graphContainer
        }
    );
};

$.fn.chart = function (optionvariables) {
    var chart = $(this);
    var defaults = {
        'canvasSize': 200,
        'graphContainer': $('.graph-container .graph')
    };
    var options = $.extend({}, defaults, optionvariables);
    
    return chart.each(function () {
    var listItem = chart.find('li'),
        listItems = listItem.length,
        canvas = document.createElement('canvas'),
        canvasWidth = options.canvasSize,
        canvasHeight = options.canvasSize,
        graphContainer = options.graphContainer,
        total = 0,
        totalPercentage = 0,
        data = [],
        newData = [],
        i = 0,
        startingAngle,
        arcSize,
        endingAngle;

    $.each(percentageArray, function(index, value) {
      newData.push(3.6 * value);
    });
    
    function sumTo(a, i) {
        var sum = 0;
        for (var j = 0; j < i; j++) {
            sum += a[j];
        }
        return sum - 90;
    }
    
    function degreesToRadians(degrees) {
      return ((degrees * Math.PI)/180);
    }
    
    canvas.setAttribute('width', canvasWidth);
    canvas.setAttribute('height', canvasHeight);
    canvas.setAttribute('id', 'chartCanvas');
    graphContainer.append(canvas);
    
    var cvs = document.getElementById('chartCanvas'),
        ctx = cvs.getContext('2d'),
        centerX = canvasWidth / 2,
        centerY = canvasHeight / 2,
        radius = canvasWidth / 2;
    
    ctx.clearRect(0, 0, canvasWidth, canvasHeight);
    
    listItem.each(function(e) {
        startingAngle = degreesToRadians(sumTo(newData, i));
        arcSize = degreesToRadians(newData[i]);
        endingAngle = startingAngle + arcSize;
        ctx.beginPath();
        ctx.moveTo(centerX, centerY);
        ctx.arc(centerX, centerY, radius, startingAngle, endingAngle, false);
        ctx.closePath();
        ctx.fillStyle = $(this).find('.bar').css('backgroundColor');
        ctx.fill();
        ctx.restore();
        i++;
    });
    
        ctx.beginPath();
        ctx.moveTo(centerX, centerY);
        ctx.arc(centerX, centerY, radius * .45, 0, 2 * Math.PI, false);
        ctx.closePath();
        ctx.fillStyle = $('body').css('backgroundColor');
        ctx.fill();
    });
};

$('#live-poll-area .answer-list').createBarchart();