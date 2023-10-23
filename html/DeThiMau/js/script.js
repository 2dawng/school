// coding implementation
// Function to validate email
function validateEmail(email) {
    // Regular expression pattern for email validation
    var pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  
    return pattern.test(email);
}

// Function to validate rating
function validateRating(rating) {
  // Check if the rating is a valid number between 1 and 5
  return (Number.isFinite(parseFloat(rating)) && parseFloat(rating) >= 1 && parseFloat(rating) <= 5);
}


document.getElementById('submit').addEventListener('click',  function(){

    var email = document.getElementById('email').value;
    var rating = document.getElementById('rate').value;

    var isEmailValid = validateEmail(email);
    var isRatingValid = validateRating(rating);

    if (!isEmailValid || !isRatingValid) {
        if (!isEmailValid) {
            alert('Please enter a valid email address.');
        }
        if (!isRatingValid) {
            alert('Please enter an integer value for the rating.');
        }
    } else {
        alert('Form submitted successfully.');
    }
});

// // end coding implementation