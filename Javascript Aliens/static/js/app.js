// from data.js
var tableData = data;
// YOUR CODE HERE!
// Get a reference to the table body
var tbody = d3.select("tbody");

// Console.log the alien data from data.js
console.log(data);
data.forEach((aliensighting) => {
    var row = tbody.append("tr");
    Object.entries(aliensighting).forEach(([key, value]) => {
      var cell = row.append("td");
      cell.text(value);
    });
  });

// Assign the data from `data.js` to a descriptive variable
var dates = data;

// Select the submit button
var submit = d3.select("#filter-btn");

submit.on("click", function() {

  // Prevent the page from refreshing
  d3.event.preventDefault();

  // Select the input element and get the raw HTML node
  var inputElement = d3.select("#datetime");

  // Get the value property of the input element
  var inputValue = inputElement.property("value");

  console.log(inputValue);
  console.log(dates);

  var filteredData = dates.filter(date => date.datetime == inputValue);

  console.log(filteredData);

  d3.select("tbody");
    Object.entries(filteredData).forEach(() => { 
      var row = tbody.append("tr");
      row.text(`datetime: ${inputValue}`);
    });

});