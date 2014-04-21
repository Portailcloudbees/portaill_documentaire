var chart;
			var sArrow;
			var mArrow;
			var hArrow;
			var axis;
			
			AmCharts.ready(function () {
				// clock is just an angular gauge with three arrows
				chart = new AmCharts.AmAngularGauge();
				chart.startDuration = 0.3;
			
				// main face
				axis = new AmCharts.GaugeAxis();
				axis.startValue = 0;
				axis.endValue = 12;
				axis.valueInterval = 1;
				axis.minorTickInterval = 0.2;
				axis.showFirstLabel = false;
				axis.startAngle = 0;
				axis.endAngle = 360;
				axis.axisAlpha = 0.3;
				chart.addAxis(axis);
			
				// seconds face
				var axis2 = new AmCharts.GaugeAxis();
				axis2.startValue = 0;
				axis2.endValue = 60;
				axis2.valueInterval = 15;
				axis2.minorTickInterval = 1;
				axis2.showFirstLabel = false;
				axis2.startAngle = 0;
				axis2.endAngle = 360;
				axis2.radius = 40;
				axis2.centerY = 80;
				axis2.inside = false;
				axis2.axisAlpha = 0.3;
				chart.addAxis(axis2);
			
				// hour arrow
				hArrow = new AmCharts.GaugeArrow();
				hArrow.radius = "50%";
				hArrow.clockWiseOnly = true;
			
				// minutes arrow
				mArrow = new AmCharts.GaugeArrow();
				mArrow.radius = "90%";
				mArrow.startWidth = 6;
				mArrow.nailRadius = 0;
				mArrow.clockWiseOnly = true;
			
				// seconds arrow
				sArrow = new AmCharts.GaugeArrow();
				sArrow.axis = axis2; // this arrow uses different axis
				sArrow.startWidth = 3;
				sArrow.nailRadius = 4;
				sArrow.color = "#CC0000";
				sArrow.clockWiseOnly = true;
			
			
				// update clock before adding arrows to avoid initial animation
				updateClock();
			
				// add arrows
				chart.addArrow(hArrow);
				chart.addArrow(mArrow);
				chart.addArrow(sArrow);
			
				chart.write("chartdiv");
			
				// update clock every second
				setInterval(updateClock, 1000);
			});
			
			// update clock
			function updateClock() {
				// get date
				var date = new Date();
				var hours = date.getHours();
				var minutes = date.getMinutes();
				var seconds = date.getSeconds();
			
				// update hours
				hArrow.setValue(hours + minutes / 60);
				// update minutes
				mArrow.setValue(12 * (minutes + seconds / 60) / 60);
				// update seconds
				sArrow.setValue(date.getSeconds());
			
				// update date
				var dateString = AmCharts.formatDate(date, "DD MMM, EEE");
				axis.setTopText(dateString);
			}
					