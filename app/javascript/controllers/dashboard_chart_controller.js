import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from "chart.js";
import 'chartjs-adapter-date-fns';
import ChartDataLabels from 'chartjs-plugin-datalabels';

Chart.register(...registerables);
Chart.register(ChartDataLabels);

const MONTHS = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

const CHART_COLORS = {
  red: 'rgb(255, 99, 132)',
  orange: 'rgb(255, 159, 64)',
  yellow: 'rgb(255, 205, 86)',
  green: 'rgb(75, 192, 192)',
  blue: 'rgb(54, 162, 235)',
  purple: 'rgb(153, 102, 255)',
  grey: 'rgb(201, 203, 207)'
};

export default class extends Controller {
  static values = {
    summaryBill: Object, default: {},
  };

  connect() {
    this.billChart();
  }

  billChart() {
    this.loadBillChart(this.summaryBillValue)
  }

  statisticSummary(event) {
    let year = event.target.options[event.target.selectedIndex].value;
    fetch(`/statistic_summary?year=${year}`)
      .then((response) => response.json())
      .then((data) => {
        this.loadBillChart(data['summary_bill'])
      });
  }

  loadBillChart(result) {
    let billChartId = document.getElementById('bill-chart');
    this.destroyChart(billChartId);
    var datasetBill = [];
    var index = 0
    for (const [costType, costs] of Object.entries(result)) {
      var dataItem = {
        label: costType,
        data: costs,
        backgroundColor: [
          Object.values(CHART_COLORS)[index]
        ],
        borderWidth: 1
      }
      datasetBill.push(dataItem);
      index += 1
    }
    const data = {
      labels: MONTHS,
      datasets: datasetBill
    };

    new Chart(billChartId, {
      type: 'bar',
      data: data,
      options: {
        scales: {
          x: {
            stacked: true
          },
          y: {
            stacked: true,
            beginAtZero: true
          }
        },
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              top: 30,
              font: {
                size: 14
              }
            }
          },
          datalabels: {
            display: true,
            font: {
              size: 12,
              weight: 'bold'
            },
            anchor: 'end',
            align: 'start',
            offset: -20,
            formatter: function (value, context) {
              const chart = context.chart;
              const dataIndex = context.dataIndex;
              const datasetIndex = context.datasetIndex;
              const datasets = chart.data.datasets;

              if (datasetIndex !== datasets.length - 1) {
                return null;
              }
              const total = datasets.reduce((sum, dataset) => {
                return sum + dataset.data[dataIndex];
              }, 0);

              return total > 0 ? total.toLocaleString('vi-VN') : null;
            }
          }
        }
      }
    });
  }

  destroyChart(chartId) {
    let chartStatus = Chart.getChart(chartId);
    if (chartStatus != undefined) {
      chartStatus.destroy();
    }
  }
}
