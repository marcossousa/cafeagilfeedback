// Wrap our code in a self-calling closure to isolate scope.
(function() {
 // If the current value of the input is empty, insert the placeholder.
 function populate() {
  var input = jQuery(this);
  if (input.val() == "") {
   input.val(input.attr("placeholder"));
  }
 };

 // If the current value of the input is the placeholder, empty it.
 function depopulate() {
  var input = jQuery(this);
  if (input.val() == input.attr("placeholder")) {
   input.val("");
  }
 };

 // Execute as soon as the document is fully loaded.
 jQuery(function() {
  var inputs = jQuery(":input");

  // Initially, populate the placeholder values.
  inputs.each(populate);

  // When an input receives focus, clear the placeholder value if used.
  inputs.focus(depopulate);

  // When an empty input loses focus, reinsert the placeholder value.
  inputs.blur(populate);

  // Before a form is submitted back, clear the placeholder values as necessary.
  jQuery("form").submit(function() {
   jQuery(":input", this).each(depopulate);
  });
 });
})();