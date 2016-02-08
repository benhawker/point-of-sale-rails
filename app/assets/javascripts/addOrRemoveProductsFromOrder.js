$(document).ready(function(){
  $("#addNewProduct").click(function() {
    $("#order-items-div").append(createNewInputElement($("#order-items-div")));
  });
});

function createNewInputElement(form) {
  var newIndex = $("#order-items-div").children('input#order-items-entry').length;
  var newInput = $("#order-items-entry").clone().attr('name', generateNewInputName(newIndex));
  newInput.val('');
  return newInput;
};

function generateNewInputName(idx) {
  return "order[order_items_attributes][" + idx + "][product_id]"
};


$(document).ready(function(){
  $("#deleteLastProduct").click(function() {
    if ($("#order-items-div input").length > 1) {
     $("#order-items-div input:last-child").remove();
  }
  });
});
