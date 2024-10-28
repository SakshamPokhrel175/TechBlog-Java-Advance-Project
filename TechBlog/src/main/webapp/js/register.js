

$(document).ready(function(){
    console.log("loaded.......");

    // Attach the form submit event
	$('#reg-form').on('submit', function(event) {
	    event.preventDefault();  // Correctly preventing form's default behavior
        
        let form = new FormData(this);

        // Hide the submit button and show the loader
        $("#submit-btn").hide();
        $("#loader").show();

        // AJAX request to register servlet
		$.ajax({
		    url: "registerservlet",
		    type: 'post',
		    data: form,
		    success: function(data, textStatus, jqXHR) {
		        console.log(data);  // Log the server response for debugging

		        $("#submit-btn").show();  // Show the submit button
		        $("#loader").hide();      // Hide the loader

		        // Check if the response is 'done' for success
		        if (data.trim() === 'done') {
		            swal("Registered successfully! We are redirecting you to the login page...")
		                .then((value) => {
		                    window.location = "login_page.jsp";
		                });
		        } else {
		            // Show the error message returned from the server
		            swal(data);
		        }
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		        console.log(jqXHR);
		        
		        $("#submit-btn").show();
		        $("#loader").hide();
		        
		        swal("Error during registration.");
		    },
		    processData: false,
		    contentType: false
		});

    });
});
