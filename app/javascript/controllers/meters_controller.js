import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    'thisElectricityIndex', 'lastElectricityIndex', 'quantityElectricity', 'electricityPrice', 'totalElectricityPrice',
    'thisWaterIndex', 'lastWaterIndex', 'quantityWater', 'waterPrice', 'totalWaterPrice',
    'amountOfMembers', 'totalSurchargeFee', 'totalFee', 'rent'
  ]
  static values = {
    rent: Number,
    electricityPrice: Number,
    waterPrice: Number,
    surcharge: Number
  }

  calculator(event) {
    var meterId = event.target.options[event.target.selectedIndex].value;
    var _this = this;

    fetch(`/meters/${meterId}/month_information`)
      .then((response) => response.json())
      .then((data) => {
        var lastElectricityIndex = data['last_electricity_index'];
        var lastWaterIndex = data['last_water_index'];
        var thisElectricityIndex = data['this_electricity_index'];
        var thisWaterIndex = data['this_water_index'];
        var quantityElectric = thisElectricityIndex - lastElectricityIndex;
        var quantityWater = thisWaterIndex - lastWaterIndex;
        var totalElectricityPrice = _this.electricityPriceValue * quantityElectric;
        var totalWaterPrice = _this.waterPriceValue * quantityWater;
        var totalSurchargeFee = data['amount_of_members'] * _this.surchargeValue;

        // Electricity
        _this.thisElectricityIndexTarget.innerHTML = thisElectricityIndex;
        _this.lastElectricityIndexTarget.innerHTML = lastElectricityIndex;
        _this.quantityElectricityTarget.innerHTML = quantityElectric;
        _this.electricityPriceTarget.innerHTML = _this.formatVnd(_this.electricityPriceValue);
        _this.totalElectricityPriceTarget.innerHTML = _this.formatVnd(totalElectricityPrice);

        // Water
        _this.thisWaterIndexTarget.innerHTML = thisWaterIndex;
        _this.lastWaterIndexTarget.innerHTML = lastWaterIndex;
        _this.quantityWaterTarget.innerHTML = quantityWater;
        _this.waterPriceTarget.innerHTML = _this.formatVnd(_this.waterPriceValue);
        _this.totalWaterPriceTarget.innerHTML = _this.formatVnd(totalWaterPrice);

        // Surcharge
        _this.amountOfMembersTarget.innerHTML = data['amount_of_members'];
        _this.totalSurchargeFeeTarget.innerHTML = _this.formatVnd(totalSurchargeFee)

        // rent
        _this.rentTarget.innerHTML = _this.formatVnd(_this.rentValue);

        // Total fee
        _this.totalFeeTarget.innerHTML = _this.formatVnd(totalElectricityPrice + totalWaterPrice + totalSurchargeFee + _this.rentValue);
      });
  }

  formatVnd(number) {
    var formatVnd = new Intl.NumberFormat('vi-VN', {
      style: 'currency',
      currency: 'VND',
    });
    return formatVnd.format(number);
  }
}
