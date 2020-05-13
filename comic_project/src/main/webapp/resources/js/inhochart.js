var chartdata = {};
var today = new Date();
var yy = today.getFullYear().toString().substr(2,2);
var mm = today.getMonth()+1;
var sendData = { "year" : yy , "month" : mm};
var options = {
	    scales: {
	      xAxes: [{
	    	  ticks: {
		          min: 0,
		          beginAtZero: true
		      }
            }],
	      yAxes: [{
		      ticks: {
		          min: 0,
		          beginAtZero: true
		      }
	      }]
	    },
	    legend: {
	      display: false
	    },
	    elements: {
	      point: {
	        radius: 0
	      }
	    }

};

window.getYearList = function(sendData,lineChartCanvas) {
	$.ajax({
	    async: false,
	    type: 'get',
	    data: sendData,
	    url: "/salesstatistics/getYearlist.json",
	    success: function(data) {
	    	 console.log(data);
	    	 chartdata = {
						month: data.month,
						monthprice: data.monthprice,
	  		}
	    }
	});
	
	
	
	var linedata = {
		    labels: chartdata.month,
		    datasets: [{
		      label: '매출액',
		      data: chartdata.monthprice,
		      backgroundColor: [
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)',
		        'rgba(255, 159, 64, 0.2)'
		      ],
		      borderColor: [
		        'rgba(255,99,132,1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)'
		      ],
		      borderWidth: 1,
		      fill: false
		    }]
	};
		
		var lineChart = new Chart(lineChartCanvas, {
		      type: 'line',
		      data: linedata,
		      options: options
		});
	
}

window.getMonthList = function(sendData, barChartCanvas) {
	
	$.ajax({
	    async: false,
	    type: 'get',
	    data: sendData,
	    url: "/salesstatistics/getMonthlist.json",
	    success: function(data) {
	    	 console.log(data);
	    	 chartdata = {
						day: data.day,
						dayprice: data.dayprice,
	  		}
	    }
	});
	
	
	
	var bardata = {
		    labels: chartdata.day,
		    datasets: [{
		      label: '매출액',
		      data: chartdata.dayprice,
		      backgroundColor: [
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)',
		        'rgba(255, 159, 64, 0.2)',
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)',
		        'rgba(255, 159, 64, 0.2)',
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)',
		        'rgba(255, 159, 64, 0.2)',
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)',
		        'rgba(255, 159, 64, 0.2)',
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)',
		        'rgba(255, 159, 64, 0.2)',
		        'rgba(255, 99, 132, 0.2)'
		      ],
		      borderColor: [
		        'rgba(255,99,132,1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)',
		        'rgba(255,99,132,1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)',
		        'rgba(255,99,132,1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)',
		        'rgba(255,99,132,1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)',
		        'rgba(255,99,132,1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)',
		        'rgba(255,99,132,1)'
		      ],
		      borderWidth: 1,
		      fill: false
		    }]
	};
	
	var barChart = new Chart(barChartCanvas, {
	      type: 'bar',
	      data: bardata,
	      options: options
	});
	
}



window.getProductList = function() {
	var label = [];
	var datas = [];
	$.ajax({
	    async: false,
	    url: "/salesstatistics/getProductlist.json",
	    success: function(data) {
	    	 label = Object.getOwnPropertyNames(data);
	    	 datas = [
	    		 data[label[0]],
	    		 data[label[1]],
	    		 data[label[2]],
	    		 data[label[3]],
	    		 data[label[4]],
	    	 ]
	    }
	});
	
	
	
	var horizontalbardata = {
		    labels: label,
		    datasets: [{
		      label: '매출액',
		      data: datas,
		      backgroundColor: [
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)'
		      ],
		      borderColor: [
		        'rgba(255,99,132,1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)'
		      ],
		      borderWidth: 1,
		      fill: false
		    }]
	};
		
		var horizontalbarChart = new Chart(horizontalbarChartCanvas, {
		      type: 'horizontalBar',
		      data: horizontalbardata,
		      options: options
		});
	
}

window.getRoomList = function() {
	var label = [];
	var datas = [];
	$.ajax({
	    async: false,
	    url: "/salesstatistics/getRoomlist.json",
	    success: function(data) {
	    	 label = Object.getOwnPropertyNames(data);
	    	 datas = [
	    		 data[label[0]],
	    		 data[label[1]],
	    		 data[label[2]],
	    		 data[label[3]],
	    		 data[label[4]],
	    		 data[label[5]]
	    	 ]
	    }
	});
	
	
	
	var horizontalRoombardata = {
		    labels: label,
		    datasets: [{
		      label: '매출액',
		      data: datas,
		      backgroundColor: [
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)',
		        'rgba(255, 159, 64, 0.2)'
		      ],
		      borderColor: [
		        'rgba(255,99,132,1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)'
		      ],
		      borderWidth: 1,
		      fill: false
		    }]
	};
		
		var horizontalRoombarChart = new Chart(horizontalRoombarChartCanvas, {
		      type: 'horizontalBar',
		      data: horizontalRoombardata,
		      options: options
		});
	
}