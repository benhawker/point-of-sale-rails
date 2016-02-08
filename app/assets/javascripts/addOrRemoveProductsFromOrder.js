// $(document).ready(function() {
//   $("#addNewItem").click(function() {
//   	$("#single-item-div").append(createNewInputElement($("#product-select")));
//   });
// });

// function createNewInputElement(form) {
//   var newIndex = $("#single-item-div").children('input#product-select').length;
//   var newInput = $("#single-item-div").clone().attr('name', generateNewInputNameForProduct(newIndex));
  
//   $("#single-item-div").clone().attr('name', generateNewInputNameForQuantity(newIndex));

//   return newInput;
// };

// function generateNewInputNameForProduct(idx) {
//   return "order[order_items_attributes][" + idx + "][product_id]"
// };

// function generateNewInputNameForQuantity(idx) {
//   return "order[order_items_attributes][" + idx + "][quantity]"
// };

// $(document).ready(function(){
//   $("#deleteLastItem").click(function() {
//     if ($("#items-div").children($("#single-item-div")).length > 1) {
//      $("#items-div #single-item-div").last().remove();
//   	}
//   });
// });

