    <script type="text/javascript">
        google.charts.load('current', { packages: [ 'bar' ] });
        google.charts.load("current", { packages: [ 'corechart' ] });
        
        google.charts.setOnLoadCallback(drawHourlyChart);
        google.charts.setOnLoadCallback(drawDailyChart);
        google.charts.setOnLoadCallback(drawMonthlyChart);

        function drawHourlyChart()
        {
            var data = new google.visualization.DataTable();

            data.addColumn('date', '小时');
            data.addColumn('number', '下载');
            data.addColumn('number', '上传');
            data.addColumn('number', '全部');

            data.addRows([
{foreach from=$hourlyGraphData key=key item=value}
                [new {$value.label}, {$value.rx}, {$value.tx}, {$value.total}],
{/foreach}
            ]);

            let options = {
                title: '小时流量图表1',
                orientation: 'horizontal',
                legend: { position: 'right' },
                explorer: { 
                    axis: 'horizontal',
                    maxZoomIn: 4.0,
                    maxZoomOut: 3.0
            	},
                vAxis: {
                    title: '数据',
                    format: '##.## {$hourlyLargestPrefix}'
                },
                hAxis: {
                    title: '小时流量图表2',
                    format: 'HH:mm',
                    direction: -1,
                    ticks: [
{foreach from=$hourlyGraphData key=key item=value}
                        new {$value.label},
{/foreach}
                    ]
                }
            };
            
            var formatDate = new google.visualization.DateFormat({ pattern: 'yyyy-MM-dd HH:mm' });
            formatDate.format(data, 0);
            
            var formatNumber = new google.visualization.NumberFormat({ pattern: '##.## {$hourlyLargestPrefix}' });
            formatNumber.format(data, 1);
            formatNumber.format(data, 2);
            formatNumber.format(data, 3);

            let chart = new google.visualization.BarChart(document.getElementById('hourlyNetworkTrafficGraph'));
            chart.draw(data, google.charts.Bar.convertOptions(options));
        }

        function drawDailyChart()
        {
            var data = new google.visualization.DataTable();

            data.addColumn('date', '天');
            data.addColumn('number', '下载');
            data.addColumn('number', '上传');
            data.addColumn('number', '全部');

            data.addRows([
{foreach from=$dailyGraphData key=key item=value}
                [new {$value.label}, {$value.rx}, {$value.tx}, {$value.total}],
{/foreach}
            ]);
            
            let options = {
                title: '天流量图表',
                orientation: 'horizontal',
                legend: { position: 'right' },
                explorer: { 
                    axis: 'horizontal',
                    maxZoomIn: 4.0,
                    maxZoomOut: 3.0
            	},
                vAxis: {
                    title: '数据',
                    format: '##.## {$dailyLargestPrefix}'
                },
                hAxis: {
                    title: '天流量图表',
                    format: 'yyyy-MM-dd',
                    direction: -1
                }
            };
            
            var formatDate = new google.visualization.DateFormat({ pattern: 'yyyy-MM-dd' });
            formatDate.format(data, 0);
            
            var formatNumber = new google.visualization.NumberFormat({ pattern: '##.## {$dailyLargestPrefix}' });
            formatNumber.format(data, 1);
            formatNumber.format(data, 2);
            formatNumber.format(data, 3);

            let chart = new google.visualization.BarChart(document.getElementById('dailyNetworkTrafficGraph'));
            chart.draw(data, google.charts.Bar.convertOptions(options));
        }

        function drawMonthlyChart()
        {
            var data = new google.visualization.DataTable();

            data.addColumn('date', '月');
            data.addColumn('number', '下载');
            data.addColumn('number', '上传');
            data.addColumn('number', '全部');

            data.addRows([
{foreach from=$monthlyGraphData key=key item=value}
                [new {$value.label}, {$value.rx}, {$value.tx}, {$value.total}],
{/foreach}
            ]);

            let options = {
                title: '月流量图表',
                orientation: 'horizontal',
                legend: { position: 'right' },
                explorer: { 
                    axis: 'horizontal',
                    maxZoomIn: 4.0,
                    maxZoomOut: 3.0
            	},
                vAxis: {
                    title: '数据',
                    format: '##.## {$monthlyLargestPrefix}'
                },
                hAxis: {
                    title: '月流量图表',
                    format: 'YYYY-MM',
                    direction: -1
                }
            };
            
            var formatDate = new google.visualization.DateFormat({ pattern: 'yyyy-MM' });
            formatDate.format(data, 0);
            
            var formatNumber = new google.visualization.NumberFormat({ pattern: '##.## {$monthlyLargestPrefix}' });
            formatNumber.format(data, 1);
            formatNumber.format(data, 2);
            formatNumber.format(data, 3);

            let chart = new google.visualization.BarChart(document.getElementById('monthlyNetworkTrafficGraph'));
            chart.draw(data, google.charts.Bar.convertOptions(options));
        }
    </script>
